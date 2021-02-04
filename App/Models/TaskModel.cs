using System;
using System.Collections.Generic;

namespace GitlabMindMapGenerator
{
    public class GanttProjectTask
    {
        public Int64 ID { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public bool Expand { get; set; }
        public bool Meeting { get; set; }
        public bool Project { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime ThirdDate { get; set; }
        public int Duration { get; set; }
        public int Complete { get; set; }
        public List<GanttProjectTask> Tasks;

        public  GanttProjectTask(
            string name,
            DateTime startDate,
            DateTime thirdDate,
            string color = null,
            bool project = false,
            bool expand = false,
            bool metting = false,
            int? duration = null,
            int? complete = null,
            List<GanttProjectTask> tasks = null
        )
        {
            Random random = new Random();

            ID = Convert.ToInt64(random.Next(0, 999999999));
            Name = name;
            StartDate = startDate;
            ThirdDate = thirdDate;
            Color = color ?? "#8cb6ce";
            Project = project;
            Expand = expand;
            Meeting = metting;
            Duration = duration ?? 0;
            Complete = complete ?? 0;
            Tasks = tasks ?? new List<GanttProjectTask>();
        }
    }
}