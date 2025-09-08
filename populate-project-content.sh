#!/bin/bash
# populate-project-content.sh
# [Version 15-08-2025 15:00:00]
# Populates all project files with complete content for ai-investor-outreach-automation

set -e  # Exit on any error

PROJECT_NAME="ai-investor-outreach-automation"

# Check if we're in the project directory
if [[ ! -d "src" || ! -f "package.json" ]]; then
    echo "Error: Please run this script from inside the $PROJECT_NAME directory"
    echo "Current directory: $(pwd)"
    exit 1
fi

echo "📝 Populating project files with content..."

# ==========================================
# ROOT CONFIGURATION FILES
# ==========================================

echo "⚙️ Creating configuration files..."

# package.json
cat > package.json << 'EOF'
{
  "name": "ai-investor-outreach-automation",
  "version": "0.1.0",
  "private": true,
  "description": "AI-powered investor outreach automation platform for startup fundraising",
  "author": "Sotiris Spyrou <sotiris@verityai.co>",
  "license": "MIT",
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint",
    "type-check": "tsc --noEmit",
    "db:push": "prisma db push",
    "db:studio": "prisma studio",
    "db:seed": "tsx prisma/seed.ts",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:coverage": "jest --coverage"
  },
  "dependencies": {
    "next": "15.1.7",
    "react": "18.2.0",
    "react-dom": "18.2.0",
    "typescript": "5.0.0",
    "@prisma/client": "^5.0.0",
    "prisma": "^5.0.0",
    "next-auth": "^4.24.0",
    "bcryptjs": "^2.4.3",
    "zod": "^3.22.0",
    "react-hook-form": "@hookform/resolvers/zod",
    "@hookform/resolvers": "^3.3.0",
    "tailwindcss": "3.4.17",
    "class-variance-authority": "^0.7.0",
    "clsx": "^2.0.0",
    "tailwind-merge": "^2.0.0",
    "lucide-react": "^0.263.1",
    "recharts": "^2.8.0",
    "date-fns": "^2.30.0",
    "csv-parse": "^5.5.0",
    "papaparse": "^5.4.1",
    "@types/papaparse": "^5.3.14"
  },
  "devDependencies": {
    "@types/node": "20.0.0",
    "@types/react": "18.2.0",
    "@types/react-dom": "18.2.0",
    "@types/bcryptjs": "^2.4.6",
    "eslint": "8.0.0",
    "eslint-config-next": "15.1.7",
    "prettier": "^3.0.0",
    "jest": "^29.7.0",
    "@testing-library/react": "^14.0.0",
    "@testing-library/jest-dom": "^6.1.0",
    "tsx": "^4.0.0",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.31"
  }
}
EOF

# next.config.js
cat > next.config.js << 'EOF'
/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    serverComponentsExternalPackages: ['@prisma/client']
  },
  images: {
    domains: ['images.unsplash.com', 'avatars.githubusercontent.com']
  },
  env: {
    CUSTOM_KEY: process.env.CUSTOM_KEY,
  }
}

module.exports = nextConfig
EOF

