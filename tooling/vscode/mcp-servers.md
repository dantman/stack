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

## GitHub MCP Server

For GitHub repository integration:

```json
{
	"servers": {
		"github": {
			"command": "docker",
			"args": [
				"run",
				"-i",
				"--rm",
				"-e",
				"GITHUB_PERSONAL_ACCESS_TOKEN",
				"ghcr.io/github/github-mcp-server"
			],
			"env": {
				"GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github-reponame-pat}"
			}
		}
	},
	"inputs": [
		{
			"id": "github-reponame-pat",
			"type": "promptString",
			"description": "GitHub Personal Access Token for organization/repository-name repository"
		}
	]
}
```

**Setup Requirements:**
- Docker installed and running
- GitHub Personal Access Token with appropriate repository permissions

## Git MCP Server

For local Git repository integration:

```json
{
	"servers": {
		"git-mcp-server": {
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

## Complete Example

Example combining all three servers:

```json
{
	"servers": {
		"github": {
			"command": "docker",
			"args": [
				"run",
				"-i",
				"--rm",
				"-e",
				"GITHUB_PERSONAL_ACCESS_TOKEN",
				"ghcr.io/github/github-mcp-server"
			],
			"env": {
				"GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github-reponame-pat}"
			}
		},
		"git-mcp-server": {
			"command": "npx",
			"args": [
				"-y",
				"@cyanheads/git-mcp-server"
			]
		},
		"mcp-atlassian": {
			"command": "npx",
			"args": [
				"-y",
				"mcp-remote",
				"https://mcp.atlassian.com/v1/sse"
			]
		}
	},
	"inputs": [
		{
			"id": "github-reponame-pat",
			"type": "promptString",
			"description": "GitHub Personal Access Token for organization/repository-name repository"
		}
	]
}
```

## Usage Notes

- Configure only the MCP servers you actually need for your project
- Update the GitHub PAT description to match your specific repository
- Test each server configuration individually to ensure proper setup
