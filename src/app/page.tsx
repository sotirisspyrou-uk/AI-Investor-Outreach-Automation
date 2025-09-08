// src/app/page.tsx
// [Version 15-08-2025 15:15:00]

import Link from 'next/link'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Brain, Users, TrendingUp, Zap } from 'lucide-react'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <header className="border-b bg-white/50 backdrop-blur-sm">
        <div className="container mx-auto px-4 py-4 flex justify-between items-center">
          <div className="flex items-center space-x-2">
            <Brain className="h-8 w-8 text-blue-600" />
            <h1 className="text-2xl font-bold text-gray-900">AI Investor Outreach</h1>
          </div>
          <Button>Get Started</Button>
        </div>
      </header>

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
          <Button size="lg" className="px-8">Start Free Demo</Button>
          <Button variant="outline" size="lg" className="px-8">View GitHub</Button>
        </div>
      </section>

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

      <section className="bg-white py-16">
        <div className="container mx-auto px-4 text-center">
          <h3 className="text-3xl font-bold text-gray-900 mb-12">Proven Results</h3>
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
