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
