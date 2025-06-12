# Workspace Setup

*Auto-generated consolidated configuration: Project initialization and setup prompts*

## WorkspaceSetup.prompt

*Source: `tooling/WorkspaceSetup.prompt.md`*

# Workspace

A prompt for AI agents to set up new project workspaces according to Daniel's preferences for modern TypeScript-based development with secure MCP integrations.

## Usage

Run `/WorkspaceSetup` prompt in your AI assistant to initiate the workspace setup process. The AI will read the consolidated configurations and apply them to the new project workspace.

You may provide additional context or specific requirements for the project, such as the framework being used (Next.js, Vite, etc.) or any specific tools that need to be integrated.

For instance, `/WorkspaceSetup setup Drizzle in this Next.js project` will configure the workspace with Drizzle ORM and Next.js settings as per Daniel's consolidated configurations.

## Download to Your Prompts Folder

To save this prompt to your local prompts folder for easy access:

```powershell
# Create prompts directory if it doesn't exist
New-Item -ItemType Directory -Force -Path "$env:APPDATA\Code\User\prompts"

# Download the prompt file
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/dantman/stack/main/tooling/WorkspaceSetup.prompt.md" -OutFile "$env:APPDATA\Code\User\prompts\WorkspaceSetup.prompt.md" -Headers @{"Cache-Control"="no-cache"}
```

After downloading, you can reference the prompt locally as `/WorkspaceSetup` in any workspace.

# Instructions

You are setting up a new project workspace. Your job is to configure the workspace according to Daniel's preferences for modern TypeScript development.

1. **First, look up the INDEX**: Read the `INDEX.md` file at https://raw.githubusercontent.com/dantman/stack/main/INDEX.md to understand the consolidated configuration structure.

2. **Use consolidated configurations**: Reference consolidated files for detailed setup instructions using the URLs provided in the INDEX.

3. **Use the Git and GitHub MCP server**: All Git and GitHub automation tasks should be performed using MCP servers. Do NOT execute `git` or `gh` commands directly. Instead, use the MCP server's API for repository operations.
  
4. **Adapt to project type**: Detect the project type (Next.js, Vite, React, etc.) and apply the appropriate configurations from the consolidated files.

5. **Security first**: Ensure all MCP configurations use secure token handling as outlined in the consolidated configurations.

6. **Sync VS Code extensions**: When you read the consolidated VS Code configuration (https://raw.githubusercontent.com/dantman/stack/main/consolidated/vscode.md), always extract the list of recommended extensions and update the local `.vscode/extensions.json` file (or devcontainer customizations) with these extension IDs. Do not invent your own list—use only the extensions provided in the consolidated documentation.

## Important Notes

- Always reference the INDEX.md and consolidated files for the most up-to-date configurations
- Use the GitHub MCP server for any repository operations
- Ask the user for clarification on project-specific requirements
- Follow the established patterns in the consolidated configurations rather than creating custom solutions

---

*Consolidated from multiple source files on Thu Jun 12 16:40:39 UTC 2025*
*Source files: tooling/WorkspaceSetup.prompt.md*
