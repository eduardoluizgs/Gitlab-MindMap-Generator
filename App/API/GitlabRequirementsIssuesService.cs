
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace GitlabMindMapGenerator
{
    public class GitlabRequirementsIssuesService
    {
        public GitlabSettings GitlabSettings = new GitlabSettings();
        static List<Issue> Issues = new List<Issue>();
        static HttpClient GitlabApiHttpClient;

        public GitlabRequirementsIssuesService(GitlabSettings gitlabSettings)
        {
            GitlabSettings = gitlabSettings;

            ConfigureHttpClients();
        }

        private void ConfigureHttpClients()
        {
            GitlabApiHttpClient = new HttpClient();
            GitlabApiHttpClient.BaseAddress = new Uri(GitlabSettings.Url + GitlabSettings.ApiUrl);
            GitlabApiHttpClient.DefaultRequestHeaders.Accept.Clear();
            GitlabApiHttpClient.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json")
            );
            GitlabApiHttpClient.DefaultRequestHeaders.Add("Private-Token", GitlabSettings.ApiToken);
        }

        public async Task<List<Issue>> GetIssuesAll()
        {
            await GetProjects();
            foreach(var issue in Issues) {
                await GetIssues(issue);
            }
            return Issues;
        }

        public async Task GetProjects()
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

        public async Task GetIssues(Issue issue)
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

        public async Task GetIssueMergeRequests(Issue issue)
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

        private async Task<string> GetIssueAsync(string url)
        {
            HttpResponseMessage response = await GitlabApiHttpClient.GetAsync(url);
            if (!response.IsSuccessStatusCode) {
                if (response.StatusCode == HttpStatusCode.NotFound) {
                    return null;
                } else {
                    response.EnsureSuccessStatusCode();
                }
            }
            var stream = await response.Content.ReadAsStreamAsync();
            var streamString = new StreamReader(stream, Encoding.UTF8).ReadToEnd();
            return streamString;
        }
    }
}
