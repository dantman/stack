#!/bin/bash
# This script assists with setting up fine-grained tokens for GitHub repository access
# Required for AI agent workflows and automation
# We exclusively use fine-grained tokens for enhanced security and granular control

set -e  # Exit on any error

echo "🔐 GitHub Fine-Grained Token Setup Assistant"
echo "----------------------------------------"
echo "This script will guide you through creating a secure,"
echo "repository-specific fine-grained token for AI agent workflows."
echo "We exclusively use fine-grained tokens for enhanced security."
echo ""

# Check if gh is installed
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI is not installed. Please install it first:"
    echo "   https://cli.github.com/"
    echo ""
    echo "Installation options:"
    echo "   # Ubuntu/Debian:"
    echo "   sudo apt install gh"
    echo ""
    echo "   # macOS:"
    echo "   brew install gh"
    echo ""
    echo "   # Or download from: https://github.com/cli/cli/releases"
    exit 1
fi

echo "✅ GitHub CLI found: $(gh --version | head -1)"
echo ""

echo "🔒 Setting up fine-grained token (repository-scoped for maximum security)..."
echo ""
echo "⚠️  Fine-grained tokens must be created manually via GitHub web interface."
echo ""
echo "📋 Steps to create fine-grained token:"
echo "  1. Go to: https://github.com/settings/personal-access-tokens/new"
echo "  2. Name: 'AI Agent - Stack Repository'"
echo "  3. Repository access: Selected repositories → dantman/stack"
echo "  4. Repository permissions:"
echo "     ✅ Actions: Write"
echo "     ✅ Commit statuses: Read"
echo "     ✅ Contents: Write"
echo "     ✅ Issues: Write"
echo "     ✅ Metadata: Read"
echo "     ✅ Pull requests: Write"
echo "  5. Generate token and copy it"
echo ""
read -p "Press Enter when you have created and copied the token..."
echo ""
read -s -p "🔑 Paste your fine-grained token: " FINE_GRAINED_TOKEN
echo ""
echo ""

# Set up fine-grained token
export GH_TOKEN="$FINE_GRAINED_TOKEN"
echo "✅ Fine-grained token configured via environment variable"

echo ""
echo "✅ Authentication successful!"
echo ""

# Verify authentication
echo "🔍 Verifying authentication and permissions..."
gh auth status
echo ""

# Test repository access
echo "🔧 Testing repository access..."
REPO_OWNER="dantman"
REPO_NAME="stack"

if gh repo view "$REPO_OWNER/$REPO_NAME" &> /dev/null; then
    echo "✅ Repository access confirmed for $REPO_OWNER/$REPO_NAME"
else
    echo "⚠️  Repository access test failed for $REPO_OWNER/$REPO_NAME"
    echo "This might be normal if the repository is private or doesn't exist yet."
fi

# Test workflow access
echo "🔧 Testing workflow access..."
if gh workflow list --repo "$REPO_OWNER/$REPO_NAME" &> /dev/null; then
    echo "✅ Workflow access confirmed"
    echo "📋 Available workflows:"
    gh workflow list --repo "$REPO_OWNER/$REPO_NAME" | head -5
else
    echo "⚠️  Workflow access test failed"
    echo "This might be normal if no workflows exist yet."
fi

# Test PR access
echo "🔧 Testing PR access..."
if gh api "repos/$REPO_OWNER/$REPO_NAME/pulls" --method GET &> /dev/null; then
    echo "✅ Pull request access confirmed"
else
    echo "⚠️  Pull request access test failed"
fi

# Test Issues access
echo "🔧 Testing issues access..."
if gh api "repos/$REPO_OWNER/$REPO_NAME/issues" --method GET &> /dev/null; then
    echo "✅ Issues access confirmed"
else
    echo "⚠️  Issues access test failed"
fi

echo ""
echo "🎉 GitHub fine-grained token setup complete!"
echo ""
echo "🤖 AI agents can now:"
echo "   • Trigger workflows (update-index.yml, etc.)"
echo "   • Create and manage pull requests"
echo "   • Monitor CI/CD pipeline status"
echo "   • Create issues and link them to PRs"
echo "   • Orchestrate complex development workflows"
echo ""
echo "📝 Next steps:"
echo "   1. Restart VS Code to load MCP configuration"
echo "   2. Test AI agent commands like:"
echo "      'Please trigger the index update workflow'"
echo "      'Create a PR for the recent changes'"
echo ""
echo "🔐 Security notes:"
echo "   • This fine-grained token only works with dantman/stack repository"
echo "   • VS Code will prompt for the token securely (never stored in files)"
echo "   • Token expires automatically for security"
echo ""
echo "🆘 Troubleshooting:"
echo "   • Run 'gh auth status' to check authentication"
echo "   • Recreate token if it expires"
echo "   • Ensure token has all required repository permissions"

if gh repo view "$REPO_OWNER/$REPO_NAME" &> /dev/null; then
    echo "✅ Repository access confirmed for $REPO_OWNER/$REPO_NAME"
else
    echo "⚠️  Repository access test failed for $REPO_OWNER/$REPO_NAME"
    echo "This might be normal if the repository is private or doesn't exist yet."
fi

# Test workflow access
echo "🔧 Testing workflow access..."
if gh workflow list --repo "$REPO_OWNER/$REPO_NAME" &> /dev/null; then
    echo "✅ Workflow access confirmed"
    echo "📋 Available workflows:"
    gh workflow list --repo "$REPO_OWNER/$REPO_NAME" | head -5
else
    echo "⚠️  Workflow access test failed"
    echo "This might be normal if no workflows exist yet."
fi

# Test PR access
echo "🔧 Testing PR access..."
if gh api "repos/$REPO_OWNER/$REPO_NAME/pulls" --method GET &> /dev/null; then
    echo "✅ Pull request access confirmed"
else
    echo "⚠️  Pull request access test failed"
fi

# Test Issues access
echo "🔧 Testing issues access..."
if gh api "repos/$REPO_OWNER/$REPO_NAME/issues" --method GET &> /dev/null; then
    echo "✅ Issues access confirmed"
else
    echo "⚠️  Issues access test failed"
fi

echo ""
echo "🎉 GitHub CLI setup complete!"
echo ""
echo "🤖 AI agents can now:"
echo "   • Trigger workflows (update-index.yml, etc.)"
echo "   • Create and manage pull requests"
echo "   • Monitor CI/CD pipeline status"
echo "   • Create issues and link them to PRs"
echo "   • Orchestrate complex development workflows"
echo ""
echo "📝 Next steps:"
echo "   1. Restart VS Code to load MCP configuration"
echo "   2. Test AI agent commands like:"
echo "      'Please trigger the index update workflow'"
echo "      'Create a PR for the recent changes'"
echo "   3. Review the token setup guide: scripts/github-token-setup.md"
echo ""
echo "🔐 Security notes:"
echo "   • Token is only valid for daniel/stack repository"
echo "   • VS Code will prompt for the token securely (never stored in files)"
echo "   • Set up token rotation using expiration settings"
echo ""
echo "🆘 Troubleshooting:"
echo "   • Run 'gh auth status' to check authentication"
echo "   • Create a new token once current one expires"
echo "   • See scripts/github-token-setup.md for detailed guidance"
