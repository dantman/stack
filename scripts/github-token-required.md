# GitHub Fine-Grained Token Setup for AI Agents

If you're seeing this message, it means the AI agent cannot access GitHub functionality and needs you to set up a fine-grained personal access token.

## Why Fine-Grained Tokens?

Fine-grained tokens provide **repository-specific access** instead of broad permissions across all your repositories. This is much more secure for AI agent automation.

## Quick Setup Steps

### 1. Create the Token

**Click here to create your token:** [Create Fine-Grained Token](https://github.com/settings/personal-access-tokens/new)

### 2. Configure the Token

When creating the token, use these exact settings:

- **Token name**: `AI Agent - Stack Repository`
- **Expiration**: 90 days (or your preference)
- **Resource owner**: `dantman`
- **Repository access**: Selected repositories → `dantman/stack`

### 3. Set Repository Permissions

Enable these specific permissions:

- ✅ **Actions**: Write *(trigger workflows)*
- ✅ **Commit statuses**: Read *(monitor CI/CD status)*
- ✅ **Contents**: Write *(read/write files)*
- ✅ **Issues**: Write *(create issues)*
- ✅ **Metadata**: Read *(repository info)*
- ✅ **Pull requests**: Write *(create PRs)*

### 4. Generate and Save

1. Click "Generate token"
2. **Copy the token immediately** (you won't see it again!)
3. Restart VS Code
4. When prompted, paste your token securely

## What AI Agents Can Do

With this token, AI agents can:

- 🚀 Trigger GitHub Actions workflows (like index updates)
- 📝 Create and manage pull requests
- 🔍 Monitor CI/CD pipeline status  
- 🐛 Create issues and link them to PRs
- 🔄 Orchestrate complex development workflows

## Security Notes

- ✅ Token only works with the `dantman/stack` repository
- ✅ VS Code stores the token securely (never in files)
- ✅ Token expires automatically for security
- ✅ You can revoke it anytime in GitHub settings

## Troubleshooting

**If the AI agent still can't access GitHub after setup:**

1. Restart VS Code completely
2. Verify the token has all required permissions
3. Check token hasn't expired in GitHub settings
4. Ensure you selected the correct repository (`dantman/stack`)

## Alternative: Use Setup Script

You can also run the automated setup script:

```bash
./scripts/setup-github-auth.sh
```

This script will guide you through the process step-by-step.

---

*This setup only needs to be done once. After that, AI agents can automatically handle GitHub operations for the stack repository.*
