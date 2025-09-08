# AI Investor Outreach Automation

> An intelligent platform that automates and optimizes investor outreach for startup fundraising using AI-powered personalization and multi-platform coordination.

[![Next.js](https://img.shields.io/badge/Next.js-15.1.7-black)](https://nextjs.org/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0-blue)](https://www.typescriptlang.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind-3.4.17-06B6D4)](https://tailwindcss.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791)](https://www.postgresql.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 🚀 Overview

This platform transforms cold investor outreach from a manual, time-intensive process into an intelligent, automated system that achieves **10x higher response rates** through AI-powered personalization and strategic multi-platform coordination.

### Key Features

- **🧠 AI-Powered Personalization**: Generate contextual hooks using GPT/Claude integration
- **📊 Multi-Source Data Enrichment**: Aggregate investor data from LinkedIn, Twitter, and other sources  
- **🎯 Smart Platform Selection**: Algorithm-driven platform optimization for maximum engagement
- **📈 Campaign Analytics**: Real-time performance tracking and ROI optimization
- **🔄 Automated Sequences**: Multi-touch campaign management with intelligent follow-ups

---

## ⚡ Quick Start

### 1. Clone & Install
```bash
git clone https://github.com/sotirisspyrou-uk/ai-investor-outreach-automation.git
cd ai-investor-outreach-automation
npm install
```

### 2. Environment Setup
```bash
cp .env.example .env.local
```

Configure your environment variables:
```env
# Database
DATABASE_URL="postgresql://username:password@localhost:5432/investor_outreach"

# Authentication  
NEXTAUTH_SECRET="your-secure-secret-here"
NEXTAUTH_URL="http://localhost:3000"

# AI Services
OPENAI_API_KEY="sk-your-openai-key"
ANTHROPIC_API_KEY="sk-ant-your-claude-key"

# Feature Flags
MOCK_EXTERNAL_APIS="true"  # Enable for demo mode
```

### 3. Database Setup
```bash
npx prisma migrate dev --name init
npx prisma db seed
```

### 4. Start Development Server
```bash
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) to see the application.

---

## 📞 Contact

**Sotiris Spyrou**  
- **Email**: sotiris@verityai.co
- **LinkedIn**: [linkedin.com/in/sspyrou](https://www.linkedin.com/in/sspyrou/)
- **GitHub**: [github.com/sotirisspyrou-uk](https://github.com/sotirisspyrou-uk)

---

*Built with ❤️ for the startup ecosystem*
