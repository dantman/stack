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
