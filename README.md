# Gitlab MindMap Generator

## Application Configuration

```
{
  "Gitlab": {
    "Url": "https://gitlab.com",
    "ApiUrl": "/api/v4",
    "ApiIssuesUrl": "/projects/{0}/issues",
    "ApiToken": "",
    "ProjectIDs": [],
    "ProjectLabel": "",
    "NodesPattern": "(?<=((\\*|\\-|\\+)\\s~Domain|~Theme|~Epic|~Feature|~\"User Story\").*?\\s\\-\\s)(.*?)(?<=\\))"
  }
}
```

* **Url**: Gitlab base url.
* **ApiUrl**: Api url.
* **ApiIssuesUrl**: Project Api url.
* **ApiToken**: Access token for Gitlab api.
* **ProjectIDs**: Project ID's envolved in mindmap build.
* **ProjectLabel**: Label for identify the principal issue for project.
* **NodesPattern**: Regex patter for identify the issues envolved in mindmap build.

## Links

* [Tutorial: criar um aplicativo de console .NET usando o Visual Studio Code](https://docs.microsoft.com/pt-br/dotnet/core/tutorials/with-visual-studio-code)
* [Cliente REST](https://docs.microsoft.com/pt-br/dotnet/csharp/tutorials/console-webapiclient)
* []()