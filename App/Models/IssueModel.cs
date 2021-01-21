using System;
using System.Collections.Generic;
using System.Linq;
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

        public string _description;

        [JsonProperty("description")]
        public string Description {
            get {
                return _description;
            }
            set {
                _description = value;
                this.ExtractDescriptionInfos();
            }
        }

        [JsonProperty("web_url")]
        public string WebURL { get; set; }

        [JsonProperty("state")]
        public string State { get; set; }

        [JsonProperty("labels")]
        public string[] Labels { get; set; }

        [JsonProperty("time_stats")]
        public IssueTimeStats TimeStats { get; set; }

        [JsonProperty("milestone")]
        public IssueMilestone Milestone { get; set; }

        [JsonProperty("assignee")]
        public IssueAssignee Assignee { get; set; }

        [JsonProperty("references")]
        public IssueReferences References { get; set; }

        [JsonProperty("task_completion_status")]
        private IssueTaskCompletionStatus TaskCompletionStatus { get; set; }

        public int TaskCount {
            get {
                int count = 0;

                // if issue have childs, count is calculated from childs
                if (this.Issues.Count > 0) {
                    count = this.Issues.Count;
                } else {
                    count = this.TaskCompletionStatus.Count;
                }

                return count;
            }
        }

        public int TaskCompletedCount
        {
            get {
                int completedCount = 0;

                // if issue have childs, completed count is calculated from childs
                if (this.Issues.Count > 0) {
                    completedCount = this.Issues.Sum(x => (x.TaskCompletionPercentage == 100 ? 1 : 0));
                } else {
                    completedCount = this.TaskCompletionStatus.CompletedCount;
                }

                return completedCount;
            }
        }

        public string TaskCompletion
        {
            get {
                return $"{this.TaskCompletedCount}/{this.TaskCount}";
            }
        }

        public Decimal TaskCompletionPercentage
        {
            get {
                // Decimal percentage = 0;

                // // if issue have childs, percentagem is calculated from childs
                // if (this.Issues.Count > 0) {
                //     percentage = Math.Round(Convert.ToDecimal(this.Issues.Sum(x => Convert.ToInt32(x.TaskCompletionPercentage)) / this.Issues.Count), 0);
                // } else {
                //     if (this.TaskCompletionStatus.CompletedCount > 0 && this.TaskCompletionStatus.Count > 0) {
                //         percentage = Math.Round(((Convert.ToDecimal(this.TaskCompletionStatus.CompletedCount) / Convert.ToDecimal(this.TaskCompletionStatus.Count)) * 100), 0);
                //     }
                // }

                // return percentage;
                return Math.Round(((Convert.ToDecimal(this.TaskCompletedCount) / Convert.ToDecimal(this.TaskCount)) * 100), 0);
            }
        }

        public IssueMindMapNode MindMapNode { get; set; }
        public List<Issue> Issues { get; set; }

        public Issue()
        {
            Issues = new List<Issue>();
            List<IssueNode> Nodes = new List<IssueNode>();
        }

        public List<IssueNode> GetNodes(string pattern)
        {
            List<IssueNode> nodes = new List<IssueNode>();

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

        private void ExtractDescriptionInfos()
        {
            // Mindmap node settings
            Match matchIcons = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Icons\*\*\:\s).*?(?=\n|$)");
            Match matchFontName = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Font\-Name\*\*\:\s).*?(?=\n|$)");
            Match matchFontSize = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Font\-Size\*\*\:\s).*?(?=\n|$)");
            Match matchFontColor = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Font\-Color\*\*\:\s).*?(?=\n|$)");
            Match matchFontBold = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Font\-Bold\*\*\:\s).*?(?=\n|$)");
            Match matchBackgroundColor = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Background\-Color\*\*\:\s).*?(?=\n|$)");
            Match matchBorderColor = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Border\-Color\*\*\:\s).*?(?=\n|$)");
            Match matchFolded = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Folded\*\*\:\s).*?(?=\n|$)");
            Match matchCloud = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Node\-Cloud\*\*\:\s).*?(?=\n|$)");

            this.MindMapNode = new IssueMindMapNode(
                style: new IssueMindMapNodeStyle(
                    matchIcons.Value.Split(",", StringSplitOptions.RemoveEmptyEntries) ?? null,
                    matchFontName.Value ?? null,
                    matchFontSize.Value ?? null,
                    matchFontColor.Value ?? null,
                    matchBackgroundColor.Value ?? null,
                    matchBorderColor.Value ?? null,
                    (matchFontBold.Value == "Yes")
                ),
                folded: (matchFolded.Value == "Yes"),
                cloud: (matchCloud.Value == "Yes")
            );
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

    public class IssueTimeStats
    {
        [JsonProperty("time_estimate")]
        public Int64 TimeEstimate { get; set; }

        [JsonProperty("total_time_spent")]
        public Int64 TimeSpent { get; set; }

        public Int64 TimeRemains {
            get {
                return ((this.TimeEstimate - this.TimeSpent) >= 0 ? this.TimeEstimate - this.TimeSpent : 0);
            }
        }
        public Int64 TimeExtra {
            get {
                return ((this.TimeSpent - this.TimeEstimate) >= 0 ? this.TimeSpent - this.TimeEstimate : 0);
            }
        }

        public string TimeEstimateHuman {
            get {
                var time = TimeSpan.FromSeconds(this.TimeEstimate).ToString(@"hh\:mm");
                return $"{time}";
            }
        }

        public string TimeSpentHuman {
            get {
                var time = TimeSpan.FromSeconds(this.TimeSpent).ToString(@"hh\:mm");
                return $"{time}";
            }
        }

        public string TimeRemainsHuman {
            get {
                var time = TimeSpan.FromSeconds(this.TimeRemains).ToString(@"hh\:mm");
                return $"{time}";
            }
        }

        public string TimeExtraHuman {
            get {
                var time = TimeSpan.FromSeconds(this.TimeExtra).ToString(@"hh\:mm");
                return $"{time}";
            }
        }
    }

    public class IssueAssignee
    {
        [JsonProperty("name")]
        public string Name { get; set; }
    }

    public class IssueMilestone
    {
        [JsonProperty("title")]
        public string Title { get; set; }
    }

    public class IssueReferences
    {
        [JsonProperty("full")]
        public string Full { get; set; }
    }

    public class IssueMindMapNode
    {
        public IssueMindMapNodeStyle Style { get; set; }
        public bool Folded { get; set; }
        public bool Cloud { get; set; }

        public IssueMindMapNode(IssueMindMapNodeStyle style, bool folded, bool cloud)
        {
            Style = style;
            Folded = folded;
            Cloud = cloud;
        }
    }

    public class IssueMindMapNodeStyle
    {
        public string[] Icons { get; set; }
        public string FontName { get; set; }
        public string FontSize { get; set; }
        public string FontColor { get; set; }
        public string BackgroundColor { get; set; }
        public string BorderColor { get; set; }
        public bool Bold { get; set; }

        public IssueMindMapNodeStyle(
            string[] icons,
            string fontName,
            string fontSize,
            string fontColor,
            string backgroundColor,
            string borderColor,
            bool bold
        )
        {
            Icons = icons;
            FontName = NullIfEmpty(fontName);
            FontSize = NullIfEmpty(fontSize);
            FontColor = NullIfEmpty(fontColor);
            BackgroundColor = NullIfEmpty(backgroundColor);
            BorderColor = NullIfEmpty(borderColor);
            Bold = bold;
        }

        public static string NullIfEmpty(string value)
        {
            return string.IsNullOrEmpty(value) ? null : value;
        }
    }
}
