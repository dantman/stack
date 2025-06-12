# Daniel's Web Development Stack Reference

A curated collection of TypeScript-based web development configurations, prompts, and customizations designed to accelerate project setup and provide AI assistants like Copilot with context for new project scaffolding.

## 🤖 About Daniel

> **Daniel Friesen** is a Canadian web developer with a strong specialization in React and TypeScript. As a T-shaped professional, Daniel is comfortable working across the full stack, connecting end users to domain experts, and diving deep into frontend architecture, design systems, and accessibility. He is a problem-solver at heart, passionate about building robust solutions with modern web technologies.

## Repository Purpose

This repository serves as a reference for my preferred web development stacks and configurations. Rather than being a monorepo of full project templates, it contains:

- **AI Prompt Files**: Carefully crafted prompts for setting up specific stack configurations
- **Stack Customizations**: Detailed markdown files documenting my preferred setups for various frameworks
- **Configuration Snippets**: Key configuration files and best practices
- **Setup Guides**: Step-by-step instructions for initializing projects with specific tech stacks

The primary goal is to provide AI assistants (like GitHub Copilot) with rich context when setting up new projects, while also serving as a personal reference and being useful to other developers curious about modern TypeScript-based development workflows.

## Stack Philosophy

I'm a polyglot developer who chooses stacks based on what best fits each project's requirements. While I have specialties where I'm faster and more experienced, I enjoy exploring new technologies that have matured enough for production use.

**Current Focus Areas:**

- TypeScript-first development across all layers
- Modern React patterns and architecture
- Type-safe database interactions
- Serverless-first deployment strategies
- Cross-platform mobile development (PWA, Capacitor, React Native)
- Accessibility and UX optimization

## AI-Assisted Development

AI has become an integral part of my development workflow, particularly for organization, documentation, and accelerating routine tasks. This repository itself exemplifies this approach—using AI to transform disorganized notes into structured, readable documentation.

While AI enhances my productivity and considerably enhances the polish of my communication, my core engineering and explanation abilities remain independent of these tools—just don't expect this level of polish in my unassisted writing or anxiety-riddled speech!

### AI Tools in My Workflow

- **Kagi Assistant**: Primary AI for research, knowledge discovery, and general problem-solving
- **GitHub Copilot**: Code assistance, Next Edit Suggestions, and quick information lookup
- **Gemini**: Specialized tasks requiring specific capabilities

### How This Repository Leverages AI

This repository serves as an **AI knowledge source** in two key ways:

1. **Prompt Files**: Reusable prompts that I copy into personal collections or project-specific prompt folders
2. **Reference Documentation**: Structured markdown files that AI can read and reference when setting up new projects

Many of these prompt files are actually **crafted by AI**—created through interactive sessions with Copilot where I work through a task, then ask it to distill the process into a reusable prompt for future use.

### AI Philosophy & Best Practices

**Treating AI with Respect**: Large language models are trained on human writing patterns, so approaching them with the same politeness and respect you'd show a human colleague consistently yields better results.

**Understanding AI's Strengths**: AI excels at tasks humans have already solved and documented—looking up solutions, executing established patterns, and handling mundane or tedious work. It's particularly valuable for:
- Organizing scattered thoughts into coherent documentation
- Finding knowledge you can describe but can't easily search for
- Writing text that follows human communication patterns

**Recognizing Limitations**: AI cannot handle complex architectural thinking or engineering decisions that require deep reasoning. It's like switching to a formula racecar—if you know how to steer at speed, it can make you magnitudes faster. But without proper guidance and experience, you'll crash harder than you would have otherwise.

**The ADHD Advantage**: For those of us with ADHD-spectrum traits who struggle with traditional writing, AI serves as an invaluable translation layer—converting disorganized notes and thoughts into clear, structured communication.

> **Note**: This very section (and much of this README) exemplifies this approach—while written by Claude, it faithfully represents my thoughts because rather than giving a brief "write something like this" prompt, I provided my full, disorganized thoughts at similar length to what you're reading. The AI served as an editor and organizer, not a content creator. 😅 Claude's words, not mine!

