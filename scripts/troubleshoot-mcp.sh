#!/bin/bash
# Quick troubleshooting script for GitHub MCP setup

echo "🔍 GitHub MCP Setup Troubleshooting"
echo "=================================="
echo ""

# Check if Docker is running
echo "🐳 Checking Docker status..."
if command -v docker &> /dev/null; then
    if docker info &> /dev/null; then
        echo "✅ Docker is running"
    else
        echo "❌ Docker is installed but not running"
        echo "   Start Docker: sudo systemctl start docker"
    fi
else
    echo "❌ Docker is not installed"
    echo "   Install Docker: https://docs.docker.com/get-docker/"
fi
echo ""

# Check GitHub CLI
echo "🔧 Checking GitHub CLI..."
if command -v gh &> /dev/null; then
    echo "✅ GitHub CLI found: $(gh --version | head -1)"
    
    echo "🔍 Checking GitHub authentication..."
    if gh auth status &> /dev/null; then
        echo "✅ GitHub CLI is authenticated"
        gh auth status 2>&1 | head -3
    else
        echo "❌ GitHub CLI is not authenticated"
        echo "   Run: ./scripts/setup-github-auth.sh"
    fi
else
    echo "❌ GitHub CLI not found"
    echo "   Install: https://cli.github.com/"
fi
echo ""

# Check repository access
echo "🏠 Checking repository access..."
if command -v gh &> /dev/null && gh auth status &> /dev/null; then
    if gh repo view dantman/stack &> /dev/null; then
        echo "✅ Repository access confirmed"
    else
        echo "❌ Cannot access dantman/stack repository"
        echo "   Check token permissions or repository visibility"
    fi
else
    echo "⏭️  Skipping repository check (GitHub CLI not set up)"
fi
echo ""

# Check MCP configuration
echo "📋 Checking MCP configuration..."
if [ -f ".vscode/mcp.json" ]; then
    echo "✅ MCP configuration file exists"
    if grep -q "github-mcp-server" .vscode/mcp.json; then
        echo "✅ GitHub MCP server configured"
    else
        echo "❌ GitHub MCP server not found in config"
    fi
else
    echo "❌ MCP configuration file missing"
    echo "   File should be at: .vscode/mcp.json"
fi
echo ""

# Check workflow file
echo "⚙️  Checking workflow configuration..."
if [ -f ".github/workflows/update-index.yml" ]; then
    echo "✅ Workflow file exists"
    if grep -q "workflow_dispatch" .github/workflows/update-index.yml; then
        echo "✅ Workflow dispatch trigger configured"
    else
        echo "❌ Workflow dispatch trigger not found"
    fi
else
    echo "❌ Workflow file missing"
    echo "   File should be at: .github/workflows/update-index.yml"
fi
echo ""

echo "📝 Next Steps:"
echo "1. Fix any ❌ issues above"
echo "2. Restart VS Code to load MCP configuration"
echo "3. Test with: 'Please trigger the index update workflow'"
echo ""
echo "🆘 If problems persist:"
echo "   • Check VS Code output panel for MCP server logs"
echo "   • Verify fine-grained token permissions"
echo "   • Ensure token hasn't expired"
