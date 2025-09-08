# Claude.md - Development Handover Guide

**Authored by:** Sotiris Spyrou  
**Email:** sotiris@verityai.co  
**LinkedIn:** https://www.linkedin.com/in/sspyrou/  
**Date:** August 15, 2025

## Project Overview
**AI Investor Outreach Automation** - Portfolio demonstration platform for AI-powered startup fundraising outreach.

### Core Functionality
- **Investor Data Enrichment**: Multi-source data collection
- **AI Hook Generation**: GPT/Claude integration for personalization  
- **Outreach Automation**: Cross-platform messaging simulation
- **Analytics Dashboard**: Performance tracking and optimization

### Technology Stack
- **Backend**: Node.js with Express.js
- **Frontend**: React with Next.js 15.1.7
- **Database**: PostgreSQL with Prisma ORM
- **AI Integration**: OpenAI GPT-4 or Anthropic Claude
- **Styling**: Tailwind CSS 3.4.17
- **Deployment**: Vercel

## Development Priorities

### Phase 1: Core Infrastructure (HIGH)
1. Next.js 15 project with TypeScript and Tailwind
2. PostgreSQL database with Prisma schema
3. Authentication system with NextAuth.js
4. API routes with validation and error handling

### Phase 2: Core Features (HIGH)
1. Investor management CRUD operations
2. Data enrichment simulation engine
3. AI hook generation with quality scoring
4. Campaign management interface

### Phase 3: Analytics & Polish (MEDIUM)
1. Performance analytics dashboard
2. Responsive design optimization
3. Testing and documentation
4. Production deployment

## Key Components

### Database Schema
- Users, Investors, Campaigns, OutreachSequences, Messages
- Proper indexing and relationships
- Seed data for development

### AI Integration
- OpenAI/Claude API integration
- Prompt engineering for hook generation
- Quality scoring and confidence metrics

### API Endpoints
- RESTful design with proper validation
- Rate limiting and security
- Error handling and logging

## Implementation Guidelines
- **TypeScript**: Strict mode, proper type definitions
- **Testing**: Jest + React Testing Library
- **Security**: API protection, data validation, environment management
- **Performance**: Database optimization, caching, pagination

## Deployment
- **Local**: npm install, prisma setup, npm run dev
- **Production**: Vercel deployment with environment variables

**Contact**: sotiris@verityai.co for technical questions.
