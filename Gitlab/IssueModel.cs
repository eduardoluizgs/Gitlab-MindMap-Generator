using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
using System.Text.RegularExpressions;

namespace GitlabMindMapGenerator
{
    class Issue
    {
        [JsonPropertyName("id")]
        public int ID { get; set; }

        [JsonPropertyName("iid")]
        public int IID { get; set; }

        [JsonPropertyName("title")]
        public string Title { get; set; }

        [JsonPropertyName("description")]
        public string Description { get; set; }

        public int TaskCount
        {
            get {
                var matches = Regex.Matches(
                    this.Description,
                    @"(?=(\*|\-\+)\s\[)(.*?)(?<=\])"
                );
                return matches.Count;
            }
        }

        public int TaskDoneCount
        {
            get {
                var matches = Regex.Matches(
                    this.Description,
                    @"(?<=(\*|\-|\+)\s)\[x\]"
                );
                return matches.Count;
            }
        }

        public Decimal TaskPercentage
        {
            get {
                Decimal percentage = 0;
                if (this.TaskDoneCount > 0 && this.TaskCount > 0) {
                    percentage = Math.Round(((Convert.ToDecimal(this.TaskDoneCount) / Convert.ToDecimal(this.TaskCount)) * 100), 0);
                }
                return percentage;
            }
        }

        public List<Issue> Issues;

        public Issue()
        {
            Issues = new List<Issue>();
        }

        public List<IssueNode> GetNodes()
        {
            List<IssueNode> nodes = new List<IssueNode>();
            
            MatchCollection matches = Regex.Matches(
                this.Description,
                @"(?<=((\*|\-|\+)\s~Domain|~Theme|~Epic|~Feature|~UserStory).*?\s\-\s)(.*?)(?<=\))",
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

    class IssueNode
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
}
