using System;
using System.Collections.Generic;

namespace GitlabMindMapGenerator
{
    public class GanttProjectBuilder : IBuilder
    {
        public List<Issue> Issues;
        public string FilePath;

        public GanttProjectBuilder(
            List<Issue> issues,
            string filePath
        )
        {
            Issues = issues;
            FilePath = filePath;
        }

        public void Build()
        {
            GanttProjectWriter gantt = new GanttProjectWriter(FilePath);

            foreach(Issue issue in this.Issues)
            {
                AddTasks(issue, gantt.Tasks);
            }

            gantt.Write();
        }

        public void AddTasks(Issue issue, List<GanttProjectTask> tasks)
        {
            // TODO : Adjuste base time logic, for get the first date from project
            DateTime baseDate = System.DateTime.Now.Date;

            // TODO: Implements logic with DueDate from Issue (DueDate - Estimate)

            // TODO : Add other params
            GanttProjectTask task = new GanttProjectTask(
                issue.Title,
                startDate: issue.CustomProperties.StartDate ?? baseDate,
                thirdDate: issue.CustomProperties.DueDate ?? baseDate
            );
            tasks.Add(task);

            foreach(Issue childIssue in issue.Issues)
            {
                AddTasks(childIssue, task.Tasks);
            }
        }
    }
}
