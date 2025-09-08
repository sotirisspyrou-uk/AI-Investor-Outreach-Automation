// src/lib/utils.ts
// [Version 15-08-2025 15:15:00]

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

export function calculateResponseRate(responses: number, sent: number): number {
  if (sent === 0) return 0
  return Math.round((responses / sent) * 100 * 100) / 100
}

export function generateId(): string {
  return Math.random().toString(36).substr(2, 9)
}
