using System;
using System.Collections.Generic;
using System.IO;
using System.Xml;

namespace GitlabMindMapGenerator
{
    public class FreeMindWriter
    {
        private string Version = "0.8.1";
        public string FilePath;
        XmlWriter XMLWriter;
        public List<FreeMindNode> Nodes = new List<FreeMindNode>();

        public FreeMindWriter(string filePath, List<FreeMindNode> nodes = null)
        {
            if (filePath == null)
                throw new Exception("Invalid file path!");

            FilePath = filePath;
            Nodes = nodes;
            if (Nodes == null)
                Nodes = new List<FreeMindNode>();
        }

        public void BuldMindMap()
        {
            Random random = new Random();

            // create xml writer objects
            FileStream fileStream = new FileStream(this.FilePath, FileMode.Create);
            XmlWriterSettings settings = new XmlWriterSettings() { Indent = true };
            XMLWriter = XmlWriter.Create(fileStream, settings);

            // Write <xml> element
            XMLWriter.WriteProcessingInstruction("xml", @"version=""1.0"" encoding=""UTF-8"" standalone=""no""");

            // Write <map> element
            XMLWriter.WriteStartElement(null, "map", null);
            XMLWriter.WriteAttributeString(null, "version", null, this.Version);

            // Write <attribute_registry> element
            XMLWriter.WriteStartElement(null, "attribute_registry", null);
            XMLWriter.WriteAttributeString(null, "SHOW_ATTRIBUTES", null, "hide");
            XMLWriter.WriteEndElement();

            // Write <node> element
            XMLWriter.WriteStartElement(null, "node", null);
            XMLWriter.WriteAttributeString(null, "ID", null, $"Freemind_Link_{Convert.ToInt64(random.Next(0, 999999999))}");
            XMLWriter.WriteAttributeString(null, "CREATED", null, System.DateTime.Now.Ticks.ToString());
            XMLWriter.WriteAttributeString(null, "MODIFIED", null, System.DateTime.Now.Ticks.ToString());
            XMLWriter.WriteAttributeString(null, "TEXT", null, "MindMap");

            // build nodes
            foreach(FreeMindNode node in this.Nodes)
            {
                BuildNode(node);
            }

            XMLWriter.WriteEndElement(); // Close </node> element
            XMLWriter.WriteEndElement(); // Close </map> element
            XMLWriter.Flush();

            fileStream.Flush();
        }

        private void BuildNode(FreeMindNode node)
        {
            // Write <node> element
            XMLWriter.WriteStartElement(null, "node", null);
            XMLWriter.WriteAttributeString(null, "ID", null, $"Freemind_Link_{node.ID}");
            XMLWriter.WriteAttributeString(null, "CREATED", null, node.Created.Ticks.ToString());
            XMLWriter.WriteAttributeString(null, "MODIFIED", null, node.Modified.Ticks.ToString());
            XMLWriter.WriteAttributeString(null, "POSITION", null, node.Position.Value);
            if (node.Link != "") {
                XMLWriter.WriteAttributeString(null, "LINK", null, node.Link);
            }
            XMLWriter.WriteAttributeString(null, "TEXT", null, node.Text);
            XMLWriter.WriteAttributeString(null, "STYLE", null, "bubble");
            XMLWriter.WriteAttributeString(null, "COLOR", null, node.Style.FontColor);
            XMLWriter.WriteAttributeString(null, "BACKGROUND_COLOR", null, node.Style.BackgroundColor);
            XMLWriter.WriteAttributeString(null, "FOLDED", null, (node.Folded ? "true" : "false"));

            // Write <richcontent> element
            // <richcontent TYPE="NOTE">
            //   <html>
            //     <body>
            //       Text
            //     </body>
            //   </html>
            // </richcontent>

            // Write <icon> element
            foreach(FreeMindNodeIcon icon in node.Icons)
            {
                XMLWriter.WriteStartElement(null, "icon", null);
                XMLWriter.WriteAttributeString(null, "BUILTIN", null, icon.Value);
                XMLWriter.WriteEndElement();
            }

            // Write <cloud> element
            if (node.Cloud)
            {
                XMLWriter.WriteStartElement(null, "cloud", null);
                XMLWriter.WriteEndElement();
            }

            // Write <attribute_layout> element
            if (node.Attributes.Count > 0){
                XMLWriter.WriteStartElement(null, "attribute_layout", null);
                XMLWriter.WriteAttributeString(null, "NAME_WIDTH", null, "85");
                XMLWriter.WriteAttributeString(null, "VALUE_WIDTH", null, "200");
                XMLWriter.WriteEndElement();
            }

            // Write <attribute> element
            foreach(FreemindAttribute attribute in node.Attributes)
            {
                XMLWriter.WriteStartElement(null, "attribute", null);
                XMLWriter.WriteAttributeString(null, "NAME", null, $"{attribute.Key}:");
                XMLWriter.WriteAttributeString(null, "VALUE", null, attribute.Value ?? "");
                XMLWriter.WriteEndElement();
            }

            // Write <font> element
            XMLWriter.WriteStartElement(null, "font", null);
            XMLWriter.WriteAttributeString(null, "BOLD", null, (node.Style.Bold ? "true" : "false"));
            XMLWriter.WriteAttributeString(null, "NAME", null, node.Style.FontName);
            XMLWriter.WriteAttributeString(null, "SIZE", null, node.Style.FontSize);
            XMLWriter.WriteEndElement();

            // Write <arrowlink> element
            // <linktarget COLOR="#b0b0b0" DESTINATION="Freemind_Link_1309124106" ENDARROW="Default" ENDINCLINATION="303;0;" ID="Freemind_Arrow_Link_892211398" SOURCE="Freemind_Link_1620504932" STARTARROW="None" STARTINCLINATION="303;0;"/>
            // <arrowlink DESTINATION="Freemind_Link_1309124106" ENDARROW="Default" ENDINCLINATION="303;0;" ID="Freemind_Arrow_Link_892211398" STARTARROW="None" STARTINCLINATION="303;0;"/>

            // Write child nodes
            foreach(FreeMindNode chilNode in node.Nodes)
            {
                BuildNode(chilNode);
            }

            XMLWriter.WriteEndElement();
        }

        private void WriteNode(FreeMindNode node)
        {

        }
    }
}