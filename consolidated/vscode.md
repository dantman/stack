# VS Code Configuration

*Auto-generated consolidated configuration: Settings, Tasks, MCP Servers, Extensions*

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

> **Extension recommendations are documented in a separate section.**

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

## vscode - extensions

*Source: `tooling/vscode/extensions.md`*

# VS Code Extension Recommendations

This document lists recommended VS Code extensions for Daniel's TypeScript-based web development stack. Each extension includes a link and a brief explanation of why it is included.

## How to Use

- **For AI assistants:** When setting up a new project, add the listed extensions to the `recommendations` array in `.vscode/extensions.json` (or the devcontainer customizations if using a devcontainer).
- **For developers:** Install these extensions from the VS Code Marketplace for the best experience with this stack.

## Recommended Extensions

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode) — Ensures consistent code formatting across the team and integrates with format-on-save.
- [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) — Integrates ESLint for real-time linting and code quality feedback in JavaScript and TypeScript projects.
- [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) — Enforces consistent coding styles between different editors and IDEs using .editorconfig files.
- [Git Graph](https://marketplace.visualstudio.com/items?itemName=mhutchie.git-graph) — Visualizes your Git repository history as a graph, helping you understand branching and commit history at a glance.
- [Git Stash](https://marketplace.visualstudio.com/items?itemName=arturock.gitstash) — Provides a visual interface for Git stashes, making it easier to manage, review, and apply stashed changes.
- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss) — Adds Tailwind CSS IntelliSense, including autocomplete, syntax highlighting, and linting for Tailwind classes.
- [npm-import-package-version](https://marketplace.visualstudio.com/items?itemName=axetroy.vscode-npm-import-package-version) — Displays the installed version of npm packages inline in your import statements, reducing context switching.
- [npm Dependency Links](https://marketplace.visualstudio.com/items?itemName=herrmannplatz.npm-dependency-links) — Adds clickable links to npm package pages directly from your package.json dependencies for quick reference.
- [NPM Scripts](https://marketplace.visualstudio.com/items?itemName=fknop.vscode-npm) — Adds NPM scripts explorer and task integration, making it easier to run and manage project scripts directly from VS Code.
- [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) — Provides in-editor spell checking for source code, comments, and documentation, helping catch typos and improve code quality.
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) — Highlights CSV and TSV files, and allows running SQL-like queries on tabular data, making it easier to inspect and manipulate data files in your projects.

---

## Optional Extensions

These extensions are recommended for specific workflows or environments:

- [GitHub Pull Requests](https://marketplace.visualstudio.com/items?itemName=github.vscode-pull-request-github) — Recommended if your repository is hosted on GitHub. Enables pull request management, code reviews, and issue tracking directly within VS Code.
- [Atlassian: Jira & Bitbucket](https://marketplace.visualstudio.com/items?itemName=atlassian.atlascode) — Recommended if your project uses Jira for issue tracking or Bitbucket for source control. Integrates Jira issues and Bitbucket pull requests into your workflow.

*Only add these to your recommended extensions if your project uses the corresponding services.*

---

*To update the recommended extensions, edit this file and update `.vscode/extensions.json` accordingly.*

---

*Consolidated from multiple source files on Thu Jun 12 16:51:17 UTC 2025*
*Source files: tooling/vscode/settings.md tooling/vscode/tasks.md tooling/vscode/mcp-servers.md tooling/vscode/extensions.md*