# tailwind.config.js
cat > tailwind.config.js << 'EOF'
/** @type {import('tailwindcss').Config} */
module.exports = {
  darkMode: ["class"],
  content: [
    './pages/**/*.{ts,tsx}',
    './components/**/*.{ts,tsx}',
    './app/**/*.{ts,tsx}',
    './src/**/*.{ts,tsx}',
  ],
  theme: {
    container: {
      center: true,
      padding: "2rem",
      screens: {
        "2xl": "1400px",
      },
    },
    extend: {
      colors: {
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        secondary: {
          DEFAULT: "hsl(var(--secondary))",
          foreground: "hsl(var(--secondary-foreground))",
        },
        destructive: {
          DEFAULT: "hsl(var(--destructive))",
          foreground: "hsl(var(--destructive-foreground))",
        },
        muted: {
          DEFAULT: "hsl(var(--muted))",
          foreground: "hsl(var(--muted-foreground))",
        },
        accent: {
          DEFAULT: "hsl(var(--accent))",
          foreground: "hsl(var(--accent-foreground))",
        },
        popover: {
          DEFAULT: "hsl(var(--popover))",
          foreground: "hsl(var(--popover-foreground))",
        },
        card: {
          DEFAULT: "hsl(var(--card))",
          foreground: "hsl(var(--card-foreground))",
        },
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      keyframes: {
        "accordion-down": {
          from: { height: 0 },
          to: { height: "var(--radix-accordion-content-height)" },
        },
        "accordion-up": {
          from: { height: "var(--radix-accordion-content-height)" },
          to: { height: 0 },
        },
      },
      animation: {
        "accordion-down": "accordion-down 0.2s ease-out",
        "accordion-up": "accordion-up 0.2s ease-out",
      },
    },
  },
  plugins: [],
}
EOF

# tsconfig.json
cat > tsconfig.json << 'EOF'
{
  "compilerOptions": {
    "target": "es5",
    "lib": ["dom", "dom.iterable", "es6"],
    "allowJs": true,
    "skipLibCheck": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "noEmit": true,
    "esModuleInterop": true,
    "module": "esnext",
    "moduleResolution": "bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "jsx": "preserve",
    "incremental": true,
    "plugins": [
      {
        "name": "next"
      }
    ],
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"],
      "@/components/*": ["./src/components/*"],
      "@/lib/*": ["./src/lib/*"],
      "@/types/*": ["./src/types/*"],
      "@/app/*": ["./src/app/*"]
    }
  },
  "include": ["next-env.d.ts", "**/*.ts", "**/*.tsx", ".next/types/**/*.ts"],
  "exclude": ["node_modules"]
}
EOF

# .env.example
cat > .env.example << 'EOF'
# Database
DATABASE_URL="postgresql://username:password@localhost:5432/investor_outreach"

# Next.js
NEXTAUTH_SECRET="your-secret-key-here"
NEXTAUTH_URL="http://localhost:3000"

# AI Services (choose one or both)
OPENAI_API_KEY="sk-your-openai-key"
ANTHROPIC_API_KEY="sk-ant-your-claude-key"

# External APIs (for real integrations)
LINKEDIN_API_KEY="your-linkedin-key"
TWITTER_API_KEY="your-twitter-key"

# Feature Flags
MOCK_EXTERNAL_APIS="true"
AI_RATE_LIMIT="100"
EOF

# .gitignore
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
.pnp
.pnp.js

# Production
/build
/.next/
/out/

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Environment variables
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

