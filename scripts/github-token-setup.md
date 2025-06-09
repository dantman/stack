# GitHub Fine-Grained Personal Access Token Setup for AI Agents

This guide helps you create and configure GitHub Fine-Grained Personal Access Tokens optimized for AI agent workflows, including automated PR creation, workflow triggering, and CI/CD monitoring.

Fine-grained tokens provide repository-specific permissions with the principle of least privilege, making them ideal for secure AI agent automation. We exclusively use fine-grained tokens as they offer superior security through granular permissions and repository-specific access control.

## Fine-Grained Repository Token Setup

For secure AI agent automation, create a **fine-grained personal access token** scoped only to your repository. This provides maximum security by limiting access to just the specific repository and permissions needed.

## Fine-Grained Repository Token (Maximum Security)

For production use or maximum security, create a **fine-grained personal access token** scoped only to your repository.

### Required Permissions

| Permission | Level | Purpose |
|------------|-------|---------|
| **Repository access** | Selected | Only `daniel/stack` |
| **Contents** | Write | Read/write files, create branches |
| **Metadata** | Read | Repository information |
| **Actions** | Write | Trigger workflows, view runs |
| **Pull requests** | Write | Create, update, merge PRs |
| **Issues** | Write | Create/manage issues |
| **Commit statuses** | Read | Monitor CI/CD status |

### Creation Steps

1. **Navigate to GitHub Settings**
   - Go to Settings → Developer settings → Personal access tokens → Fine-grained tokens

2. **Generate New Token**
   - Name: `AI Agent - Stack Repository`
   - Expiration: 90 days (recommended)
   - Resource owner: Your username
   - Repository access: Selected repositories → `dantman/stack`

3. **Set Repository Permissions**
   ```
   ✅ Actions: Write
   ✅ Commit statuses: Read
   ✅ Contents: Write
   ✅ Issues: Write
   ✅ Metadata: Read
   ✅ Pull requests: Write
   ```

4. **Generate and Secure Token**
   - Copy the token immediately
   - Store securely (never commit to files)
   - Use with VS Code's secure input system

## Enhanced AI Agent Capabilities

With these permissions, AI agents can perform sophisticated workflows:

### Automated Development Workflows

- **Branch Management**: Create feature branches from issues
- **Code Changes**: Make targeted edits and commits
- **Pull Request Automation**: Create PRs with detailed descriptions
- **CI/CD Monitoring**: Wait for checks and handle failures
- **Auto-Merge**: Merge PRs when all conditions are met
- **Issue Tracking**: Create and link issues to PRs

### Example AI Commands

```text
"Create a PR to update the TypeScript configurations"
"Monitor PR #42 and merge when all checks pass"
"Create an issue for documenting the new MCP setup"
"Trigger the index workflow and create a PR if changes are needed"
"Check the status of all open PRs and their CI results"
```

### Complex Workflow Orchestration

AI agents can now handle multi-step processes:

1. **Issue Detection** → Identify needed changes
2. **Branch Creation** → Create feature branch
3. **Code Implementation** → Make necessary edits
4. **Testing** → Run local validation
5. **PR Creation** → Submit with proper description
6. **CI Monitoring** → Track pipeline status
7. **Auto-Merge** → Complete when ready
8. **Cleanup** → Remove branch and notify

## Setup Script for Fine-Grained Token Automation

For reproducible fine-grained token setup, use the provided script:

```bash
# Run the fine-grained token setup script
./scripts/setup-github-auth.sh
```

This script will:
1. Guide you through creating a fine-grained token
2. Set up the token with proper permissions
3. Test all required access levels
4. Provide next steps for VS Code integration

## Token Management Best Practices

### Security Guidelines

- **Scope Minimally**: Use fine-grained tokens for specific repositories
- **Rotate Regularly**: Set 30-90 day expiration and update proactively
- **Store Securely**: Use VS Code's input system, never commit tokens
- **Monitor Usage**: Check token activity in GitHub settings

### Monitoring Commands

```bash
# Check current authentication
gh auth status

# Test API access directly
gh api repos/dantman/stack

# Verify workflow permissions
gh workflow list --repo dantman/stack

# Test PR operations
gh pr list --repo dantman/stack

# Check issue access
gh issue list --repo dantman/stack
```

## Troubleshooting

### Common Issues

**Token Expired or Invalid:**
```bash
gh auth refresh
# If that fails:
gh auth login --scopes "repo,actions:write,pull_requests:write,issues:write"
```

**Missing Permissions:**
```bash
# Check current scopes
gh auth status

# Re-login with correct scopes
gh auth login --scopes "repo,actions:write,pull_requests:write,issues:write"
```

**Repository Access Issues:**
```bash
# Test direct API access
gh api repos/daniel/stack

# Check if token has repository access
gh repo list --limit 10
```

### Testing Token Functionality

```bash
# Test workflow dispatch
gh workflow run update-index.yml --repo daniel/stack

# Test PR creation capability
gh api repos/daniel/stack/pulls --method GET

# Test issue access
gh api repos/daniel/stack/issues --method GET
```

## Integration with VS Code MCP

The token you create will be used securely through VS Code's MCP configuration:

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

When VS Code starts, it will securely prompt for your token, which is then used by the GitHub MCP server for all AI agent operations.

---

**Next Steps:**
1. Run the setup script or follow manual steps
2. Restart VS Code to load MCP configuration
3. Test AI agent commands for workflow triggering
4. Explore advanced automation capabilities
