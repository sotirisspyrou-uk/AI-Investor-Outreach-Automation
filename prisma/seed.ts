// prisma/seed.ts
// [Version 15-08-2025 15:15:00]

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
