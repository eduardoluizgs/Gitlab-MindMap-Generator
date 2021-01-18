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

    // FreeMind Node
    public class FreeMindNode
    {
        public DateTime Created { get; }
        public DateTime Modified { get; }
        public Int64 ID { get; }
        public FreeMindPosition Position { get; set; }
        public string Text { get; set; }
        public List<FreeMindNode> Nodes = new List<FreeMindNode>();
        public List<string> Icons = new List<string>();

        public FreeMindNode(string text, FreeMindPosition position, List<string> icons)
        {
            Random random = new Random();
            
            Created = System.DateTime.Now;
            Modified = Created;
            ID = Convert.ToInt64(random.Next(0, 999999999));
            Position = position;
            Text = text;
            Icons = icons;
        }
    }
}