## Technology Stack Overview

### 🚀 **Frontend Frameworks**
![Next.js][nextjs-badge] ![Astro][astro-badge] ![React][react-badge] ![Vite][vite-badge]

- **Next.js + Vercel**: Primary choice for full-stack applications
- **Astro**: Preferred for content-heavy and static sites
- **React Router**: For projects requiring more control over routing
- **Vite**: For single-page applications and rapid prototyping

### 📱 **Mobile Development**
![PWA][pwa-badge] ![Capacitor][capacitor-badge] ![Expo][expo-badge]

- **Progressive Web Apps**: For web-first mobile experiences
- **Capacitor**: When native mobile features are required
- **Expo (React Native)**: For complex native mobile applications

### 🗄️ **Databases & ORMs**
![PostgreSQL][postgresql-badge] ![MySQL][mysql-badge] ![MongoDB][mongodb-badge] ![Drizzle][drizzle-badge] ![Prisma][prisma-badge]

- **PostgreSQL & MySQL**: Traditional relational databases
- **MongoDB**: For document-based data models
- **Drizzle & Prisma**: Type-safe database libraries
- **Convex.dev**: Currently investigating for real-time applications

### 🎨 **Styling & UI**
![Tailwind CSS][tailwind-badge] ![Figma][figma-badge]

- **Tailwind CSS**: Primary styling framework
- **Design System Implementation**: Custom component libraries
- **Figma-to-Code**: Converting designs to pixel-perfect implementations

### ☁️ **Infrastructure & Deployment**
![Vercel][vercel-badge] ![Kubernetes][kubernetes-badge] ![Docker][docker-badge]

- **Vercel**: Primary hosting for Next.js applications
- **Kubernetes**: For projects requiring more complex infrastructure
- **Docker**: For containerized deployments

## Repository Structure

```
📁 tooling/                    ## Development workflow and tools
├── WorkspaceSetup.prompt.md   # Complete workspace setup prompt for AI assistants
├── package-scripts.md         # Standard package.json scripts configuration
├── dependabot.md              # GitHub Dependabot automated dependency updates
├── prettier/                  # Code formatting setup
│   └── setup.md               # Prettier configuration and EditorConfig
├── vscode/                    # VS Code workspace configurations
│   ├── settings.md            # Core VS Code settings for TypeScript development
│   ├── mcp-servers.md         # Model Context Protocol server configurations
│   ├── tasks.md               # Task runner configurations for common workflows
│   └── extensions.md          # Recommended VS Code extensions
└── linting/                   # Code quality and linting tools (coming soon)
```

> **Current Focus**: This repository currently contains comprehensive tooling configurations as the foundational layer. Framework-specific configurations (Next.js, Astro, mobile, database, deployment) will be added as the repository grows.

## Current Repository Contents

### 🛠️ Tooling & Workspace Setup

The repository currently provides comprehensive development workflow configurations:

- **[Workspace Setup Prompt](tooling/WorkspaceSetup.prompt.md)**: A complete AI prompt for setting up new TypeScript projects with all preferred configurations
- **[Package Scripts](tooling/package-scripts.md)**: Standard `package.json` scripts for TypeScript development workflows
- **[Prettier Setup](tooling/prettier/setup.md)**: Code formatting configuration with EditorConfig integration
- **[VS Code Settings](tooling/vscode/settings.md)**: Core editor settings for TypeScript development
- **[MCP Server Configuration](tooling/vscode/mcp-servers.md)**: Model Context Protocol servers for enhanced AI capabilities
- **[VS Code Tasks](tooling/vscode/tasks.md)**: Task runner configurations for common development workflows
- **[Dependabot Configuration](tooling/dependabot.md)**: Automated dependency update setup
- **[VS Code Extensions](tooling/vscode/extensions.md)**: Recommended extensions for enhancing the development experience

### 🔮 Coming Soon

