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

            // writer.WriteStartElement("pf", "root", "http://ns");  
            // writer.WriteStartElement(null, "sub", null);  
            // writer.WriteAttributeString(null, "att", null, "val");  
            // writer.WriteString("text");  
            // writer.WriteEndElement();  
            // writer.WriteProcessingInstruction("pName", "pValue");  
            // writer.WriteComment("cValue");  
            // writer.WriteCData("cdata value");  
            // writer.WriteEndElement();  

            // Write <node> element
            // XMLWriter.WriteStartElement(null, "node", null);
            // XMLWriter.WriteAttributeString(null, "CREATED", null, "1610244411291");
            // XMLWriter.WriteAttributeString(null, "ID", null, "6690at6q8krc1vp4uh88j09gmc");
            // XMLWriter.WriteAttributeString(null, "MODIFIED", null, "1610244411291");
            // XMLWriter.WriteAttributeString(null, "POSITION", null, "right");
            // XMLWriter.WriteAttributeString(null, "TEXT", null, "Projeto");

            // Write <node> element
            // XMLWriter.WriteStartElement(null, "node", null);
            // XMLWriter.WriteAttributeString(null, "CREATED", null, "1610244411291");
            // XMLWriter.WriteAttributeString(null, "ID", null, "6690at6q8krc1vp4uh88j09gmc");
            // XMLWriter.WriteAttributeString(null, "MODIFIED", null, "1610244411291");
            // XMLWriter.WriteAttributeString(null, "TEXT", null, "Dominio");

            // Write <node> element
            // XMLWriter.WriteStartElement(null, "node", null);
            // XMLWriter.WriteAttributeString(null, "CREATED", null, "1610244411291");
            // XMLWriter.WriteAttributeString(null, "ID", null, "6690at6q8krc1vp4uh88j09gmc");
            // XMLWriter.WriteAttributeString(null, "MODIFIED", null, "1610244411291");
            // XMLWriter.WriteAttributeString(null, "COLOR", null, "#FF0303");
            // XMLWriter.WriteAttributeString(null, "BACKGROUND_COLOR", null, "#FF0303");
            // XMLWriter.WriteAttributeString(null, "LINK", null, "http://freemind.sourceforge.net");
            // XMLWriter.WriteAttributeString(null, "STYLE", null, "bubble");
            // XMLWriter.WriteAttributeString(null, "FOLDED", null, "true");
            // XMLWriter.WriteAttributeString(null, "TEXT", null, "Theme");

            // Write <cloud> element
            // XMLWriter.WriteStartElement(null, "cloud", null);
            // XMLWriter.WriteEndElement();

            // Write <icon> element
            // gohome
            // password
            // Mail
            // kaddressbook
            // help
            // idea
            // button_ok
            // button_cancel
            // clanbomber
            // XMLWriter.WriteStartElement(null, "icon", null);
            // XMLWriter.WriteAttributeString(null, "BUILTIN", null, "help");
            // XMLWriter.WriteEndElement();

            // Write <attribute> element
            // XMLWriter.WriteStartElement(null, "attribute", null);
            // XMLWriter.WriteAttributeString(null, "NAME", null, "Attribute Teste");
            // XMLWriter.WriteAttributeString(null, "VALUE", null, "1");
            // XMLWriter.WriteEndElement();

            // Write <font> element
            // XMLWriter.WriteStartElement(null, "font", null);
            // XMLWriter.WriteAttributeString(null, "BOLD", null, "true");
            // XMLWriter.WriteAttributeString(null, "NAME", null, "SansSerif");
            // XMLWriter.WriteAttributeString(null, "SIZE", null, "14");
            // XMLWriter.WriteEndElement();

            // Write <arrowlink> element
            // <linktarget COLOR="#b0b0b0" DESTINATION="Freemind_Link_1309124106" ENDARROW="Default" ENDINCLINATION="303;0;" ID="Freemind_Arrow_Link_892211398" SOURCE="Freemind_Link_1620504932" STARTARROW="None" STARTINCLINATION="303;0;"/>
            // <arrowlink DESTINATION="Freemind_Link_1309124106" ENDARROW="Default" ENDINCLINATION="303;0;" ID="Freemind_Arrow_Link_892211398" STARTARROW="None" STARTINCLINATION="303;0;"/>
            
            // XMLWriter.WriteEndElement();
            // XMLWriter.WriteEndElement();
            // XMLWriter.WriteEndElement();                        
            XMLWriter.WriteEndElement();
            // --------------------------------
            
            // Close </map> element
            XMLWriter.WriteEndElement();

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
            XMLWriter.WriteAttributeString(null, "LINK", null, node.Link);
            XMLWriter.WriteAttributeString(null, "TEXT", null, node.Text);            

            // Write <icon> element
            foreach(FreeMindNodeIcon icon in node.Icons)
            {
                XMLWriter.WriteStartElement(null, "icon", null);
                XMLWriter.WriteAttributeString(null, "BUILTIN", null, icon.Value);
                XMLWriter.WriteEndElement();
            }

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