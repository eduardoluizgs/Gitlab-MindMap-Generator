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
        public string Text { get; set; }
        public string Link { get; set; }
        public List<FreeMindNode> Nodes = new List<FreeMindNode>();
        public List<FreeMindNodeIcon> Icons = new List<FreeMindNodeIcon>();

        public FreeMindNode(
            string text, 
            string link,
            FreeMindPosition position, 
            List<FreeMindNodeIcon> icons
        )
        {
            Random random = new Random();
            
            Created = System.DateTime.Now;
            Modified = Created;
            ID = Convert.ToInt64(random.Next(0, 999999999));
            Position = position;
            Text = text;
            Link = link;
            Icons = icons;
        }
    }
}