Framework-specific configurations will be added in future updates:
- Next.js project templates and configurations
- Astro static site generation setups
- Mobile development (PWA, Capacitor, React Native) configurations
- Database and ORM setup guides
- Deployment and infrastructure patterns

## How to Use This Repository

### For AI Assistants (Copilot, etc.)

This repository is designed to provide context for AI-assisted development. When starting a new project:

1. **Use the Complete Setup Prompt**: Copy the [workspace setup prompt](tooling/WorkspaceSetup.prompt.md) and paste it into your AI assistant for automatic project configuration
2. **Reference Specific Configurations**: Link to individual configuration files when you need specific setup instructions
3. **Adapt to Your Needs**: The configurations serve as starting points that can be customized for specific project requirements

### For Developers

Each configuration file includes:
- **Setup instructions**: Step-by-step installation and configuration
- **Configuration examples**: Copy-pasteable code snippets
- **Best practices**: Explanations of why certain choices were made
- **Customization notes**: How to adapt configurations for different use cases

### Quick Start

For a new TypeScript project, the fastest way to get started is to use the [workspace setup prompt](tooling/WorkspaceSetup.prompt.md) with an AI assistant. This will configure:

- Package.json scripts for TypeScript and formatting
- Prettier with EditorConfig
- VS Code workspace settings and tasks
- MCP server integration for enhanced AI capabilities
- Optional Dependabot for automated dependency updates

## Contributing

This repository primarily serves as my personal reference, but contributions are welcome! If you have improvements to existing configurations or want to add support for additional TypeScript-based stacks, feel free to open an issue to discuss your ideas.

## Contact

Feel free to reach out if you have questions about any of the configurations or want to discuss web development:

- **Personal/Professional Email**: [d@danf.ca](mailto:d@danf.ca)
- **Contract Work**: [daniel@redwerks.org](mailto:daniel@redwerks.org)
- **LinkedIn**: [linkedin.com/in/daniel-friesen](https://www.linkedin.com/in/daniel-friesen/)

## Current Status

✅ **Initial tooling configurations complete** - Comprehensive workspace setup and development workflow configurations now available.

🚧 **Framework-specific configurations coming next** - Next.js, Astro, mobile, and database configurations planned for future updates.

*Last updated: June 2025*

<!-- Badge References -->
[nextjs-badge]: https://img.shields.io/badge/Next.js-000000?style=flat&logo=next.js&logoColor=white
[astro-badge]: https://img.shields.io/badge/Astro-FF5D01?style=flat&logo=astro&logoColor=white
[react-badge]: https://img.shields.io/badge/React-61DAFB?style=flat&logo=react&logoColor=black
[vite-badge]: https://img.shields.io/badge/Vite-646CFF?style=flat&logo=vite&logoColor=white
[pwa-badge]: https://img.shields.io/badge/PWA-5A0FC8?style=flat&logo=pwa&logoColor=white
[capacitor-badge]: https://img.shields.io/badge/Capacitor-119EFF?style=flat&logo=capacitor&logoColor=white
[expo-badge]: https://img.shields.io/badge/Expo-000020?style=flat&logo=expo&logoColor=white
[postgresql-badge]: https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white
[mysql-badge]: https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white
[mongodb-badge]: https://img.shields.io/badge/MongoDB-47A248?style=flat&logo=mongodb&logoColor=white
[drizzle-badge]: https://img.shields.io/badge/Drizzle-C5F74F?style=flat&logo=drizzle&logoColor=black
[prisma-badge]: https://img.shields.io/badge/Prisma-2D3748?style=flat&logo=prisma&logoColor=white
[tailwind-badge]: https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=flat&logo=tailwind-css&logoColor=white
[figma-badge]: https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=figma&logoColor=white
[vercel-badge]: https://img.shields.io/badge/Vercel-000000?style=flat&logo=vercel&logoColor=white
[kubernetes-badge]: https://img.shields.io/badge/Kubernetes-326CE5?style=flat&logo=kubernetes&logoColor=white
[docker-badge]: https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white