# npm
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Prisma
/prisma/migrations/
/prisma/*.db
/prisma/*.db-journal

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Testing
/coverage/
/.nyc_output

# Logs
logs
*.log

# TypeScript
*.tsbuildinfo
next-env.d.ts
EOF

# ==========================================
# DATABASE SCHEMA
# ==========================================

echo "🗄️ Creating database schema..."

# prisma/schema.prisma
cat > prisma/schema.prisma << 'EOF'
// prisma/schema.prisma
// [Version 15-08-2025 15:00:00]

generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

model User {
  id        String     @id @default(cuid())
  email     String     @unique
  name      String?
  image     String?
  password  String?
  campaigns Campaign[]
  createdAt DateTime   @default(now())
  updatedAt DateTime   @updatedAt

  @@map("users")
}

model Investor {
  id              String   @id @default(cuid())
  firstName       String
  lastName        String
  email           String?
  linkedinUrl     String?
  twitterHandle   String?
  company         String?
  title           String?
  investmentStage String[] // ['pre-seed', 'seed', 'series-a']
  sectors         String[] // ['fintech', 'healthtech', 'ai']
  geography       String?
  enrichmentData  Json?
  lastEnriched    DateTime?
  createdAt       DateTime @default(now())
  updatedAt       DateTime @updatedAt
  sequences       OutreachSequence[]

  @@index([company, investmentStage])
  @@index([sectors])
  @@map("investors")
}

model Campaign {
  id            String             @id @default(cuid())
  name          String
  description   String?
  status        CampaignStatus     @default(DRAFT)
  targetCount   Int                @default(0)
  sentCount     Int                @default(0)
  responseCount Int                @default(0)
  responseRate  Float              @default(0)
  userId        String
  user          User               @relation(fields: [userId], references: [id])
  sequences     OutreachSequence[]
  settings      Json? // Campaign configuration
  createdAt     DateTime           @default(now())
  updatedAt     DateTime           @updatedAt

  @@index([userId, status])
  @@map("campaigns")
}

model OutreachSequence {
  id              String         @id @default(cuid())
  campaignId      String
  investorId      String
  campaign        Campaign       @relation(fields: [campaignId], references: [id])
  investor        Investor       @relation(fields: [investorId], references: [id])
  status          SequenceStatus @default(PENDING)
  primaryPlatform Platform?
  hooksGenerated  Json? // Array of generated hooks
  selectedHook    String?
  currentStep     Int            @default(0)
  lastContactAt   DateTime?
  responseReceived Boolean       @default(false)
  meetingBooked   Boolean        @default(false)
  messages        Message[]
  createdAt       DateTime       @default(now())
  updatedAt       DateTime       @updatedAt

  @@index([campaignId, status])
  @@index([investorId])
  @@map("outreach_sequences")
}

model Message {
  id              String           @id @default(cuid())
  sequenceId      String
  sequence        OutreachSequence @relation(fields: [sequenceId], references: [id])
  platform        Platform
  messageType     MessageType
  subject         String?
  content         String
  scheduledFor    DateTime?
  sentAt          DateTime?
  deliveredAt     DateTime?
  openedAt        DateTime?
  respondedAt     DateTime?
  responseContent String?
  sentiment       String? // 'positive', 'neutral', 'negative'
  createdAt       DateTime         @default(now())
  updatedAt       DateTime         @updatedAt

  @@index([sequenceId, messageType])
  @@map("messages")
}

enum CampaignStatus {
  DRAFT
  ACTIVE
  PAUSED
  COMPLETED
  ARCHIVED
}

enum SequenceStatus {
  PENDING
  ACTIVE
  RESPONDED
  COMPLETED
  FAILED
}

enum Platform {
  LINKEDIN
  TWITTER
  EMAIL
}

enum MessageType {
  INITIAL
  FOLLOW_UP
  FINAL
}
EOF

# prisma/seed.ts
cat > prisma/seed.ts << 'EOF'
// prisma/seed.ts
// [Version 15-08-2025 15:00:00]

import { PrismaClient, Platform, CampaignStatus, SequenceStatus } from '@prisma/client'
import bcrypt from 'bcryptjs'

const prisma = new PrismaClient()

async function main() {
  console.log('🌱 Starting seed data...')

  // Create demo user
  const hashedPassword = await bcrypt.hash('demo123', 12)
  const user = await prisma.user.create({
    data: {
      email: 'demo@example.com',
      name: 'Demo User',
      password: hashedPassword,
    },
  })

  console.log('👤 Created demo user')

  // Create demo investors
  const investors = await Promise.all([
    prisma.investor.create({
      data: {
        firstName: 'Sarah',
        lastName: 'Chen',
        email: 'sarah.chen@techcapital.com',
        company: 'Tech Capital',
        title: 'Partner',
        investmentStage: ['seed', 'series-a'],
        sectors: ['fintech', 'ai'],
        geography: 'US',
        linkedinUrl: 'https://linkedin.com/in/sarahchen',
        enrichmentData: {
          recentPosts: ['Excited about AI in fintech', 'Looking for seed stage opportunities'],
          investmentThesis: 'Focus on B2B SaaS with strong unit economics'
        }
      }
    }),
    prisma.investor.create({
      data: {
        firstName: 'Marcus',
        lastName: 'Johnson',
        email: 'marcus@futurefund.vc',
        company: 'Future Fund',
        title: 'Principal',
        investmentStage: ['pre-seed', 'seed'],
        sectors: ['healthtech', 'ai'],
        geography: 'UK',
        linkedinUrl: 'https://linkedin.com/in/marcusjohnson',
        enrichmentData: {
          recentPosts: ['Healthcare innovation is key', 'Pre-seed opportunities welcome'],
          investmentThesis: 'Early stage healthcare and AI solutions'
        }
      }
    }),
    prisma.investor.create({
      data: {
        firstName: 'Emily',
        lastName: 'Rodriguez',
        email: 'emily@nextgenvc.com',
        company: 'NextGen VC',
        title: 'Managing Director',
        investmentStage: ['series-a', 'series-b'],
        sectors: ['fintech', 'blockchain'],
        geography: 'EU',
        linkedinUrl: 'https://linkedin.com/in/emilyrodriguez',
        enrichmentData: {
          recentPosts: ['Blockchain adoption accelerating', 'Series A opportunities in Europe'],
          investmentThesis: 'Growth stage fintech with proven traction'
        }
      }
    })
  ])

  console.log('💼 Created demo investors')

  // Create demo campaign
  const campaign = await prisma.campaign.create({
    data: {
      name: 'Q4 Fundraising Campaign',
      description: 'Targeting Series A investors for fintech startup',
      status: CampaignStatus.ACTIVE,
      targetCount: 3,
      sentCount: 2,
      responseCount: 1,
      responseRate: 50.0,
      userId: user.id,
      settings: {
        maxTouches: 5,
        delayBetweenTouches: 3,
        platforms: ['linkedin', 'email']
      }
    }
  })

  console.log('📊 Created demo campaign')

  // Create demo sequences
  await Promise.all(investors.map(async (investor, index) => {
    const sequence = await prisma.outreachSequence.create({
      data: {
        campaignId: campaign.id,
        investorId: investor.id,
        status: index === 0 ? SequenceStatus.RESPONDED : SequenceStatus.ACTIVE,
        primaryPlatform: Platform.LINKEDIN,
        selectedHook: `Hi ${investor.firstName}, noticed your recent post about ${investor.sectors[0]} opportunities. Our fintech startup aligns perfectly with your investment thesis.`,
        currentStep: index + 1,
        responseReceived: index === 0,
        hooksGenerated: [
          {
            content: `Hi ${investor.firstName}, saw your post about ${investor.sectors[0]} - would love to discuss our approach`,
            confidence: 0.85,
            platform: 'linkedin'
          },
          {
            content: `${investor.firstName}, your insights on ${investor.sectors[0]} really resonated with our mission`,
            confidence: 0.78,
            platform: 'email'
          }
        ]
      }
    })

    // Create demo messages
    await prisma.message.create({
      data: {
        sequenceId: sequence.id,
        platform: Platform.LINKEDIN,
        messageType: 'INITIAL',
        content: sequence.selectedHook!,
        sentAt: new Date(Date.now() - (index + 1) * 24 * 60 * 60 * 1000),
        deliveredAt: new Date(Date.now() - (index + 1) * 24 * 60 * 60 * 1000 + 1000 * 60),
        openedAt: index === 0 ? new Date(Date.now() - index * 24 * 60 * 60 * 1000 + 1000 * 60 * 30) : undefined,
        respondedAt: index === 0 ? new Date(Date.now() - index * 24 * 60 * 60 * 1000 + 1000 * 60 * 60 * 2) : undefined,
        responseContent: index === 0 ? 'Thanks for reaching out! Would love to learn more about your solution.' : undefined,
        sentiment: index === 0 ? 'positive' : undefined
      }
    })
  }))

  console.log('📨 Created demo sequences and messages')
  console.log('✅ Seed data complete!')
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
EOF

# ==========================================
# CORE LIB FILES
# ==========================================

echo "📚 Creating core library files..."

# src/lib/db.ts
cat > src/lib/db.ts << 'EOF'
// src/lib/db.ts
// [Version 15-08-2025 15:00:00]

import { PrismaClient } from '@prisma/client'

const globalForPrisma = globalThis as unknown as {
  prisma: PrismaClient | undefined
}

export const db =
  globalForPrisma.prisma ??
  new PrismaClient({
    log: ['query'],
  })

if (process.env.NODE_ENV !== 'production') globalForPrisma.prisma = db
EOF

# src/lib/utils.ts
cat > src/lib/utils.ts << 'EOF'
// src/lib/utils.ts
// [Version 15-08-2025 15:00:00]

import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export function formatDate(date: Date | string) {
  return new Intl.DateTimeFormat("en-US", {
    month: "short",
    day: "numeric",
    year: "numeric",
  }).format(new Date(date))
}

export function formatCurrency(amount: number) {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency: "USD",
  }).format(amount)
}

export function calculateResponseRate(responses: number, sent: number): number {
  if (sent === 0) return 0
  return Math.round((responses / sent) * 100 * 100) / 100
}

export function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms))
}

export function generateId(): string {
  return Math.random().toString(36).substr(2, 9)
}
EOF

# ==========================================
# APP STRUCTURE
# ==========================================

echo "📱 Creating app structure..."

# src/app/layout.tsx
cat > src/app/layout.tsx << 'EOF'
// src/app/layout.tsx
// [Version 15-08-2025 15:00:00]

import './globals.css'
import { Inter } from 'next/font/google'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'AI Investor Outreach Automation',
  description: 'Intelligent platform for startup fundraising outreach automation',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <div className="min-h-screen bg-background font-sans antialiased">
          {children}
        </div>
      </body>
    </html>
  )
}
EOF

# src/app/globals.css
cat > src/app/globals.css << 'EOF'
/* src/app/globals.css */
/* [Version 15-08-2025 15:00:00] */

