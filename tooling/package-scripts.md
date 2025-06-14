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
