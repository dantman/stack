# Triggering Index Update Workflow

This document explains the different ways to trigger the `update-index.yml` GitHub Actions workflow for unattended runs.

## Current Workflow Status

The `update-index.yml` workflow is already configured with `workflow_dispatch` trigger, which means it can be manually triggered through various methods:

```yaml
on:
  workflow_dispatch:
    inputs:
      force_update:
        description: 'Force update even if no changes detected'
        required: false
        default: false
        type: boolean
```

## GitHub's Official MCP Server (Recommended)

The repository is configured with GitHub's official MCP (Model Context Protocol) server, which provides comprehensive GitHub API integration including workflow dispatch capabilities.

### Current Configuration

The `.vscode/mcp.json` is configured with:

```json
{
  "inputs": [
    {
      "type": "promptString",
      "id": "github_token", 
      "description": "GitHub Personal Access Token",
      "password": true
    }
  ],
  "servers": {
    "github": {
      "command": "docker",
      "args": [
        "run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN",
        "ghcr.io/github/github-mcp-server"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${input:github_token}"
      }
    }
  }
}
```

### Key Benefits

- **Official GitHub integration**: Uses GitHub's own maintained MCP server
- **Secure token handling**: VS Code prompts for token securely, never stored in config files
- **Docker-based**: Reliable, consistent environment with automatic updates
- **Comprehensive API access**: Full GitHub API integration including workflow dispatch
- **Better security**: GitHub's official server with proper token isolation

### Prerequisites

- Docker installed and running
- Fine-grained GitHub Token with required permissions (see setup guide below)
- VS Code with MCP extension enabled
- Restart VS Code after configuration changes

### AI Agent Usage

With the official GitHub MCP server configured, you can ask an AI agent to:

```
Please trigger the update-index workflow in this repository
```

The AI agent will use GitHub's comprehensive API tools to:
- Access the repository
- Trigger the `update-index.yml` workflow using `workflow_dispatch`
- Monitor the workflow run status
- Provide feedback on completion

**Example commands:**
- "Run the index update workflow"
- "Check the status of the last index update"
- "Force an index update with force_update=true"
- "Show me the workflow run logs"

## Manual Trigger Options

### 1. GitHub Web Interface
- Navigate to the Actions tab in the repository
- Select "Update Stack Index" workflow  
- Click "Run workflow" button
- Optionally check "Force update" to bypass change detection

### 2. GitHub CLI
```bash
gh workflow run update-index.yml
# Or with force update
gh workflow run update-index.yml --field force_update=true
```

### 3. GitHub API
```bash
curl -X POST \
  -H "Authorization: token YOUR_GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/OWNER/REPO/actions/workflows/update-index.yml/dispatches \
  -d '{"ref":"main"}'
```

## Prerequisites for Automated Triggers

### GitHub Personal Access Token
Ensure your GitHub token has the necessary permissions:
- `actions:write` - Required to trigger workflows
- `repo` - Required for repository access

### Environment Variables
Set up these environment variables:
```bash
export GITHUB_TOKEN="your_personal_access_token"
export GITHUB_OWNER="your_username_or_org"
export GITHUB_REPO="stack"
```

This repository requires a **fine-grained personal access token** that is scoped only to this repository. This ensures AI agents have exactly the permissions they need, and nothing more.

## Creating Your Token

1. **Go to GitHub Settings**
   
   Navigate to `Settings` → `Developer settings` → `Personal access tokens` → `Fine-grained tokens`

2. **Create New Token**
   
   Click "Generate new token"

2. **Click "Generate new token"**

3. **Configure token:**
   - **Name**: `AI Agent - Stack Repository`
   - **Expiration**: 90 days (or custom)
   - **Resource owner**: Your username
   - **Repository access**: Selected repositories → `daniel/stack`

4. **Set repository permissions:**
   ```
   Repository permissions:
   ✅ Actions: Write
   ✅ Commit statuses: Read
   ✅ Contents: Write
   ✅ Issues: Write
   ✅ Metadata: Read
   ✅ Pull requests: Write
   ```

5. **Generate and copy token**

5. **Generate and Save**

   Copy your token immediately - you won't see it again! You'll use this token with VS Code's secure input system.

## Token Management Best Practices

### Security
- **Use fine-grained tokens** (repository-scoped)
- **Set reasonable expiration** (30-90 days)
- **Rotate regularly** and update MCP configuration
- **Store securely** using VS Code's input system (never in files)

### Monitoring
```bash
# Check current token and permissions
gh auth status

# Test repository access
gh api repos/daniel/stack

# Test workflow trigger permissions
gh workflow list --repo daniel/stack
```

### Automation-Friendly Setup Script

Create a setup script for easy token management:

```bash
#!/bin/bash
# setup-github-auth.sh

echo "Setting up GitHub authentication for AI agent workflows..."

# Set up the fine-grained token
export GH_TOKEN="your_fine_grained_token"

# Verify the token permissions
gh auth status
gh repo view daniel/stack
gh workflow list --repo daniel/stack

echo "✅ Setup complete! You can now use AI agents to:"
echo "  - Trigger workflows"
echo "  - Create and manage PRs"
echo "  - Monitor CI/CD status"
echo "  - Create issues and link them to PRs"
```

## AI Agent Workflow Capabilities

With the enhanced permissions, AI agents can now:

### Automated Development Workflows
- **Create feature branches** from issues or requests
- **Make code changes** and commit them
- **Create pull requests** with proper descriptions
- **Monitor CI/CD status** and wait for checks to pass
- **Auto-merge PRs** when all checks pass and reviews approve
- **Create issues** for tracking bugs or feature requests

### Example AI Commands
```
"Create a PR to fix the TypeScript errors in the tooling module"
"Monitor the status of PR #42 and merge it if all checks pass"
"Create an issue for updating the README with new MCP server info"
"Trigger the index update workflow and create a PR if changes are detected"
```

### Workflow Integration
The AI agent can orchestrate complex workflows:
1. **Detect changes** that need updates
2. **Create a branch** for the changes
3. **Make the necessary edits**
4. **Run tests/linting** locally
5. **Create a PR** with detailed description
6. **Monitor CI/CD** pipeline
7. **Auto-merge** when ready
8. **Clean up** branch and notify

## Troubleshooting

### Common Issues

1. **Permission Denied**
   - Check GitHub token permissions
   - Ensure `actions:write` scope is included

2. **Workflow Not Found**
   - Verify workflow file exists in `.github/workflows/`
   - Check workflow filename matches exactly

3. **MCP Server Connection Issues**
   - Restart VS Code
   - Check MCP server logs
   - Verify npm package installation

### Debug Commands
```bash
# Check GitHub auth status
gh auth status

# List available workflows  
gh workflow list

# View workflow definition
gh workflow view update-index.yml
```

### Testing Token Permissions
```bash
# Test workflow dispatch
gh workflow run update-index.yml --repo daniel/stack

# Test PR creation (dry run)
gh pr list --repo daniel/stack

# Test issue access
gh issue list --repo daniel/stack
```

## Conclusion

The `update-index.yml` workflow is ready for automated triggering through multiple methods. The GitHub Actions MCP server provides the cleanest integration for AI agents, enabling truly unattended operation while maintaining full control and visibility over the process.
