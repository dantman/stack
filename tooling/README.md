# Tooling Overview

This directory contains Daniel's preferred development workflow and tooling configurations for TypeScript-based projects.

## Quick Reference

| Configuration | Purpose | Key Features |
|---------------|---------|--------------|
| [WorkspaceSetup.prompt.md](WorkspaceSetup.prompt.md) | Complete project setup | AI prompt for full workspace configuration |
| [package-scripts.md](package-scripts.md) | NPM scripts | TypeScript, formatting, and framework-specific scripts |
| [prettier/setup.md](prettier/setup.md) | Code formatting | Prettier + EditorConfig integration |
| [vscode/settings.md](vscode/settings.md) | Editor settings | Format-on-save, auto-imports, TypeScript support |
| [vscode/mcp-servers.md](vscode/mcp-servers.md) | AI integration | GitHub, Git, and Jira MCP servers |
| [vscode/tasks.md](vscode/tasks.md) | Task automation | NPM scripts, Vercel, Docker Compose tasks |
| [dependabot.md](dependabot.md) | Dependency updates | Automated GitHub dependency management |

## Getting Started

### For New Projects

1. **Use the AI prompt**: Copy [WorkspaceSetup.prompt.md](WorkspaceSetup.prompt.md) into your AI assistant
2. **Follow the setup**: The AI will configure your entire development environment
3. **Customize as needed**: Adapt configurations for your specific project requirements

### For Existing Projects

Pick and choose individual configurations based on what you need:

- Add [package scripts](package-scripts.md) for consistent development workflows
- Set up [Prettier formatting](prettier/setup.md) for code consistency
- Configure [VS Code settings](vscode/settings.md) for optimal TypeScript development
- Enable [Dependabot](dependabot.md) for automated dependency updates

## Configuration Philosophy

These configurations prioritize:

- **TypeScript-first development** - All configurations assume TypeScript usage
- **Format-on-save workflows** - Minimal friction for code formatting
- **AI-enhanced development** - MCP servers and prompts for AI integration
- **Consistent tooling** - Standardized scripts and settings across projects
- **Automated maintenance** - Dependabot and tasks for reduced manual work

## Dependencies

Most configurations assume you have:

- **Node.js** (latest LTS recommended)
- **VS Code** with recommended extensions
- **TypeScript** configured in your project
- **Git** for version control

Optional but recommended:

- **Docker** (for GitHub MCP server)
- **Vercel CLI** (for Vercel deployments)
- **Docker Compose** (for containerized development)
