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
📁 nextjs/            # Next.js setup guides, prompts, and configurations
├── prompts/          # AI prompts for project initialization
├── configurations/   # Detailed setup and customization guides
├── snippets/         # Reusable components and utilities
└── examples/         # Implementation patterns and best practices

📁 astro/             # Astro project resources
├── prompts/          # Static site and content-focused prompts
├── configurations/   # Build and deployment configurations
└── examples/         # Static site patterns and optimizations

📁 mobile/            # Cross-platform mobile development
├── pwa/              # Progressive Web App setup and configs
├── capacitor/        # Capacitor native app configurations
├── expo/             # React Native with Expo setup guides
└── examples/         # Mobile-first design patterns

📁 database/          # Database and ORM configurations
├── postgresql/       # PostgreSQL setup and best practices
├── prisma/           # Prisma schema patterns and migrations
├── drizzle/          # Drizzle ORM configurations
└── convex/           # Convex.dev experimental setups

📁 deployment/        # Infrastructure and hosting
├── vercel/           # Vercel deployment configurations
├── kubernetes/       # K8s manifests and deployment guides
└── docker/           # Containerization patterns

📁 tooling/           # Development workflow and tools
├── vscode/           # VS Code configurations and extensions
├── linting/          # ESLint, Prettier, and code quality tools
└── testing/          # Testing setup and patterns
```

## How to Use This Repository

### For AI Assistants (Copilot, etc.)

This repository is designed to provide context for AI-assisted development. When starting a new project:

1. Reference the appropriate prompt files in the `prompts/` directory
2. Use the configuration guides in `configurations/` for detailed setup instructions
3. Leverage code snippets from `snippets/` for common patterns
4. Refer to `examples/` for implementation guidance

### For Developers

- Browse the configurations to understand modern TypeScript development patterns
- Use the prompts as templates for your own project setup
- Explore the examples for inspiration on architecture and design patterns
- Contribute improvements or additional stack configurations

## Getting Started

To get started with any stack configuration in this repository:

1. Choose the appropriate prompt file for your project type
2. Follow the configuration guide for detailed setup instructions
3. Customize the setup based on your specific requirements
4. Use the provided snippets and examples as building blocks

## Contributing

This repository primarily serves as my personal reference, but contributions are welcome! If you have improvements to existing configurations or want to add support for additional TypeScript-based stacks, feel free to open an issue to discuss your ideas.

## Contact

Feel free to reach out if you have questions about any of the configurations or want to discuss web development:

- **Personal/Professional Email**: [d@danf.ca](mailto:d@danf.ca)
- **Contract Work**: [daniel@redwerks.org](mailto:daniel@redwerks.org)
- **LinkedIn**: [linkedin.com/in/daniel-friesen](https://www.linkedin.com/in/daniel-friesen/)

## Current Status

🚧 **Repository is actively being populated** - Currently adding initial prompt files and configuration guides.
🕑 *Last updated: June 2025*

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
