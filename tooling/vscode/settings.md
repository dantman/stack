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
