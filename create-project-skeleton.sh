#!/bin/bash
# create-project-skeleton.sh
# [Version 15-08-2025 14:45:00]
# Creates the complete project structure for ai-investor-outreach-automation

set -e  # Exit on any error

PROJECT_NAME="ai-investor-outreach-automation"
CURRENT_DIR=$(pwd)

echo "🚀 Creating project structure for: $PROJECT_NAME"
echo "📁 Location: $CURRENT_DIR/$PROJECT_NAME"

# Create main project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "📋 Creating root configuration files..."
# Root files
touch README.md
touch PLAN.md
touch Claude.md
touch package.json
touch next.config.js
touch tailwind.config.js
touch tsconfig.json
touch .env.example
touch .gitignore
touch LICENSE

echo "🗄️ Creating database directory..."
# Prisma directory
mkdir -p prisma
touch prisma/schema.prisma
touch prisma/seed.ts

echo "📱 Creating app directory structure..."
# Next.js app directory structure
mkdir -p src/app
touch src/app/layout.tsx
touch src/app/page.tsx
touch src/app/globals.css

# API routes
mkdir -p src/app/api/investors/{[id]/{enrich,},import}
touch src/app/api/investors/route.ts
touch src/app/api/investors/[id]/route.ts
touch src/app/api/investors/[id]/enrich/route.ts
touch src/app/api/investors/import/route.ts

mkdir -p src/app/api/campaigns/[id]
touch src/app/api/campaigns/route.ts
touch src/app/api/campaigns/[id]/route.ts

mkdir -p src/app/api/ai/generate-hooks
touch src/app/api/ai/generate-hooks/route.ts

# Page routes
mkdir -p src/app/dashboard
touch src/app/dashboard/page.tsx

mkdir -p src/app/investors
touch src/app/investors/page.tsx

mkdir -p src/app/campaigns/{new}
touch src/app/campaigns/page.tsx
touch src/app/campaigns/new/page.tsx

mkdir -p src/app/analytics
touch src/app/analytics/page.tsx

echo "🧩 Creating components directory..."
# Components
mkdir -p src/components/ui
touch src/components/ui/button.tsx
touch src/components/ui/card.tsx
touch src/components/ui/input.tsx
touch src/components/ui/table.tsx
touch src/components/ui/dialog.tsx

mkdir -p src/components/investors
touch src/components/investors/InvestorTable.tsx
touch src/components/investors/ImportDialog.tsx
touch src/components/investors/EnrichmentStatus.tsx

mkdir -p src/components/campaigns
touch src/components/campaigns/CampaignBuilder.tsx
touch src/components/campaigns/SequenceEditor.tsx

mkdir -p src/components/analytics
touch src/components/analytics/PerformanceDashboard.tsx
touch src/components/analytics/CampaignComparison.tsx

mkdir -p src/components/ai
touch src/components/ai/HookGenerator.tsx
touch src/components/ai/HookPreview.tsx

echo "📚 Creating lib directory..."
# Lib directory
mkdir -p src/lib/ai
touch src/lib/ai/HookGenerator.ts
touch src/lib/ai/PromptEngineering.ts
touch src/lib/ai/QualityScorer.ts

mkdir -p src/lib/enrichment
touch src/lib/enrichment/EnrichmentEngine.ts
touch src/lib/enrichment/LinkedInExtractor.ts
touch src/lib/enrichment/TwitterExtractor.ts

mkdir -p src/lib/campaigns
touch src/lib/campaigns/CampaignEngine.ts

mkdir -p src/lib/automation
touch src/lib/automation/OutreachSimulator.ts
touch src/lib/automation/PlatformSelector.ts

mkdir -p src/lib/analytics
touch src/lib/analytics/MetricsCalculator.ts

mkdir -p src/lib/validators
touch src/lib/validators/investor.ts
touch src/lib/validators/campaign.ts

# Core lib files
touch src/lib/db.ts
touch src/lib/auth.ts
touch src/lib/utils.ts

echo "🏷️ Creating types directory..."
# Types
mkdir -p src/types
touch src/types/index.ts
touch src/types/investor.ts
touch src/types/campaign.ts
touch src/types/ai.ts

echo "🧪 Creating tests directory..."
# Tests
mkdir -p tests/{components,api,lib}
touch tests/setup.ts
touch tests/components/InvestorTable.test.tsx
touch tests/api/investors.test.ts
touch tests/lib/HookGenerator.test.ts

echo "📄 Creating documentation directory..."
# Documentation
mkdir -p docs
touch docs/api.md
touch docs/deployment.md
touch docs/contributing.md

echo "🎨 Creating public directory..."
# Public assets
mkdir -p public/{images,icons}
touch public/favicon.ico
touch public/images/.gitkeep
touch public/icons/.gitkeep

echo "✅ Project skeleton created successfully!"
echo ""
echo "📊 Project structure:"
echo "📁 $PROJECT_NAME/"
echo "├── 📋 Documentation (README.md, PLAN.md, Claude.md)"
echo "├── ⚙️  Configuration files (package.json, next.config.js, etc.)"
echo "├── 🗄️  Database (prisma/)"
echo "├── 📱 App structure (src/app/)"
echo "├── 🧩 Components (src/components/)"
echo "├── 📚 Libraries (src/lib/)"
echo "├── 🏷️  Types (src/types/)"
echo "├── 🧪 Tests (tests/)"
echo "├── 📄 Docs (docs/)"
echo "└── 🎨 Public assets (public/)"
echo ""
echo "🎯 Next step: Run the content population script to fill all files with actual code."
echo ""
echo "📍 Current location: $(pwd)"
