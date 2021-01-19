using System;
using System.Collections.Generic;
using System.Reflection;

namespace GitlabMindMapGenerator
{
    public class ISettings
    {
        // public object this[string propertyName] 
        // {
        // get{
        //     // probably faster without reflection:
        //     // like:  return Properties.Settings.Default.PropertyValues[propertyName]
        //     // instead of the following
        //     Type myType = typeof(ISettings);                   
        //     PropertyInfo myPropInfo = myType.GetProperty(propertyName);
        //     return myPropInfo.GetValue(this, null);
        // }
        // set{
        //     Type myType = typeof(ISettings);                   
        //     PropertyInfo myPropInfo = myType.GetProperty(propertyName);
        //     myPropInfo.SetValue(this, value, null);
        // }
        // }
    }

    public class GitlabSettings : ISettings
    {
        public string Url { get; set; }
        public string ApiUrl { get; set; }
        public string ApiToken { get; set; }
        public string ApiIssuesUrl { get; set; }
        public string ProjectLabel { get; set; }
        public string NodesPattern { get; set; }
        public List<string> ProjectIDs { get; set; }
    }

    public class MindMapSettings : ISettings
    {
        public MindMapNodeStyleSettings NodeStyle { get; set; }
        public MindMapNodeStyleSettings NodeStyleWaiting { get; set; }
        public MindMapNodeStyleSettings NodeStyleRunning { get; set; }
        public MindMapNodeStyleSettings NodeStyleDone { get; set; }
    }

    public class MindMapNodeStyleSettings : ISettings
    {
        public string FontName { get; set; }
        public string FontSize { get; set; }
        public string FontColor { get; set; }
        public string BackgroundColor { get; set; }
        public string BorderColor { get; set; }
    }
}
