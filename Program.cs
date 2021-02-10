using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace GitlabMindMapGenerator
{
    class Program
    {
        static IConfiguration Configuration { get; set; }
        static List<Issue> Issues = new List<Issue>();
        static GitlabSettings GitlabSettings = new GitlabSettings();
        static MindMapSetting MindMapSettings = new MindMapSetting();
        static GanntChartSetting GanntChartSetting = new GanntChartSetting();
        static string InvalidSettingMessage = "The configuration `{0}` is invalid. Please, review AppSettings.json file and try again.";

        static async Task Main(string[] args)
        {
            try
            {
                Console.WriteLine("Read configuration!");
                if (!GetConfiguration())
                    Environment.Exit(1);

                Console.WriteLine("Get issues!");
                await GetIssues();

                Console.WriteLine("Write MindMap!");
                WriteMindMap();

                Console.WriteLine("Write Gannt Chart!");
                WriteGanttChart();

                // Finaly
                Console.WriteLine("MindMap generated with success!");
            }
            catch (System.Exception e)
            {
                Console.WriteLine(e.Message);
                throw;
            }
        }

        static bool GetConfiguration()
        {
            // read configuration
            string configFile = "AppSettings.json";
            string configBasePath = Directory.GetCurrentDirectory();

            if (!File.Exists(Path.Join(configBasePath, configFile))) {
                Console.WriteLine($@"The file `AppSettings.json` is not found. Please, make a copy of file for the root path and try again.");
                return false;
            }

            Configuration = new ConfigurationBuilder()
                .SetBasePath(configBasePath)
                .AddJsonFile(configFile)
                .Build();

            Configuration.Bind("Gitlab", GitlabSettings);
            Configuration.Bind("MindMap", MindMapSettings);
            Configuration.Bind("GanttChart", GanntChartSetting);

            // Validate general settings
            string[] settings = new string[] {
                "Url",
                "ApiUrl",
                "ApiToken",
                "ApiIssuesUrl",
                "ProjectLabel",
                "NodesPattern"
            };

            foreach(string setting in settings)
            {
                if (!ValidateStringSetting(GitlabSettings, setting))
                    return false;
            }

            // Validate project ID's setting
            if (GitlabSettings.ProjectIDs.Count == 0) {
                Console.WriteLine(String.Format(InvalidSettingMessage, "GitlabProjectIDs"));
                return false;
            }

            return true;
        }

        static bool ValidateStringSetting(ISettings settings, string key)
        {
            Type myType = settings.GetType();
            PropertyInfo myPropInfo = myType.GetProperty(key);

            if (myPropInfo == null || myPropInfo.GetValue(settings, null) == null) {
                Console.WriteLine(String.Format(InvalidSettingMessage, key));
                return false;
            }

            return true;
        }

        static async Task GetIssues()
        {
            GitlabRequirementsIssuesService gitlabServices = new GitlabRequirementsIssuesService(
                gitlabSettings: GitlabSettings
            );

            Issues = await gitlabServices.GetIssuesAll();
        }

        static void WriteMindMap()
        {
            FreeMindBuilder builder = new FreeMindBuilder(
                issues: Issues,
                filePath: Path.Join(Directory.GetCurrentDirectory(), "Output", "FreeMindMap.mm"),
                gitlabSettings: GitlabSettings,
                mindMapSettings: MindMapSettings
            );
            builder.Build();
        }

        static void WriteGanttChart()
        {
            GanttProjectBuilder builder = new GanttProjectBuilder(
                issues: Issues,
                filePath: Path.Join(Directory.GetCurrentDirectory(), "Output", "GantProject.gan"),
                gitlabSettings: GitlabSettings,
                ganntChartSetting: GanntChartSetting
            );
            builder.Build();
        }
    }
}
