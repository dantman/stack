# Development Tooling Configuration

*Auto-generated consolidated configuration: Prettier, Dependabot, Package Scripts*

## prettier - setup

*Source: `tooling/prettier/setup.md`*

# Prettier Setup Guide

Prettier configuration for Daniel's TypeScript-based development workflow.

## Installation

Install Prettier as a dev dependency:

```bash
npm install --save-dev prettier
```

## Configuration Files

### .prettierrc.json

Create a `.prettierrc.json` file in your project root:

```json
{
	"jsxSingleQuote": true,
	"trailingComma": "es5"
}
```

### .prettierignore

Create a `.prettierignore` file to exclude certain directories and files:

```
node_modules/
```

**Additional entries based on project type:**

- **Next.js projects:** Add `.next/`
- **Drizzle ORM projects:** Add `drizzle/meta/`
- **Snaplet projects:** Add `src/db/.snaplet/`

Example for a Next.js project with Drizzle:

```
node_modules/
.next/
drizzle/meta/
```

## Package.json Script

Add the format script to your `package.json`:

```json
{
	"scripts": {
		"format": "prettier --write ."
	}
}
```

## EditorConfig Integration

Create an `.editorconfig` file to ensure consistent formatting across different editors:

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

**Note:** If your project has a `package-lock.json` file, update the JSON section to:
```ini
[{package.json,package-lock.json}]
indent_style = space
indent_size = 2
```

## Usage

Run formatting manually:
```bash
npm run format
```

Or enable format-on-save in VS Code (see VS Code configuration guide).

---

## dependabot

*Source: `tooling/dependabot.md`*

# Dependabot Configuration

Automated dependency updates for Daniel's TypeScript projects using GitHub's Dependabot.

## Setup

Create `.github/dependabot.yml` in your repository root:

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

## Configuration Explanation

- **`package-ecosystem: "npm"`**: Monitors npm dependencies
- **`directory: "/"`**: Looks for `package.json` in the root directory
- **`schedule.interval: "daily"`**: Checks for updates daily
- **`commit-message.prefix: "[npm] "`**: Prefixes commit messages with `[npm]`
- **`labels`**: Adds "npm dependencies" label to pull requests

## Alternative Schedules

Change the `schedule.interval` based on your preferences:

```yaml
# Weekly updates (Mondays)
schedule:
  interval: "weekly"
  day: "monday"

# Monthly updates (first of the month)
schedule:
  interval: "monthly"
```

## Multiple Package Ecosystems

For projects using multiple package managers or ecosystems:

```yaml
version: 2
updates:
  # Frontend dependencies
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
    commit-message:
      prefix: "[npm] "
    labels:
      - "npm dependencies"
  
  # GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
    commit-message:
      prefix: "[actions] "
    labels:
      - "github-actions"
  
  # Docker dependencies
  - package-ecosystem: "docker"
    directory: "/"
    schedule:
      interval: "weekly"
    commit-message:
      prefix: "[docker] "
    labels:
      - "docker"
```

## Advanced Configuration

For more control over updates:

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
      time: "04:00"
      timezone: "America/New_York"
    commit-message:
      prefix: "[npm] "
      include: "scope"
    labels:
      - "npm dependencies"
    reviewers:
      - "your-github-username"
    assignees:
      - "your-github-username"
    open-pull-requests-limit: 10
    ignore:
      - dependency-name: "@types/*"
        update-types: ["version-update:semver-patch"]
```

## Benefits

- **Automated security updates**: Keeps dependencies secure automatically
- **Consistent update format**: Standardized commit messages and labels
- **Reduced maintenance**: Less manual dependency management
- **CI/CD integration**: Updates are tested automatically through your CI pipeline

## Best Practices

1. **Review updates regularly**: Don't just merge automatically
2. **Test thoroughly**: Ensure updates don't break functionality
3. **Monitor for breaking changes**: Pay attention to major version updates
4. **Configure appropriate schedules**: Daily might be too frequent for some projects
5. **Use labels and assignees**: Help organize and triage dependency updates

---

## package-scripts

*Source: `tooling/package-scripts.md`*

# Package.json Scripts Configuration

Standard scripts for Daniel's TypeScript-based development workflow.

## Core Scripts

Add these essential scripts to your `package.json`:

```json
{
	"scripts": {
		"typecheck": "tsc --noEmit",
		"format": "prettier --write ."
	}
}
```

### Script Explanations

- **`typecheck`**: Runs TypeScript compiler without emitting files, checking for type errors
- **`format`**: Formats all files in the project using Prettier

## Framework-Specific Scripts

### Next.js Projects

```json
{
	"scripts": {
		"dev": "next dev --turbopack",
		"build": "next build",
		"start": "next start",
		"lint": "next lint",
		"typecheck": "tsc --noEmit",
		"format": "prettier --write ."
	}
}
```

## Linting Scripts (Optional)

For non-Next.js projects using ESLint:

```json
{
	"scripts": {
		"lint": "eslint . --ext .ts,.tsx,.js,.jsx",
		"lint:fix": "eslint . --ext .ts,.tsx,.js,.jsx --fix"
	}
}
```

## Testing Scripts (Optional)

Common testing script patterns using Vitest:

```json
{
	"scripts": {
		"test": "vitest"
	}
}
```

## Database Scripts (Optional)

For projects using Drizzle ORM:

```json
{
	"scripts": {
		"db:generate": "drizzle-kit generate --config drizzle.config.ts",
		"db:migrate": "drizzle-kit migrate --config drizzle.config.ts",
		"db:studio": "drizzle-kit studio --config drizzle.config.ts"
	}
}
```

**Alternative naming patterns for complex projects:**

For projects with multiple database systems (e.g., Convex + Postgres):

```json
{
	"scripts": {
		"drizzle:generate": "drizzle-kit generate --config drizzle.config.ts",
		"drizzle:migrate": "drizzle-kit migrate --config drizzle.config.ts",
		"drizzle:studio": "drizzle-kit studio --config drizzle.config.ts"
	}
}
```

Or simplified for single-database projects:

```json
{
	"scripts": {
		"generate": "drizzle-kit generate --config drizzle.config.ts",
		"migrate": "drizzle-kit migrate --config drizzle.config.ts",
		"studio": "drizzle-kit studio --config drizzle.config.ts"
	}
}
```

## Complete Example

Full `package.json` scripts section for a Next.js project with Drizzle and testing:

```json
{
	"scripts": {
		"dev": "next dev --turbopack",
		"dev:sql": "cross-env LOG_SQL=true npm run dev",
		"build": "drizzle-kit migrate --config drizzle.config.ts && next build",
		"start": "next start",
		"lint": "next lint",
		"typecheck": "tsc --noEmit",
		"format": "prettier --write .",
		"test": "vitest",
		"db:generate": "drizzle-kit generate --config drizzle.config.ts",
		"db:migrate": "drizzle-kit migrate --config drizzle.config.ts",
		"db:studio": "drizzle-kit studio --config drizzle.config.ts"
	}
}
```

## Usage

Run scripts using npm:

```bash
npm run dev
npm run typecheck
npm run format
```

---

*Consolidated from multiple source files on Sun Jul 13 00:41:16 UTC 2025*
*Source files: tooling/prettier/setup.md tooling/dependabot.md tooling/package-scripts.md*