@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --card: 0 0% 100%;
    --card-foreground: 222.2 84% 4.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 222.2 84% 4.9%;
    --primary: 221.2 83.2% 53.3%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96%;
    --secondary-foreground: 222.2 84% 4.9%;
    --muted: 210 40% 96%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96%;
    --accent-foreground: 222.2 84% 4.9%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 221.2 83.2% 53.3%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    --card: 222.2 84% 4.9%;
    --card-foreground: 210 40% 98%;
    --popover: 222.2 84% 4.9%;
    --popover-foreground: 210 40% 98%;
    --primary: 217.2 91.2% 59.8%;
    --primary-foreground: 222.2 84% 4.9%;
    --secondary: 217.2 32.6% 17.5%;
    --secondary-foreground: 210 40% 98%;
    --muted: 217.2 32.6% 17.5%;
    --muted-foreground: 215 20.2% 65.1%;
    --accent: 217.2 32.6% 17.5%;
    --accent-foreground: 210 40% 98%;
    --destructive: 0 62.8% 30.6%;
    --destructive-foreground: 210 40% 98%;
    --border: 217.2 32.6% 17.5%;
    --input: 217.2 32.6% 17.5%;
    --ring: 224.3 76.3% 94.1%;
  }
}

@layer base {
  * {
    @apply border-border;
  }
  body {
    @apply bg-background text-foreground;
  }
}

