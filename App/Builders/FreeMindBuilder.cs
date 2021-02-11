

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace GitlabMindMapGenerator
{
    public class FreeMindBuilder : IBuilder
    {
        public List<Issue> Issues;
        public string FilePath;
        public GitlabSettings GitlabSettings = new GitlabSettings();
        public MindMapSetting MindMapSettings = new MindMapSetting();

        public FreeMindBuilder(
            List<Issue> issues,
            string filePath,
            GitlabSettings gitlabSettings,
            MindMapSetting mindMapSettings
        )
        {
            Issues = issues;
            FilePath = filePath;
            MindMapSettings = mindMapSettings;
            GitlabSettings = gitlabSettings;
        }

        public void Build()
        {
            FreeMindWriter mindMap = new FreeMindWriter(FilePath, writeAttributesAsNote: true);

            foreach(Issue issue in this.Issues)
            {
                AddNode(issue, mindMap.Nodes);
            }

            mindMap.Write();
        }

        private void AddNode(Issue issue, List<FreeMindNode> mindMapNodes)
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
            foreach(string icon in issue.CustomProperties.Style.Icons)
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
                text: $"{issue.Title} - #{issue.IID} [{issue.TaskCompletion} - {issue.TaskCompletionPercentage}%]",
                link: issue.WebURL,
                folded: issue.CustomProperties.Folded,
                cloud: issue.CustomProperties.Cloud,
                position: FreeMindPosition.Right,
                style: nodeStyle,
                icons: icons,
                attributes: attributes
            );
            mindMapNodes.Add(node);

            // create stage nodes
            if (label != null && label.Label == GitlabSettings.LabelTask) {
                SetIssueStatesNodes(issue, node);
            }

            // crate child nodes
            foreach(Issue childIssue in issue.Issues)
            {
                AddNode(childIssue, node.Nodes);
            }
        }

        private void SetIssueStatesNodes(Issue issue, FreeMindNode node)
        {
            IssueStage stage;
            List<FreeMindNode> nodes = new List<FreeMindNode>();

            foreach(var settingStage in GitlabSettings.IssueStages)
            {
                if (settingStage.Pattern == "[IsClosed]") {
                    stage = new IssueStage(
                        "Reviewed",
                        issue.IsClosed
                    );
                } else if (settingStage.Pattern == "[Reviewed]") {

                    // all task issue type, must be a review node
                    // if no merge requests associated, force this
                    stage = issue.GetStageReview();
                    if (stage == null) {
                        stage = new IssueStage(
                            "Reviewed",
                            issue.IsClosed
                        );
                    }

                } else {
                    stage = issue.GetStageInDescription(settingStage.Pattern);
                }

                if (stage != null) {
                    nodes.Add(new FreeMindNode(
                        text: settingStage.Title,
                        folded: false,
                        style: (stage.Done ? GetNodeStyleDone() : GetNodeStyle()),
                        icons: GetStateIcons(stage.Done)
                    ));
                }
            }

            if (nodes.Count > 0)
            {
                FreeMindNode firstNode = nodes[0];

                // tasks node
                firstNode.Nodes.Add(new FreeMindNode(
                    text: $"Tasks: {issue.TaskCompletion} - {issue.TaskCompletionPercentage}%",
                    folded: false,
                    style: GetNodeStyle(),
                    icons: new List<FreeMindNodeIcon>() { new FreeMindNodeIcon("edit") }
                ));

                // time node
                if (issue.TimeStats.TimeSpent > 0 || issue.TimeStats.TimeEstimate > 0) {
                    firstNode.Nodes.Add(new FreeMindNode(
                        text: $"Time: {issue.TimeStats.TimeSpentHuman}/{issue.TimeStats.TimeEstimateHuman} - {Convert.ToInt32(issue.TimeStats.TimeCompletionPercentage)}%",
                        folded: false,
                        style: GetNodeStyle(),
                        icons: new List<FreeMindNodeIcon>() { new FreeMindNodeIcon("clock") }
                    ));
                }

                node.Nodes.AddRange(nodes);
            }
        }

        private List<FreeMindNodeIcon> GetStateIcons(bool isDone)
        {
            List<FreeMindNodeIcon> icons = new List<FreeMindNodeIcon>();

            if (isDone) {
                icons.Add(new FreeMindNodeIcon("button_ok"));
            } else {
                icons.Add(new FreeMindNodeIcon("help"));
            }

            return icons;
        }
        private void SetNodeStyle(Issue issue, FreeMindNodeStyle style)
        {
            style.FontName = issue.CustomProperties.Style.FontName ?? style.FontName;
            style.FontSize = issue.CustomProperties.Style.FontSize ?? style.FontSize;
            style.FontColor = issue.CustomProperties.Style.FontColor ?? style.FontColor;
            style.BackgroundColor = issue.CustomProperties.Style.BackgroundColor ?? style.BackgroundColor;
            style.BorderColor = issue.CustomProperties.Style.BorderColor ?? style.BorderColor;
            style.Bold = issue.CustomProperties.Style.Bold || false;
        }

        private FreeMindNodeStyle GetNodeStyle()
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

        private FreeMindNodeStyle GetNodeStyleWaiting()
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

        private FreeMindNodeStyle GetNodeStyleRunning()
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

        private FreeMindNodeStyle GetNodeStyleDone()
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