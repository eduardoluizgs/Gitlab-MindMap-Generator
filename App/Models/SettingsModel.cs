using System;
using System.Collections.Generic;
using System.Reflection;

namespace GitlabMindMapGenerator
{
    public class ISettings { }

    public class GitlabSettings : ISettings
    {
        public string Url { get; set; }
        public string ApiUrl { get; set; }
        public string ApiToken { get; set; }
        public string ApiIssuesUrl { get; set; }
        public string ApiMergeRequestUrl { get; set; }
        public string ProjectLabel { get; set; }
        public string NodesPattern { get; set; }
        public string LabelTask { get; set; }
        public List<string> ProjectIDs { get; set; }
        public List<string> IssueBoardStages { get; set; }
        public List<GitlabIssueStageSetting> IssueStages { get; set; }
        public List<GitlabLabelMappingSetting> LabelMapping { get; set; }
    }

    public class GitlabIssueStageSetting
    {
        public string Title { get; set; }
        public string Pattern { get; set; }
    }

    public class GitlabLabelMappingSetting
    {
        public string Label { get; set; }
        public string Icon { get; set; }
    }

    public class MindMapSetting : ISettings
    {
        public MindMapNodeStyleSetting NodeStyle { get; set; }
        public MindMapNodeStyleSetting NodeStyleWaiting { get; set; }
        public MindMapNodeStyleSetting NodeStyleRunning { get; set; }
        public MindMapNodeStyleSetting NodeStyleDone { get; set; }
    }

    public class MindMapNodeStyleSetting : ISettings
    {
        public string FontName { get; set; }
        public string FontSize { get; set; }
        public string FontColor { get; set; }
        public string BackgroundColor { get; set; }
        public string BorderColor { get; set; }
    }

    public class GanntChartSetting
    {
        public List<string> IncludeIssuesLabels { get; set; }
    }
}
