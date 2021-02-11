using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;

namespace GitlabMindMapGenerator
{
    public class FreeMindWriter: IWriter
    {
        private string Version = "0.8.1";
        public string FilePath { get; set; }
        public bool WriteAttributesAsNote { get; set; }
        XmlWriter XMLWriter;
        public List<FreeMindNode> Nodes { get; set; }

        public FreeMindWriter(string filePath, List<FreeMindNode> nodes = null, bool writeAttributesAsNote = false)
        {
            if (filePath == null)
                throw new Exception("Invalid file path!");

            FilePath = filePath;
            Nodes = nodes;
            if (Nodes == null)
                Nodes = new List<FreeMindNode>();
            WriteAttributesAsNote = writeAttributesAsNote;
        }

        public void Write()
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
                WriteNode(node);
            }

            XMLWriter.WriteEndElement(); // Close </node> element
            XMLWriter.WriteEndElement(); // Close </map> element
            XMLWriter.Flush();

            fileStream.Flush();
        }

        private void WriteNode(FreeMindNode node)
        {
            StringBuilder richTextContent = new StringBuilder();
            string cellStyle = "width:120px; border-width: 1px; border-color: #c0c0c0; border-style: solid;";

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

            if (node.Attributes.Count > 0) {
                if (WriteAttributesAsNote) {

                    // Write <richcontent> element
                    XMLWriter.WriteStartElement(null, "richcontent", null);
                    XMLWriter.WriteAttributeString(null, "TYPE", null, "NOTE");

                    // subdocument
                    XMLWriter.WriteStartElement(null, "html", null);
                    XMLWriter.WriteStartElement(null, "body", null);

                    // table attributes
                    XMLWriter.WriteStartElement(null, "table", null);
                    XMLWriter.WriteAttributeString(null, "style", null, "border-collapse: collapse;");

                    // title
                    XMLWriter.WriteStartElement(null, "tr", null);
                    XMLWriter.WriteStartElement(null, "td", null);
                    XMLWriter.WriteAttributeString(null, "style", null, cellStyle);
                    XMLWriter.WriteStartElement(null, "b", null);
                    XMLWriter.WriteValue("Issue-Attribute");
                    XMLWriter.WriteEndElement(); // close </b>
                    XMLWriter.WriteEndElement(); // close </td>
                    XMLWriter.WriteStartElement(null, "td", null);
                    XMLWriter.WriteAttributeString(null, "style", null, cellStyle);
                    XMLWriter.WriteStartElement(null, "b", null);
                    XMLWriter.WriteValue("Value");
                    XMLWriter.WriteEndElement(); // close </b>
                    XMLWriter.WriteEndElement(); // close </td>
                    XMLWriter.WriteEndElement(); // close </tr>

                    // attributes
                    foreach(FreemindAttribute attribute in node.Attributes)
                    {
                        XMLWriter.WriteStartElement(null, "tr", null);
                        XMLWriter.WriteStartElement(null, "td", null);
                        XMLWriter.WriteAttributeString(null, "style", null, cellStyle);
                        XMLWriter.WriteStartElement(null, "b", null);
                        XMLWriter.WriteValue($"{attribute.Key}:");
                        XMLWriter.WriteEndElement(); // close </b>
                        XMLWriter.WriteEndElement(); // close </td>
                        XMLWriter.WriteStartElement(null, "td", null);
                        XMLWriter.WriteAttributeString(null, "style", null, cellStyle);
                        XMLWriter.WriteValue(attribute.Value);
                        XMLWriter.WriteEndElement(); // close </td>
                        XMLWriter.WriteEndElement(); // close </tr>
                    }

                    XMLWriter.WriteEndElement(); // close </table>
                    XMLWriter.WriteEndElement(); // close </body>
                    XMLWriter.WriteEndElement(); // close </html>

                    XMLWriter.WriteEndElement(); // close </richcontent>

                } else {

                    // Write <attribute> element
                    foreach(FreemindAttribute attribute in node.Attributes)
                    {
                        XMLWriter.WriteStartElement(null, "attribute", null);
                        XMLWriter.WriteAttributeString(null, "NAME", null, $"{attribute.Key}:");
                        XMLWriter.WriteAttributeString(null, "VALUE", null, attribute.Value ?? "");
                        XMLWriter.WriteEndElement();
                    }

                }
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
                WriteNode(chilNode);
            }

            XMLWriter.WriteEndElement();
        }
    }
}