# Dependabot Configuration

Automated dependency updates for Daniel's TypeScript projects using GitHub's Dependabot.

## Setup

Create `.github/dependabot.yml` in your repository root:

```yaml
# To get started with Dependabot version updates, you'll need to specify which
# package ecosystems to update and where the package manifests are located.
# Please see the documentation for all configuration options:
# https://docs.github.com/code-security/dependabot/dependabot-version-updates/configuration-options-for-the-dependabot.yml-file

version: 2
updates:
  - package-ecosystem: "npm" # See documentation for possible values
    directory: "/" # Location of package manifests
    schedule:
      interval: "daily"
    commit-message:
      prefix: "[npm] "
    labels:
      - "npm dependencies"
```

## Configuration Explanation

- **`package-ecosystem: "npm"`**: Monitors npm dependencies
- **`directory: "/"`**: Looks for `package.json` in the root directory
- **`schedule.interval: "daily"`**: Checks for updates daily
- **`commit-message.prefix: "[npm] "`**: Prefixes commit messages with `[npm]`
- **`labels`**: Adds "npm dependencies" label to pull requests

## Alternative Schedules

Change the `schedule.interval` based on your preferences:

```yaml
# Weekly updates (Mondays)
schedule:
  interval: "weekly"
  day: "monday"

# Monthly updates (first of the month)
schedule:
  interval: "monthly"
```

## Multiple Package Ecosystems

For projects using multiple package managers or ecosystems:

```yaml
version: 2
updates:
  # Frontend dependencies
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
    commit-message:
      prefix: "[npm] "
    labels:
      - "npm dependencies"
  
  # GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
    commit-message:
      prefix: "[actions] "
    labels:
      - "github-actions"
  
  # Docker dependencies
  - package-ecosystem: "docker"
    directory: "/"
    schedule:
      interval: "weekly"
    commit-message:
      prefix: "[docker] "
    labels:
      - "docker"
```

## Advanced Configuration

For more control over updates:

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "daily"
      time: "04:00"
      timezone: "America/New_York"
    commit-message:
      prefix: "[npm] "
      include: "scope"
    labels:
      - "npm dependencies"
    reviewers:
      - "your-github-username"
    assignees:
      - "your-github-username"
    open-pull-requests-limit: 10
    ignore:
      - dependency-name: "@types/*"
        update-types: ["version-update:semver-patch"]
```

## Benefits

- **Automated security updates**: Keeps dependencies secure automatically
- **Consistent update format**: Standardized commit messages and labels
- **Reduced maintenance**: Less manual dependency management
- **CI/CD integration**: Updates are tested automatically through your CI pipeline

## Best Practices

1. **Review updates regularly**: Don't just merge automatically
2. **Test thoroughly**: Ensure updates don't break functionality
3. **Monitor for breaking changes**: Pay attention to major version updates
4. **Configure appropriate schedules**: Daily might be too frequent for some projects
5. **Use labels and assignees**: Help organize and triage dependency updates
