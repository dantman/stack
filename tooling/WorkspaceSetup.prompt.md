# Workspace Setup Prompt

A comprehensive prompt for setting up new project workspaces according to Daniel's preferences for TypeScript-based development.

## Usage

Copy and paste this prompt into your AI assistant when setting up a new project workspace. The prompt will guide the AI through setting up:

- Package.json scripts for common tasks
- Prettier and EditorConfig for consistent formatting
- VS Code workspace settings and configurations
- MCP server integrations for enhanced AI capabilities
- Task runner configurations
- Dependabot for automated dependency updates

## Prompt Content

---

**mode: 'agent'**

---

We are in the folder for a new project. Your job is to set up the workspace according to my usual preferences. Here are the requirements:

## Add the following scripts to package.json

```json
{
	"scripts": {
		"typecheck": "tsc --noEmit",
		"format": "prettier --write ."
	}
}
```

## Setup Prettier

Install Prettier and the necessary plugins:

```bash
npm install --save-dev prettier
```

Create a `.prettierrc.json` file with the following content:

```json
{
	"jsxSingleQuote": true,
	"trailingComma": "es5"
}
```

Create a `.prettierignore` file with the following lines:

- Always include `node_modules/`
- If the project is a Next.js project, include `.next/`
- If the project uses Drizzle ORM, include `drizzle/meta/`
- If the project uses Snaplet, include `src/db/.snaplet/`

Add the following script to `package.json`:

```json
{
	"scripts": {
		"format": "prettier --write ."
	}
}
```

Create an `.editorconfig` file with the following content:

```ini
root = true

[*]
indent_style = tab
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true

# These .json files are automatically generated
[{package.json}]
indent_style = space
indent_size = 2

# YAML does not allow tabs
[*.{yml,yaml}]
indent_style = space
indent_size = 2
```

If the project has a package-lock.json file, update `[{package.json}]` to be `[{package.json,package-lock.json}]`.

## .vscode/settings.json

Create a `.vscode/settings.json` file with the following settings:

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

## .vscode/mcp.json

Create a `.vscode/mcp.json` file with the following MCP server configurations:

### A Github MCP Server
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

### A Git MCP Server
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

### An Atlassian Jira MCP Server

Try to figure out whether the project is using Jira for issue tracking. If you cannot determine this from the context, ask the user to confirm. If the project is using Jira, include the following MCP server configuration:

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

## .vscode/tasks.json

Create a `.vscode/tasks.json` file and populate it with tasks:

```json
{
	"version": "2.0.0",
	"tasks": []
}
```

For each script in package.json#scripts section, add a task in `.vscode/tasks.json`:

```json
// npm run scriptname
{
	"type": "npm",
	"script": "scriptname",
	"problemMatcher": [],
	"label": "npm: scriptname"
}
```

If the project is using Vercel add the following task:

```json
// vercel
{
	"type": "shell",
	"command": "npx",
	"args": ["vercel", "env", "pull", ".env.local"],
	"problemMatcher": [],
	"label": "vercel:env:pull"
}
```

If the project is using Docker Compose, add the following task:

```json
// docker-compose up
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

## Setup Dependabot

Ask the user whether this project should use Dependabot for version updates. If the user confirms, create a `.github/dependabot.yml` file with the following content:

```yaml
# To get started with Dependabot version updates, you'll need to specify which
# package ecosystems to update and where the package manifests are located.
# Please see the documentation for all configuration options:
# https://docs.github.com/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file

version: 2
updates:
  - package-ecosystem: "npm" # See documentation for possible values
    directory: "/" # Location of package manifests
    schedule:
      interval: "daily"
    commit-message:
      prefix: "[npm] "
    labels:
      - "npm dependencies"
```
