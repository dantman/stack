# VS Code Configuration

*Auto-generated consolidated configuration: Settings, Tasks, MCP Servers*

## vscode - settings

*Source: `tooling/vscode/settings.md`*

# VS Code Workspace Settings

Core VS Code settings for Daniel's TypeScript development workflow.

## settings.json

Create or update `.vscode/settings.json` in your project root:

```json
{
	"editor.formatOnSave": true,
	"editor.defaultFormatter": "esbenp.prettier-vscode",
	"editor.codeActionsOnSave": {
		"source.sortImports": "always"
	},
	"[typescript]": {
		"editor.formatOnType": true
	},
	"[typescriptreact]": {
		"editor.formatOnType": true
	},
	"typescript.suggest.autoImports": true
}
```

## Settings Explanation

- **`editor.formatOnSave`**: Automatically formats files when saving
- **`editor.defaultFormatter`**: Uses Prettier as the default formatter
- **`source.sortImports`**: Automatically sorts imports on save
- **`editor.formatOnType`**: Enables real-time formatting for TypeScript files
- **`typescript.suggest.autoImports`**: Enables automatic import suggestions

## Required Extensions

Make sure you have the following VS Code extensions installed:

- **Prettier - Code formatter** (`esbenp.prettier-vscode`)
- **TypeScript and JavaScript Language Features** (built-in)

## Additional Considerations

These settings work best when combined with:
- Prettier configuration (see Prettier setup guide)
- TypeScript configuration (`tsconfig.json`)
- Proper linting setup (ESLint recommended)

---

## vscode - tasks

*Source: `tooling/vscode/tasks.md`*

# VS Code Tasks Configuration

Task runner configuration for common development workflows in Daniel's TypeScript projects.

## Basic tasks.json Structure

Create `.vscode/tasks.json` in your project root:

```json
{
	"version": "2.0.0",
	"tasks": []
}
```

## NPM Script Tasks

For each script in your `package.json`, add a corresponding task:

```json
{
	"type": "npm",
	"script": "scriptname",
	"problemMatcher": [],
	"label": "npm: scriptname"
}
```

### Common NPM Tasks

Example tasks for typical package.json scripts:

```json
{
	"version": "2.0.0",
	"tasks": [
		{
			"type": "npm",
			"script": "typecheck",
			"problemMatcher": [],
			"label": "npm: typecheck"
		},
		{
			"type": "npm",
			"script": "format",
			"problemMatcher": [],
			"label": "npm: format"
		},
		{
			"type": "npm",
			"script": "build",
			"problemMatcher": [],
			"label": "npm: build"
		},
		{
			"type": "npm",
			"script": "dev",
			"problemMatcher": [],
			"label": "npm: dev"
		}
	]
}
```

## Platform-Specific Tasks

### Vercel Projects

For projects using Vercel, add environment pulling task:

```json
{
	"type": "shell",
	"command": "npx",
	"args": ["vercel", "env", "pull", ".env.local"],
	"problemMatcher": [],
	"label": "vercel:env:pull"
}
```

**Setup Requirements:**

1. Install Vercel CLI as a dev dependency:
   ```bash
   npm install --save-dev vercel
   ```

2. (Optional) Add a personal bash alias:
   ```bash
   alias vercel="npx vercel"
   ```

3. Initial setup (run once):
   ```bash
   npx vercel login
   npx vercel link
   ```

### Docker Compose Projects

For projects using Docker Compose:

```json
{
	"type": "shell",
	"command": "docker-compose",
	"args": ["up"],
	"problemMatcher": [],
	"label": "docker-compose:up",
	"runOptions": {
		"runOn": "folderOpen"
	}
}
```

**Features:**
- Automatically runs when folder opens (`runOn: "folderOpen"`)
- Starts all services defined in `docker-compose.yml`

## Complete Example

Example `tasks.json` for a Next.js project with Vercel and Docker:

```json
{
	"version": "2.0.0",
	"tasks": [
		{
			"type": "npm",
			"script": "dev",
			"problemMatcher": [],
			"label": "npm: dev"
		},
		{
			"type": "npm",
			"script": "build",
			"problemMatcher": [],
			"label": "npm: build"
		},
		{
			"type": "npm",
			"script": "typecheck",
			"problemMatcher": [],
			"label": "npm: typecheck"
		},
		{
			"type": "npm",
			"script": "format",
			"problemMatcher": [],
			"label": "npm: format"
		},
		{
			"type": "shell",
			"command": "npx",
			"args": ["vercel", "env", "pull", ".env.local"],
			"problemMatcher": [],
			"label": "vercel:env:pull"
		},
		{
			"type": "shell",
			"command": "docker-compose",
			"args": ["up"],
			"problemMatcher": [],
			"label": "docker-compose:up",
			"runOptions": {
				"runOn": "folderOpen"
			}
		}
	]
}
```

## Usage

- Access tasks via `Ctrl+Shift+P`, type "run" → "Tasks: Run Task"
- Tasks appear in the VS Code Terminal panel
- Auto-running tasks (like docker-compose) start when the workspace opens

---

## vscode - mcp-servers

*Source: `tooling/vscode/mcp-servers.md`*

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

---

*Consolidated from multiple source files on Sun Jun  8 15:53:53 PDT 2025*
*Source files: tooling/vscode/settings.md tooling/vscode/tasks.md tooling/vscode/mcp-servers.md*
