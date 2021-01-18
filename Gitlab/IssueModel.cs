using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using Newtonsoft.Json;

namespace GitlabMindMapGenerator
{
    /// <summary>
    /// {
    ///     "id": 76969019,
    ///     "iid": 1,
    ///     "project_id": 23560828,
    ///     "title": "PJT1: Gitlab MindMap Generator",
    ///     "description": "",
    ///     "state": "opened",
    ///     "created_at": "2021-01-09T22:50:37.703Z",
    ///     "updated_at": "2021-01-10T01:42:56.027Z",
    ///     "closed_at": null,
    ///     "closed_by": null,
    ///     "labels": ["Project"],
    ///     "milestone": null,
    ///     "assignees": [],
    ///     "author":
    ///     {
    ///         "id": 3295819,
    ///         "name": "Eduardo Luiz",
    ///         "username": "eduardoluizgs",
    ///         "state": "active",
    ///         "avatar_url": "https://secure.gravatar.com/avatar/17d21b0265cf0f2ce8b14b53339bc4bf?s=80u0026d=identicon",
    ///         "web_url": "https://gitlab.com/eduardoluizgs"
    ///     },
    ///     "assignee": null,
    ///     "user_notes_count": 0,
    ///     "merge_requests_count": 0,
    ///     "upvotes": 0,
    ///     "downvotes": 0,
    ///     "due_date": null,
    ///     "confidential": false,
    ///     "discussion_locked": null,
    ///     "web_url": "https://gitlab.com/eduardoluizgs/gitlab-mindmap-generator/-/issues/1",
    ///     "time_stats":
    ///     {
    ///         "time_estimate": 0,
    ///         "total_time_spent": 0,
    ///         "human_time_estimate": null,
    ///         "human_total_time_spent": null
    ///     },
    ///     "task_completion_status":
    ///     {
    ///         "count": 10,
    ///         "completed_count": 2
    ///     },
    ///     "weight": null,
    ///     "blocking_issues_count": 0,
    ///     "has_tasks": true,
    ///     "task_status": "2 of 10 tasks completed",
    ///     "_links":
    ///     {
    ///         "self": "https://gitlab.com/api/v4/projects/23560828/issues/1",
    ///         "notes": "https://gitlab.com/api/v4/projects/23560828/issues/1/notes",
    ///         "award_emoji": "https://gitlab.com/api/v4/projects/23560828/issues/1/award_emoji",
    ///         "project": "https://gitlab.com/api/v4/projects/23560828"
    ///     },
    ///     "references":
    ///     {
    ///         "short": "#1",
    ///         "relative": "#1",
    ///         "full": "eduardoluizgs/gitlab-mindmap-generator#1"
    ///     },
    ///     "moved_to_id": null,
    ///     "service_desk_reply_to": null,
    ///     "health_status": null
    /// }
    /// </summary>
    public class Issue
    {
        [JsonProperty("id")]
        public int ID { get; set; }

        [JsonProperty("iid")]
        public int IID { get; set; }

        [JsonProperty("title")]
        public string Title { get; set; }

        [JsonProperty("description")]
        public string Description { get; set; }

        [JsonProperty("web_url")]
        public string WebURL { get; set; }

        [JsonProperty("task_completion_status")]
        public IssueTaskCompletionStatus TaskCompletionStatus { get; set; }

        public Decimal TaskPercentage
        {
            get {
                Decimal percentage = 0;
                if (this.TaskCompletionStatus.CompletedCount > 0 && this.TaskCompletionStatus.Count > 0) {
                    percentage = Math.Round(((Convert.ToDecimal(this.TaskCompletionStatus.CompletedCount) / Convert.ToDecimal(this.TaskCompletionStatus.Count)) * 100), 0);
                }
                return percentage;
            }
        }

        public List<Issue> Issues;

        public Issue()
        {
            Issues = new List<Issue>();
        }

        public List<IssueNode> GetNodes(string pattern)
        {
            List<IssueNode> nodes = new List<IssueNode>();
            
            // TODO : Capturar expressoes da configuracao
            MatchCollection matches = Regex.Matches(
                this.Description,
                pattern,
                RegexOptions.Compiled | RegexOptions.IgnoreCase
            );
            foreach (Match match in matches)
            {
                Match issueIidMatch = Regex.Match(match.Groups[0].Value, @"(?<=#).*?(?=\))");
                Match titleMatch = Regex.Match(match.Groups[0].Value, @"(?<=\[).*?(?=\])");
                Match projectReferenceMatch = Regex.Match(match.Groups[0].Value, @"(?<=\().*?(?=#)");

                if (issueIidMatch.Value != "" && titleMatch.Value != "" && projectReferenceMatch.Value != "")
                {
                    nodes.Add(
                        new IssueNode(
                            Convert.ToInt32(issueIidMatch.Value),
                            titleMatch.Value,
                            projectReferenceMatch.Value
                        )
                    );
                }
            }            

            return nodes;
        }

    }

    public class IssueNode
    {
        public int IID { get; set; }
        public string Title { get; set; }
        public string ProjectReference { get; set; }

        public IssueNode(int iid, string title, string projectReference)
        {
            IID = iid;
            Title = title;
            ProjectReference = projectReference;
        }
    }

    public class IssueTaskCompletionStatus
    {
        [JsonProperty("count")]
        public int Count { get; set; }

        [JsonProperty("completed_count")]
        public int CompletedCount { get; set; }                
    }
}
