using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Xml;

namespace GitlabMindMapGenerator
{
    public class GanttProjectWriter: IWriter
    {
        public string FilePath { get ; set; }
        private string Version = "3.0.3000";
        XmlWriter XMLWriter;
        public List<GanttProjectTask> Tasks {get; set; }

        public  GanttProjectWriter(string filePath)
        {
            FilePath = filePath;
            Tasks = new List<GanttProjectTask>();
        }

        public void Write()
        {
            // open xml
            // create xml writer objects
            FileStream fileStream = new FileStream(this.FilePath, FileMode.Create);
            XmlWriterSettings settings = new XmlWriterSettings() { Indent = true };
            XMLWriter = XmlWriter.Create(fileStream, settings);

            // Write <xml> element
            XMLWriter.WriteProcessingInstruction("xml", @"version=""1.0"" encoding=""UTF-8"" standalone=""no""");

            // Write <project> element
            XMLWriter.WriteStartElement(null, "project", null);
            XMLWriter.WriteAttributeString(null, "name", null, "GanttProject");
            XMLWriter.WriteAttributeString(null, "company", null, "Company");
            XMLWriter.WriteAttributeString(null, "webLink", null, "http://");
            XMLWriter.WriteAttributeString(null, "view-date", null, "2021-02-11");
            XMLWriter.WriteAttributeString(null, "view-index", null, "0");
            XMLWriter.WriteAttributeString(null, "gantt-divider-location", null, "800");
            XMLWriter.WriteAttributeString(null, "resource-divider-location", null, "300");
            XMLWriter.WriteAttributeString(null, "version", null, this.Version);
            XMLWriter.WriteAttributeString(null, "locale", null, "pt_BR");

            // Write <view> element
            XMLWriter.WriteStartElement(null, "view", null);
            XMLWriter.WriteAttributeString(null, "zooming-state", null, "default:8");
            XMLWriter.WriteAttributeString(null, "id", null, "gantt-chart");

            var fields = new[] {
                new { id = "tpd3", name = "Nome", width = "501", order = "0" },
                new { id = "tpd4", name = "Data inicial", width = "109", order = "1" },
                new { id = "tpd5", name = "Data final", width = "98", order = "2" },
                new { id = "tpd7", name = "Concluído", width = "83", order = "3" }
            }.ToList();

            foreach(var field in fields)
            {
                // Write <field> element
                XMLWriter.WriteStartElement(null, "field", null);
                XMLWriter.WriteAttributeString(null, "id", null, field.id);
                XMLWriter.WriteAttributeString(null, "name", null, field.name);
                XMLWriter.WriteAttributeString(null, "width", null, field.width);
                XMLWriter.WriteAttributeString(null, "order", null, field.order);
                XMLWriter.WriteEndElement();
            }

            // Write <option> element
            XMLWriter.WriteStartElement(null, "option", null);
            XMLWriter.WriteAttributeString(null, "id", null, "color.recent");
            XMLWriter.WriteCData("#ff3300");
            XMLWriter.WriteEndElement();

            XMLWriter.WriteEndElement(); // Close </view> element

            // Write <tasks> element
            XMLWriter.WriteStartElement(null, "tasks", null);
            XMLWriter.WriteAttributeString(null, "empty-milestones", null, "true");

            // write tasks
            foreach(GanttProjectTask task in Tasks)
            {
                WriteTask(task);
            }

            XMLWriter.WriteEndElement(); // Close </tasks> element
            XMLWriter.WriteEndElement(); // Close </project> element
            XMLWriter.Flush();

            fileStream.Flush();
        }

        private void WriteTask(GanttProjectTask task)
        {
            // Write <task> element
            XMLWriter.WriteStartElement(null, "task", null);
            XMLWriter.WriteAttributeString(null, "id", null, task.ID.ToString());
            XMLWriter.WriteAttributeString(null, "name", null, task.Name);
            XMLWriter.WriteAttributeString(null, "color", null, task.Color);
            XMLWriter.WriteAttributeString(null, "project", null, (task.Project ? "true" : "false"));
            XMLWriter.WriteAttributeString(null, "expand", null, (task.Expand ? "true" : "false"));
            XMLWriter.WriteAttributeString(null, "meeting", null, (task.Meeting ? "true" : "false"));
            XMLWriter.WriteAttributeString(null, "start", null, (task.StartDate != null ? ((DateTime)task.StartDate).ToString("yyyy-MM-dd") : ""));
            XMLWriter.WriteAttributeString(null, "thirdDate", null, (task.ThirdDate != null ? ((DateTime)task.ThirdDate).ToString("yyyy-MM-dd") : ""));
            XMLWriter.WriteAttributeString(null, "duration", null, task.Duration.ToString());
            XMLWriter.WriteAttributeString(null, "complete", null, task.Complete.ToString());
            XMLWriter.WriteAttributeString(null, "webLink", null, task.WebLink);
            XMLWriter.WriteAttributeString(null, "thirdDate-constraint", null, "0");

            foreach(GanttProjectTask childTask in task.Tasks)
            {
                WriteTask(childTask);
            }

            XMLWriter.WriteEndElement();

            // <task id="2" name="tarefa_2" color="#8cb6ce" meeting="false" start="2021-02-24" duration="10" complete="0" thirdDate="2021-02-03" thirdDate-constraint="0" expand="true"
        }
    }
}
