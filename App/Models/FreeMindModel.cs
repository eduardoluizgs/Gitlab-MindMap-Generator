using System;
using System.Collections.Generic;

namespace GitlabMindMapGenerator
{
    // FreeMind Position
    public class FreeMindPosition
    {
        private FreeMindPosition(string value) { Value = value; }

        public string Value { get; set; }

        public static FreeMindPosition Right { get { return new FreeMindPosition("right"); } }
        public static FreeMindPosition Left { get { return new FreeMindPosition("left"); } }
    }

    // FreeMind Font
    public class FreeMindNodeStyle
    {
        public string FontName { get; set; }
        public string FontSize { get; set; }
        public string FontColor { get; set; }
        public string BackgroundColor { get; set; }
        public string BorderColor { get; set; }
        public bool Bold { get; set; }

        public FreeMindNodeStyle(
            string fontName,
            string fontSize,
            string fontColor,
            string backgroundColor,
            string borderColor,
            bool bold
        )
        {
            FontName = fontName;
            FontSize = fontSize;
            FontColor = fontColor;
            BackgroundColor = backgroundColor;
            BorderColor = borderColor;
            Bold = bold;
        }
    }

    // FreeMind Attributes
    public class FreemindAttribute
    {

        public string Key { get; set; }
        public string Value { get; set; }

        public FreemindAttribute(string key, string value)
        {
            if (String.IsNullOrEmpty(key))
                throw new Exception("Invalid Key!");

            Key = key;
            Value = value ?? "";
        }
    }

    // FreeMind Icon
    public class FreeMindNodeIcon
    {
        private string[] Icons = new string[] {
            "attach",
            "back",
            "bell",
            "bookmark",
            "broken-line",
            "button_cancel",
            "button_ok",
            "calendar",
            "clanbomber",
            "clock",
            "closed",
            "desktop_new",
            "down",
            "edit",
            "family",
            "fema",
            "female1",
            "female2",
            "flag",
            "flag-black",
            "flag-blue",
            "flag-green",
            "flag-orange",
            "flag-pink",
            "flag-yellow",
            "folder",
            "forward",
            "freemind_butterfly",
            "full-0",
            "full-1",
            "full-2",
            "full-3",
            "full-4",
            "full-5",
            "full-6",
            "full-7",
            "full-8",
            "full-9",
            "go",
            "gohome",
            "group",
            "help",
            "hourglass",
            "idea",
            "info",
            "kaddressbook",
            "kmail",
            "knotify",
            "korn",
            "ksmiletris",
            "launch",
            "licq",
            "list",
            "Mail",
            "male1",
            "male2",
            "messagebox_warning",
            "password",
            "pencil",
            "penguin",
            "prepare",
            "smiley-angry",
            "smiley-neutral",
            "smiley-oh",
            "smily_bad",
            "stop",
            "stop-sign",
            "up",
            "wizard",
            "xmag",
            "yes"
        };

        public FreeMindNodeIcon(string value)
        {
            Validate(value);
            Value = value;
        }

        private string _value;
        public string Value {
            get {
                return _value;
            }
            set {
                Validate(value);
                _value = value;
            }
        }

        private bool Validate(string icon)
        {
            if (Array.FindAll(this.Icons, s => s.Equals(icon)).Length == 0)
                throw new Exception($"Invalid icon: {icon}!");
            return true;
        }
    }

    // FreeMind Node
    public class FreeMindNode
    {
        public DateTime Created { get; }
        public DateTime Modified { get; }
        public Int64 ID { get; }
        public FreeMindPosition Position { get; set; }
        public bool Folded { get; set; }
        public bool Cloud { get; set; }
        public string Text { get; set; }
        public string Link { get; set; }
        public List<FreeMindNode> Nodes = new List<FreeMindNode>();
        public List<FreeMindNodeIcon> Icons = new List<FreeMindNodeIcon>();
        public FreeMindNodeStyle Style;
        public List<FreemindAttribute> Attributes = new List<FreemindAttribute>();

        public FreeMindNode(
            string text,
            bool folded,
            FreeMindNodeStyle style,
            bool cloud = false,
            FreeMindPosition position = null,
            string link = null,
            List<FreeMindNodeIcon> icons = null,
            List<FreemindAttribute> attributes = null
        )
        {
            Random random = new Random();

            Created = System.DateTime.Now;
            Modified = Created;
            ID = Convert.ToInt64(random.Next(0, 999999999));
            Position = position ?? FreeMindPosition.Right;
            Text = text;
            Link = link ?? "";
            Icons = icons ?? Icons;
            Style = style;
            Folded = folded;
            Cloud = cloud;
            Attributes = attributes ?? Attributes;
        }
    }
}