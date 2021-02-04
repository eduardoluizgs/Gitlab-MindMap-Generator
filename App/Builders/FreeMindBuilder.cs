

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
            FreeMindWriter mindMap = new FreeMindWriter(FilePath);

            foreach(Issue issue in this.Issues)
            {
                AddNode(issue, mindMap.Nodes);
            }

            mindMap.BuldMindMap();
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

        private void SetIssueStatesNodes(Issue issue, FreeMindNode node)
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

        private void SetNodeStyle(Issue issue, FreeMindNodeStyle style)
        {
            style.FontName = issue.MindMapNode.Style.FontName ?? style.FontName;
            style.FontSize = issue.MindMapNode.Style.FontSize ?? style.FontSize;
            style.FontColor = issue.MindMapNode.Style.FontColor ?? style.FontColor;
            style.BackgroundColor = issue.MindMapNode.Style.BackgroundColor ?? style.BackgroundColor;
            style.BorderColor = issue.MindMapNode.Style.BorderColor ?? style.BorderColor;
            style.Bold = issue.MindMapNode.Style.Bold || false;
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