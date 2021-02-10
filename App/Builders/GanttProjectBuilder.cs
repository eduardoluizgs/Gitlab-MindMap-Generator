using System;
using System.Collections.Generic;
using System.Linq;

namespace GitlabMindMapGenerator
{
    public class GanttProjectBuilder : IBuilder
    {
        public List<Issue> Issues { get; set; }
        public string FilePath { get; set; }
        public GanntChartSetting GanntChartSetting { get; set; }
        public GitlabSettings GitlabSettings { get; set; }

        public GanttProjectBuilder(
            List<Issue> issues,
            string filePath,
            GitlabSettings gitlabSettings,
            GanntChartSetting ganntChartSetting
        )
        {
            Issues = issues;
            FilePath = filePath;
            GanntChartSetting = ganntChartSetting;
            GitlabSettings = gitlabSettings;
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
            GitlabLabelMappingSetting label = null;

            // get label issue
            if (GitlabSettings.LabelMapping != null) {
                label = GitlabSettings.LabelMapping.FirstOrDefault(
                    map => issue.Labels.FirstOrDefault(label => label == map?.Label) != null
                );
            }

            if (label == null || GanntChartSetting.IncludeIssuesLabels
                    .FirstOrDefault(x => x == label.Label) == null)
            {
                return;
            }

            // TODO : Adjuste base time logic, for get the first date from project
            DateTime baseDate = System.DateTime.Now.Date;

            // TODO: Implements logic with DueDate from Issue (DueDate - Estimate)

            // TODO : Add other params
            GanttProjectTask task = new GanttProjectTask(
                issue.Title,
                id: issue.IID,
                complete: Convert.ToInt16(issue.TaskCompletionPercentage),
                startDate: issue.CustomProperties.StartDate ?? baseDate,
                thirdDate: issue.CustomProperties.DueDate ?? baseDate,
                webLink: issue.WebURL,
                expand: true
            );
            tasks.Add(task);

            foreach(Issue childIssue in issue.Issues)
            {
                AddTasks(childIssue, task.Tasks);
            }
        }
    }
}
