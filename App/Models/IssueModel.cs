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
    ///         "name": "",
    ///         "username": "",
    ///         "state": "active",
    ///         "avatar_url": "",
    ///         "web_url": ""
    ///     },
    ///     "assignee": null,
    ///     "user_notes_count": 0,
    ///     "merge_requests_count": 0,
    ///     "upvotes": 0,
    ///     "downvotes": 0,
    ///     "due_date": null,
    ///     "confidential": false,
    ///     "discussion_locked": null,
    ///     "web_url": "",
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
    ///         "full": ""
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

        [JsonProperty("project_id")]
        public Int64 ProjectID { get; set; }

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

        [JsonProperty("due_date")]
        public DateTime? DueDate { get; set; }

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
                Decimal percentage = 0;

                if (this.TaskCompletedCount > 0 && this.TaskCount > 0) {
                    percentage = Math.Round(((Convert.ToDecimal(this.TaskCompletedCount) / Convert.ToDecimal(this.TaskCount)) * 100), 0);
                }

                return percentage;
            }
        }

        public Decimal TaskCompletionAvarage
        {
            get {
                Decimal avarage = 0;

                if (this.TaskCompletedCount > 0 && this.TaskCount > 0) {
                    avarage = Math.Round((this.Issues.Sum(x => x.TaskCompletionPercentage) / this.Issues.Count) * 100, 0);
                }

                return avarage;
            }
        }

        public IssueCustomPropertys CustomProperties { get; set; }
        public List<Issue> Issues { get; set; }
        public List<MergeRequest> MergeRequests { get; set; }

        public Issue()
        {
            Issues = new List<Issue>();
            MergeRequests = new List<MergeRequest>();
        }

        public List<IssueNode> GetNodesInDescription(string pattern)
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

        public string GetStageInBoard(List<string> stages)
        {
            return stages.FirstOrDefault(
                defatulStage => (this.Labels.FirstOrDefault(label => label == defatulStage) != null)
            );
        }

        public IssueStage GetStageInDescription(string pattern)
        {
            Match matchStage = Regex.Match(this.Description, pattern);
            if (matchStage.Value != "")
            {
                return new IssueStage(
                    matchStage.Groups[3].Value,
                    (matchStage.Groups[2].Value.ToUpper() == "X")
                );
            }
            return null;
        }

        public IssueStage GetStageReview()
        {
            MergeRequest openMR = this.MergeRequests.Find(x => x.State == "opened");

            return new IssueStage(
                "Reviewed",
                (openMR == null ? true : false)
            );
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
            Match matchStartDate = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Gantt\-Start\*\*\:\s).*?(?=\n|$)");
            Match matchDueDate = Regex.Match(this.Description, @"(?<=(\*|\-|\+)\s\*\*Gantt\-Due\*\*\:\s).*?(?=\n|$)");

            this.CustomProperties = new IssueCustomPropertys(
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
                cloud: (matchCloud.Value == "Yes"),
                startDate: (matchStartDate.Value != "" ? Convert.ToDateTime(matchStartDate.Value) : null),
                dueDate: (matchDueDate.Value != "" ? Convert.ToDateTime(matchDueDate.Value) : null)
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

    public class IssueCustomPropertys
    {
        public IssueMindMapNodeStyle Style { get; set; }
        public bool Folded { get; set; }
        public bool Cloud { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? DueDate { get; set; }

        public IssueCustomPropertys(
            IssueMindMapNodeStyle style,
            bool folded = false,
            bool cloud = false,
            DateTime? startDate = null,
            DateTime? dueDate = null
        )
        {
            Style = style;
            Folded = folded;
            Cloud = cloud;
            StartDate = startDate;
            DueDate = dueDate;
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

    public class IssueStage
    {
        public string Name { get; set; }
        public bool Done { get; set; }

        public IssueStage(string name, bool done)
        {
            Name = name;
            Done = done;
        }
    }
}
