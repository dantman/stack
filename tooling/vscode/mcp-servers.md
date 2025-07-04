# VS Code MCP Server Configuration

Model Context Protocol (MCP) server configurations for enhanced AI capabilities in VS Code.

## Basic mcp.json Structure

Create `.vscode/mcp.json` in your project root:

```json
{
  "servers": {},
  "inputs": []
}
```

## GitHub MCP Server (Recommended)

> **Note:** As of June 2025, the Docker-based GitHub MCP and Personal Access Token (PAT) setup is no longer recommended. Use the new remote MCP server for GitHub integration:

```json
{
  "servers": {
    "github": {
      "url": "https://api.githubcopilot.com/mcp/"
    }
  }
}
```

- No Docker or PAT required for most users
- Simplifies setup and works out-of-the-box with Copilot-enabled accounts

## Git MCP Server (Local)

For local Git repository integration:

```json
{
  "servers": {
    "git": {
      "command": "npx",
      "args": [
        "-y",
        "@cyanheads/git-mcp-server"
      ]
    }
  }
}
```

**Setup Requirements:**

- Node.js and npm installed
- Git repository initialized

## Git MCP Server in Devcontainers (Recommended)

> **Note:** When using a devcontainer, npx-based MCP servers are often broken. Instead, run the Git MCP server as a background task and connect to it via HTTP.

**Add this task to your `.vscode/tasks.json`:**

```json
// @note npx based MCP servers are broken in devcontainers so we run them as tasks
{
  "type": "process",
  "label": "mcp-server: git",
  "command": "npx",
  "args": [
    "-y",
    "@cyanheads/git-mcp-server"
  ],
  "options": {
    "env": {
      "MCP_TRANSPORT_TYPE": "http"
    }
  },
  "problemMatcher": [],
  "runOptions": {
    "runOn": "folderOpen"
  }
}
```

**And use this in your `.vscode/mcp.json`:**

```json
{
  "servers": {
    "git": {
      "url": "http://localhost:3010/mcp/"
    }
  }
}
```

- This approach is only needed when a devcontainer setup is present.
- The task will start the MCP server in HTTP mode, and the client connects to it via `localhost:3010`.

## Atlassian Jira MCP Server

For Jira issue tracking integration (use only if project uses Jira):

```json
{
  "servers": {
    "mcp-atlassian": {
      "command": "npx",
      "args": [
        "-y",
        "mcp-remote",
        "https://mcp.atlassian.com/v1/sse"
      ]
    }
  }
}
```

**Setup Requirements:**

- Active Jira instance
- Appropriate Jira credentials/permissions

## Usage Notes

- Configure only the MCP servers you actually need for your project
- The new GitHub MCP remote server is the default and recommended approach
- Test each server configuration individually to ensure proper setup
