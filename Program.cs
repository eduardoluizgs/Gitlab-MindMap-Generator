﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace GitlabMindMapGenerator
{
    class Program
    {
        static IConfiguration Configuration { get; set; }
        static List<Issue> Issues = new List<Issue>();
        static List<FreeMindNode> FreeMindMapNodes = new List<FreeMindNode>();
        static HttpClient GitlabApiHttpClient;
        static bool HasError = false;
        static GitlabSettings GitlabSettings = new GitlabSettings();
        static MindMapSetting MindMapSettings = new MindMapSetting();
        static string InvalidSettingMessage = "The configuration `{0}` is invalid. Please, review AppSettings.json file and try again.";

        static async Task Main(string[] args)
        {
            try
            {
                // Get Configs
                if (!GetConfiguration())
                    Environment.Exit(1);

                ConfigureHttpClients();
                await GetMindMapContent();
                WriteMindMap();

                if (HasError) {
                    Console.WriteLine("MindMap generated with ERROR. Please, see log!");
                } else {
                    Console.WriteLine("MindMap generated with success!");
                }
            }
            catch (System.Exception e)
            {
                Console.WriteLine(e.Message);
                throw;
            }
        }

        static bool GetConfiguration()
        {
            // read configuration
            string configFile = "AppSettings.json";
            string configBasePath = Directory.GetCurrentDirectory();

            if (!File.Exists(Path.Join(configBasePath, configFile))) {
                Console.WriteLine($@"The file `AppSettings.json` is not found. Please, make a copy of file for the root path and try again.");
                return false;
            }

            Configuration = new ConfigurationBuilder()
                .SetBasePath(configBasePath)
                .AddJsonFile(configFile)
                .Build();

            Configuration.Bind("Gitlab", GitlabSettings);
            Configuration.Bind("MindMap", MindMapSettings);

            // Validate general settings
            string[] settings = new string[] {
                "Url",
                "ApiUrl",
                "ApiToken",
                "ApiIssuesUrl",
                "ProjectLabel",
                "NodesPattern"
            };

            foreach(string setting in settings)
            {
                if (!ValidateStringSetting(GitlabSettings, setting))
                    return false;
            }

            // Validate project ID's setting
            if (GitlabSettings.ProjectIDs.Count == 0) {
                Console.WriteLine(String.Format(InvalidSettingMessage, "GitlabProjectIDs"));
                return false;
            }

            return true;
        }

        static bool ValidateStringSetting(ISettings settings, string key)
        {
            Type myType = settings.GetType();
            PropertyInfo myPropInfo = myType.GetProperty(key);

            if (myPropInfo == null || myPropInfo.GetValue(settings, null) == null) {
                Console.WriteLine(String.Format(InvalidSettingMessage, key));
                return false;
            }

            return true;
        }

        static void ConfigureHttpClients()
        {
            GitlabApiHttpClient = new HttpClient();
            GitlabApiHttpClient.BaseAddress = new Uri(GitlabSettings.Url + GitlabSettings.ApiUrl);
            GitlabApiHttpClient.DefaultRequestHeaders.Accept.Clear();
            GitlabApiHttpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json")
            );
            GitlabApiHttpClient.DefaultRequestHeaders.Add("Private-Token", GitlabSettings.ApiToken);
        }

        static async Task GetMindMapContent()
        {
            await GetProjects();
            foreach(var issue in Issues) {
                await GetIssues(issue);
            }
        }

        static async Task GetProjects()
        {
            foreach(var projectId in GitlabSettings.ProjectIDs)
            {
                var content = await GetIssueAsync(
                    GitlabSettings.ApiUrl +
                    String.Format(GitlabSettings.ApiIssuesUrl, WebUtility.UrlEncode(projectId)) +
                    String.Format("?labels={0}", GitlabSettings.ProjectLabel)
                );

                if (content == null) continue;

                var tempIssues = JsonConvert.DeserializeObject<List<Issue>>(content);

                if (tempIssues.Count > 0) {
                    foreach(Issue issue in tempIssues) {
                        await GetIssueMergeRequests(issue);
                    }
                    Issues.AddRange(tempIssues);
                }
            }
        }

        static async Task GetIssues(Issue issue)
        {
            List<Issue> issues = new List<Issue>();

            foreach(IssueNode node in issue.GetNodesInDescription(GitlabSettings.NodesPattern))
            {
                // get issue content
                var content = await GetIssueAsync(
                    GitlabSettings.ApiUrl +
                    String.Format(
                        GitlabSettings.ApiIssuesUrl,
                        WebUtility.UrlEncode(node.ProjectReference)
                    ) +
                    $"/{node.IID}"
                );
                if (content == null)
                    continue;

                var tempIssue = JsonConvert.DeserializeObject<Issue>(content);

                await GetIssueMergeRequests(tempIssue);

                issue.Issues.Add(tempIssue);

                await GetIssues(tempIssue);
            }
        }

        static async Task GetIssueMergeRequests(Issue issue)
        {
            // get merge request from issue
            var content = await GetIssueAsync(
                GitlabSettings.ApiUrl +
                String.Format(
                    GitlabSettings.ApiMergeRequestUrl,
                    WebUtility.UrlEncode(issue.ProjectID.ToString()),
                    issue.IID
                )
            );
            if (content == null)
                return;

            var tempMergeRequests = JsonConvert.DeserializeObject<List<MergeRequest>>(content);

            if (tempMergeRequests.Count > 0) {
                issue.MergeRequests.AddRange(tempMergeRequests);
            }
        }

        static async Task<string> GetIssueAsync(string url)
        {
            try
            {
                Console.WriteLine($"Getting issue on {url}");
                HttpResponseMessage response = await GitlabApiHttpClient.GetAsync(url);
                if (!response.IsSuccessStatusCode) {
                    HasError = true;
                    if (response.StatusCode == HttpStatusCode.NotFound) {
                        Console.WriteLine($"Issue not found: {url}");
                        return null;
                    } else {
                        response.EnsureSuccessStatusCode();
                    }
                }
                var stream = await response.Content.ReadAsStreamAsync();
                var streamString = new StreamReader(stream, Encoding.UTF8).ReadToEnd();
                return streamString;
            }
            catch (System.Exception e)
            {
                Console.WriteLine($"Error to get issue in {GitlabSettings.Url}: {e.Message}");
                throw;
            }
        }

        static void WriteMindMap()
        {
            FreeMindWriter mindMap = new FreeMindWriter(
                Path.Join(Directory.GetCurrentDirectory(), "Output", "FreeMindMap.mm")
            );

            foreach(Issue issue in Issues)
            {
                AddNode(issue, mindMap.Nodes);
            }

            mindMap.BuldMindMap();
        }

        static void AddNode(Issue issue, List<FreeMindNode> mindMapNodes)
        {
            List<FreeMindNodeIcon> icons = new List<FreeMindNodeIcon>();
            List<FreemindAttribute> attributes = new List<FreemindAttribute>();
            List<FreemindAttribute> attributesStages = new List<FreemindAttribute>();
            FreeMindNodeStyle nodeStyle;
            GitlabLabelMappingSetting label = null;

            // get issue label object
            if (GitlabSettings.LabelMapping != null) {
                label = GitlabSettings.LabelMapping.FirstOrDefault(
                    map => issue.Labels.FirstOrDefault(label => label == map?.Label) != null
                );
            }

            // Issue status logic
            if (issue.TaskCompletionPercentage == 100) {
                icons.Add(new FreeMindNodeIcon("button_ok"));
                nodeStyle = GetNodeStyleDone();
            } else if (issue.TaskCompletionPercentage > 0 || issue.TaskCompletionAvarage > 0) {
                icons.Add(new FreeMindNodeIcon("forward"));
                nodeStyle = GetNodeStyleRunning();
            } else {
                icons.Add(new FreeMindNodeIcon("hourglass"));
                nodeStyle = GetNodeStyleWaiting();
            }

            // set style of node
            SetNodeStyle(issue, nodeStyle);

            // Isseu label
            if (label != null) {
                icons.Add(new FreeMindNodeIcon(label.Icon));
            }

            // Issue icons
            foreach(string icon in issue.MindMapNode.Style.Icons)
            {
                icons.Add(new FreeMindNodeIcon(icon));
            }

            // Issue attributes
            attributes.Add(new FreemindAttribute("State", issue.State));
            attributes.Add(new FreemindAttribute("Board Stage", issue.GetStageInBoard(GitlabSettings.IssueBoardStages) ?? ""));
            attributes.Add(new FreemindAttribute("% Done", $"{issue.TaskCompletionPercentage}%"));
            attributes.Add(new FreemindAttribute("Task Count", issue.TaskCount.ToString()));
            attributes.Add(new FreemindAttribute("Task Done", issue.TaskCompletedCount.ToString()));
            attributes.Add(new FreemindAttribute("Due Date", (issue.DueDate != null ? ((DateTime)issue.DueDate).ToString("dd/MM/yyyy") : "")));
            attributes.Add(new FreemindAttribute("Estimate", issue.TimeStats?.TimeEstimateHuman ?? ""));
            attributes.Add(new FreemindAttribute("Spent", issue.TimeStats?.TimeSpentHuman ?? ""));
            attributes.Add(new FreemindAttribute("Remais", issue.TimeStats?.TimeRemainsHuman));
            attributes.Add(new FreemindAttribute("Extra", issue.TimeStats?.TimeExtraHuman));
            attributes.Add(new FreemindAttribute("Milestone", issue.Milestone?.Title ?? ""));
            attributes.Add(new FreemindAttribute("Assignee", issue.Assignee?.Name ?? ""));
            attributes.Add(new FreemindAttribute("Labels", String.Join(", ", issue.Labels)));
            attributes.Add(new FreemindAttribute("URL", issue.WebURL));
            attributes.Add(new FreemindAttribute("Reference", issue.References?.Full ?? ""));

            // create parent node
            FreeMindNode node = new FreeMindNode(
                text: $"{issue.Title} - #{issue.IID} ({issue.TaskCompletion} - {issue.TaskCompletionPercentage}%)",
                link: issue.WebURL,
                folded: issue.MindMapNode.Folded,
                cloud: issue.MindMapNode.Cloud,
                position: FreeMindPosition.Right,
                style: nodeStyle,
                icons: icons,
                attributes: attributes
            );
            mindMapNodes.Add(node);

            // create stage nodes
            if (label.Label == GitlabSettings.LabelTask) {
                SetIssueStatesNodes(issue, node);
            }

            // crate child nodes
            foreach(Issue childIssue in issue.Issues)
            {
                AddNode(childIssue, node.Nodes);
            }
        }

        static void SetIssueStatesNodes(Issue issue, FreeMindNode node)
        {
            IssueStage stage;

            foreach(var settingStage in GitlabSettings.IssueStages)
            {
                List<FreeMindNodeIcon> stageIcons = new List<FreeMindNodeIcon>();

                if (settingStage.Pattern == "[Reviewed]") {
                    stage = issue.GetStageReview();
                    if (stage != null) {

                        if (stage.Done) {
                            stageIcons.Add(new FreeMindNodeIcon("button_ok"));
                        } else {
                            stageIcons.Add(new FreeMindNodeIcon("help"));
                        }

                        node.Nodes.Add(new FreeMindNode(
                            text: $"{settingStage.Title}",
                            folded: true,
                            style: GetNodeStyle(),
                            icons: stageIcons
                        ));
                    }
                } else {
                    stage = issue.GetStageInDescription(settingStage.Pattern);
                    if (stage != null) {

                        if (stage.Done) {
                            stageIcons.Add(new FreeMindNodeIcon("button_ok"));
                        } else {
                            stageIcons.Add(new FreeMindNodeIcon("help"));
                        }

                        node.Nodes.Add(new FreeMindNode(
                            text: $"{settingStage.Title}",
                            folded: false,
                            style: GetNodeStyle(),
                            icons: stageIcons
                        ));
                    }
                }
            }
        }

        static void SetNodeStyle(Issue issue, FreeMindNodeStyle style)
        {
            style.FontName = issue.MindMapNode.Style.FontName ?? style.FontName;
            style.FontSize = issue.MindMapNode.Style.FontSize ?? style.FontSize;
            style.FontColor = issue.MindMapNode.Style.FontColor ?? style.FontColor;
            style.BackgroundColor = issue.MindMapNode.Style.BackgroundColor ?? style.BackgroundColor;
            style.BorderColor = issue.MindMapNode.Style.BorderColor ?? style.BorderColor;
            style.Bold = issue.MindMapNode.Style.Bold || false;
        }

        static FreeMindNodeStyle GetNodeStyle()
        {
            return new FreeMindNodeStyle(
                 MindMapSettings.NodeStyle.FontName,
                 MindMapSettings.NodeStyle.FontSize,
                 MindMapSettings.NodeStyle.FontColor,
                 MindMapSettings.NodeStyle.BackgroundColor,
                 MindMapSettings.NodeStyle.BorderColor,
                 bold: false
            );
        }

        static FreeMindNodeStyle GetNodeStyleWaiting()
        {
            return new FreeMindNodeStyle(
                 MindMapSettings.NodeStyleWaiting.FontName ?? MindMapSettings.NodeStyle.FontName,
                 MindMapSettings.NodeStyleWaiting.FontSize ?? MindMapSettings.NodeStyle.FontSize,
                 MindMapSettings.NodeStyleWaiting.FontColor ?? MindMapSettings.NodeStyle.FontColor,
                 MindMapSettings.NodeStyleWaiting.BackgroundColor ?? MindMapSettings.NodeStyle.BackgroundColor,
                 MindMapSettings.NodeStyleWaiting.BorderColor ?? MindMapSettings.NodeStyle.BorderColor,
                 bold: false
            );
        }

        static FreeMindNodeStyle GetNodeStyleRunning()
        {
            return new FreeMindNodeStyle(
                 MindMapSettings.NodeStyleRunning.FontName ?? MindMapSettings.NodeStyle.FontName,
                 MindMapSettings.NodeStyleRunning.FontSize ?? MindMapSettings.NodeStyle.FontSize,
                 MindMapSettings.NodeStyleRunning.FontColor ?? MindMapSettings.NodeStyle.FontColor,
                 MindMapSettings.NodeStyleRunning.BackgroundColor ?? MindMapSettings.NodeStyle.BackgroundColor,
                 MindMapSettings.NodeStyleRunning.BorderColor ?? MindMapSettings.NodeStyle.BorderColor,
                 bold: false
            );
        }

        static FreeMindNodeStyle GetNodeStyleDone()
        {
            return new FreeMindNodeStyle(
                 MindMapSettings.NodeStyleDone.FontName ?? MindMapSettings.NodeStyle.FontName,
                 MindMapSettings.NodeStyleDone.FontSize ?? MindMapSettings.NodeStyle.FontSize,
                 MindMapSettings.NodeStyleDone.FontColor ?? MindMapSettings.NodeStyle.FontColor,
                 MindMapSettings.NodeStyleDone.BackgroundColor ?? MindMapSettings.NodeStyle.BackgroundColor,
                 MindMapSettings.NodeStyleDone.BorderColor ?? MindMapSettings.NodeStyle.BorderColor,
                 bold: false
            );
        }
    }
}
