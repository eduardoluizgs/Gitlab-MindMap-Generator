using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;

namespace GitlabMindMapGenerator
{
    class Program
    {
        static IConfiguration Configuration { get; set; }

        static string GitlabUrl;
        static string GitlabApiUrl;
        static string GitlabApiToken;
        static string GitlabApiIssuesUrl;
        static string GitlabProjectLabel;
        static HttpClient GitlabApiHttpClient;
        static List<Issue> Issues = new List<Issue>();
        static List<string> GitlabProjectIDs = new List<string>();
        static List<string> GitlabNodeLabels = new List<string>();
        static List<FreeMindNode> FreeMindMapNodes = new List<FreeMindNode>();
        static bool HasError = false;

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

                if (HasError)
                    Console.WriteLine("MindMap generated with error. Please, see log!");
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

            // get configs
            GitlabUrl = Configuration.GetValue<string>($"Gitlab:Url");
            GitlabApiUrl = Configuration.GetValue<string>($"Gitlab:ApiUrl");
            GitlabApiToken = Configuration.GetValue<string>($"Gitlab:ApiToken");
            GitlabApiIssuesUrl = Configuration.GetValue<string>($"Gitlab:ApiIssuesUrl");
            Configuration.GetSection($"Gitlab:ProjectIDs").Bind(GitlabProjectIDs);
            GitlabProjectLabel = Configuration.GetValue<string>($"Gitlab:ProjectLabel");
            Configuration.GetSection($"Gitlab:NodeLabels").Bind(GitlabNodeLabels);
            
            if (
                GitlabUrl == null || 
                GitlabApiUrl == null || 
                GitlabApiToken == null || 
                GitlabApiIssuesUrl == null || 
                GitlabProjectIDs.Count == 0 || 
                GitlabProjectLabel == null || 
                GitlabNodeLabels.Count == 0
            )
            {
                Console.WriteLine($@"The configuration is invalid in `AppSettings.json`. Please, review configuration file and try again.");
                return false;
            }

            return true;
        }

        static void ConfigureHttpClients()
        {
            GitlabApiHttpClient = new HttpClient();
            GitlabApiHttpClient.BaseAddress = new Uri(GitlabUrl + GitlabApiUrl);
            GitlabApiHttpClient.DefaultRequestHeaders.Accept.Clear();
            GitlabApiHttpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json")
            );
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
            foreach(var projectId in GitlabProjectIDs)
            {
                var content = await GetIssueAsync(
                    GitlabApiUrl + 
                    String.Format(GitlabApiIssuesUrl, WebUtility.UrlEncode(projectId)) + 
                    String.Format("?labels={0}", GitlabProjectLabel)
                );

                if (content == null) continue;

                var tempIssues = JsonConvert.DeserializeObject<List<Issue>>(content);

                if (tempIssues.Count > 0) {
                    Issues.AddRange(tempIssues);
                }
            }
        }

        static async Task GetIssues(Issue issue)
        {
            List<Issue> issues = new List<Issue>();

            foreach(IssueNode node in issue.GetNodes())
            {
                var content = await GetIssueAsync(
                    GitlabApiUrl + 
                    String.Format(GitlabApiIssuesUrl, WebUtility.UrlEncode(node.ProjectReference)) +
                    $"/{node.IID}"
                );

                if (content == null) continue;

                var tempIssue = JsonConvert.DeserializeObject<Issue>(content);
                issue.Issues.Add(tempIssue);
                
                await GetIssues(tempIssue);
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
                return new StreamReader(stream, Encoding.UTF8).ReadToEnd();
            }
            catch (System.Exception e)
            {
                Console.WriteLine($"Error to get issue in {GitlabUrl}: {e.Message}");
                throw;
            }
        }

        static void WriteMindMap()
        {
            FreeMindWriter mindMap = new FreeMindWriter(
                "/Users/eduardo/Projetos/gitlab-mindmap-generator/Generated/FreeMindMap.mm"
            );

            foreach(Issue issue in Issues)
            {
                AddNode(issue, mindMap.Nodes);
            }

            mindMap.BuldMindMap();
        }

        static void AddNode(Issue issue, List<FreeMindNode> mindMapNodes)
        {
            List<string> icons = new List<string>();

            if (issue.TaskPercentage == 0)
                icons.Add("button_cancel");
            if (issue.TaskPercentage == 100)
                icons.Add("button_ok");

            // create parent node
            FreeMindNode node = new FreeMindNode(
                text: $"{issue.Title} ({issue.TaskPercentage}%)",
                link: issue.URL,
                position: FreeMindPosition.Right,
                icons: icons
            );            
            mindMapNodes.Add(node);

            // crate child nodes
            foreach(Issue childIssue in issue.Issues)
            {
                AddNode(childIssue, node.Nodes);
            }            
        }
    }
}
