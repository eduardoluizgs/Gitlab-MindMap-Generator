
using Newtonsoft.Json;

namespace GitlabMindMapGenerator
{
    /// <summary>
    /// [{
    ///    "id": 86229869,
    ///    "iid": 1,
    ///    "project_id": 23560828,
    ///    "title": "Update Readme",
    ///    "description": "Closes #1",
    ///    "state": "opened | closed | merged",
    ///    "created_at": "2021-01-27T01:06:37.634Z",
    ///    "updated_at": "2021-01-27T01:06:49.705Z",
    ///    "merged_by": null,
    ///    "merged_at": null,
    ///    "closed_by": null,
    ///    "closed_at": null,
    ///    "target_branch": "master",
    ///    "source_branch": "branch-test",
    ///    "user_notes_count": 0,
    ///    "upvotes": 0,
    ///    "downvotes": 0,
    ///    "author":
    ///    {
    ///        "id": 3295819,
    ///        "name": "",
    ///        "username": "",
    ///        "state": "active",
    ///        "avatar_url": "",
    ///        "web_url": ""
    ///    },
    ///    "assignees": [
    ///    {
    ///        "id": 3295819,
    ///        "name": "",
    ///        "username": "",
    ///        "state": "active",
    ///        "avatar_url": "",
    ///        "web_url": ""
    ///    }],
    ///    "assignee":
    ///    {
    ///        "id": 3295819,
    ///        "name": "",
    ///        "username": "",
    ///        "state": "active",
    ///        "avatar_url": "",
    ///        "web_url": ""
    ///    },
    ///    "reviewers": [],
    ///    "source_project_id": 23560828,
    ///    "target_project_id": 23560828,
    ///    "labels": [],
    ///    "work_in_progress": false,
    ///    "milestone": null,
    ///    "merge_when_pipeline_succeeds": false,
    ///    "merge_status": "can_be_merged",
    ///    "sha": "09e5875c030f39e876fc9d0646336698babf1c0e",
    ///    "merge_commit_sha": null,
    ///    "squash_commit_sha": null,
    ///    "discussion_locked": null,
    ///    "should_remove_source_branch": null,
    ///    "force_remove_source_branch": true,
    ///    "reference": "!1",
    ///    "references":
    ///    {
    ///        "short": "!1",
    ///        "relative": "!1",
    ///        "full": ""
    ///    },
    ///    "web_url": "",
    ///    "time_stats":
    ///    {
    ///        "time_estimate": 0,
    ///        "total_time_spent": 0,
    ///        "human_time_estimate": null,
    ///        "human_total_time_spent": null
    ///    },
    ///    "squash": false,
    ///    "task_completion_status":
    ///    {
    ///        "count": 0,
    ///        "completed_count": 0
    ///    },
    ///    "has_conflicts": false,
    ///    "blocking_discussions_resolved": true,
    ///    "approvals_before_merge": null,
    ///    "changes_count": "1",
    ///    "latest_build_started_at": null,
    ///    "latest_build_finished_at": null,
    ///    "first_deployed_to_production_at": null,
    ///    "pipeline": null,
    ///    "head_pipeline": null,
    ///    "diff_refs":
    ///    {
    ///        "base_sha": "3ca6292d3fa93ae473f64c74f1e27a235d696ce7",
    ///        "head_sha": "09e5875c030f39e876fc9d0646336698babf1c0e",
    ///        "start_sha": "3ca6292d3fa93ae473f64c74f1e27a235d696ce7"
    ///    },
    ///    "merge_error": null,
    ///    "user":
    ///    {
    ///        "can_merge": true
    ///    }
    /// }]
    /// </summary>
    public class MergeRequest
    {
        [JsonProperty("state")]
        public string State { get; set; }
    }
}