@layer components {
  .animate-fade-in {
    animation: fadeIn 0.5s ease-in-out;
  }

  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }
}
EOF

# src/app/page.tsx
cat > src/app/page.tsx << 'EOF'
// src/app/page.tsx
// [Version 15-08-2025 15:00:00]

import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Brain, Users, TrendingUp, Zap } from 'lucide-react'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      {/* Header */}
      <header className="border-b bg-white/50 backdrop-blur-sm">
        <div className="container mx-auto px-4 py-4 flex justify-between items-center">
          <div className="flex items-center space-x-2">
            <Brain className="h-8 w-8 text-blue-600" />
            <h1 className="text-2xl font-bold text-gray-900">AI Investor Outreach</h1>
          </div>
          <Link href="/dashboard">
            <Button>Get Started</Button>
          </Link>
        </div>
      </header>

      {/* Hero Section */}
      <section className="container mx-auto px-4 py-16 text-center">
        <h2 className="text-5xl font-bold text-gray-900 mb-6">
          Transform Your Fundraising
          <span className="text-blue-600 block">with AI-Powered Outreach</span>
        </h2>
        <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
          Automate investor outreach with personalized AI-generated messages that achieve 
          10x higher response rates than traditional cold outreach methods.
        </p>
        <div className="flex gap-4 justify-center">
          <Link href="/dashboard">
            <Button size="lg" className="px-8">
              Start Free Demo
            </Button>
          </Link>
          <Button variant="outline" size="lg" className="px-8">
            View GitHub
          </Button>
        </div>
      </section>

      {/* Features */}
      <section className="container mx-auto px-4 py-16">
        <h3 className="text-3xl font-bold text-center text-gray-900 mb-12">
          Why Choose AI Investor Outreach?
        </h3>
        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
          <Card className="text-center">
            <CardHeader>
              <Brain className="h-12 w-12 text-blue-600 mx-auto mb-4" />
              <CardTitle>AI-Powered Personalization</CardTitle>
            </CardHeader>
            <CardContent>
              <CardDescription>
                Generate contextual hooks using advanced AI that references specific investor activity and interests.
              </CardDescription>
            </CardContent>
          </Card>

          <Card className="text-center">
            <CardHeader>
              <Users className="h-12 w-12 text-green-600 mx-auto mb-4" />
              <CardTitle>Multi-Source Enrichment</CardTitle>
            </CardHeader>
            <CardContent>
              <CardDescription>
                Aggregate investor data from LinkedIn, Twitter, podcasts, and other sources for comprehensive profiles.
              </CardDescription>
            </CardContent>
          </Card>

          <Card className="text-center">
            <CardHeader>
              <TrendingUp className="h-12 w-12 text-purple-600 mx-auto mb-4" />
              <CardTitle>Performance Analytics</CardTitle>
            </CardHeader>
            <CardContent>
              <CardDescription>
                Track response rates, meeting bookings, and campaign performance with detailed analytics dashboards.
              </CardDescription>
            </CardContent>
          </Card>

          <Card className="text-center">
            <CardHeader>
              <Zap className="h-12 w-12 text-orange-600 mx-auto mb-4" />
              <CardTitle>Automated Sequences</CardTitle>
            </CardHeader>
            <CardContent>
              <CardDescription>
                Execute multi-touch campaigns across LinkedIn, Twitter, and email with intelligent timing and follow-ups.
              </CardDescription>
            </CardContent>
          </Card>
        </div>
      </section>

      {/* Stats */}
      <section className="bg-white py-16">
        <div className="container mx-auto px-4 text-center">
          <h3 className="text-3xl font-bold text-gray-900 mb-12">
            Proven Results
          </h3>
          <div className="grid md:grid-cols-3 gap-8">
            <div>
              <div className="text-4xl font-bold text-blue-600 mb-2">10x</div>
              <div className="text-gray-600">Higher Response Rates</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-green-600 mb-2">80%</div>
              <div className="text-gray-600">Time Saved</div>
            </div>
            <div>
              <div className="text-4xl font-bold text-purple-600 mb-2">25%</div>
              <div className="text-gray-600">Meeting Booking Rate</div>
            </div>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-8">
        <div className="container mx-auto px-4 text-center">
          <p className="mb-4">Built with Next.js, TypeScript, and AI</p>
          <p className="text-gray-400">
            Portfolio project demonstrating modern AI integration and full-stack development
          </p>
        </div>
      </footer>
    </div>
  )
}
EOF

echo "✅ Content population completed successfully!"
echo ""
echo "📊 Summary of created files:"
echo "- ⚙️  Configuration: package.json, next.config.js, tailwind.config.js, tsconfig.json"
echo "- 🗄️  Database: Prisma schema with seed data"
echo "- 📱 App structure: Layout, homepage, and global styles"
echo "- 📚 Core utilities: Database connection, utils, and helper functions"
echo ""
echo "🎯 Next steps:"
echo "1. Run 'npm install' to install dependencies"
echo "2. Set up your database and environment variables"
echo "3. Run 'npx prisma db push' to create database schema"
echo "4. Run 'npm run dev' to start development server"
echo ""
echo "🚀 Your AI Investor Outreach Automation project is ready!"
EOF

echo "✅ Project content script created successfully!"
echo ""
echo "📝 Usage Instructions:"
echo "1. First run the skeleton script to create the directory structure"
echo "2. Then run this content script from inside the project directory"
echo ""
echo "📋 Commands to execute:"
echo "chmod +x create-project-skeleton.sh"
echo "./create-project-skeleton.sh"
echo "cd ai-investor-outreach-automation"
echo "chmod +x ../populate-project-content.sh"
echo "../populate-project-content.sh"
