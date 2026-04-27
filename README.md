# Dany AI Knowledge Runner

A browser game that teaches FOUNDA knowledge base search mechanics. Built for Danone's DBS team.

## Quick Deploy

### 1. Supabase (Global Leaderboard)

1. Go to [supabase.com](https://supabase.com) and create a free account
2. Create a new project (any name, any region)
3. Go to **SQL Editor** and paste the contents of `supabase_schema.sql`, then click **Run**
4. Go to **Settings > API** and copy:
   - **Project URL** (e.g. `https://abcdefg.supabase.co`)
   - **anon public key** (starts with `eyJ...`)
5. Open `index.html` and replace the two placeholder values near the top:
   ```javascript
   const SUPABASE_URL  = 'https://your-project.supabase.co';
   const SUPABASE_KEY  = 'eyJ...your-anon-key...';
   ```

### 2. Vercel (Hosting)

Option A - CLI:
```bash
npm i -g vercel
cd dany-runner
vercel
```

Option B - Dashboard:
1. Go to [vercel.com](https://vercel.com) and sign in
2. Click **Add New > Project**
3. Import from Git or drag-drop this folder
4. Deploy (no build step needed, it's a static HTML file)

### 3. Done

Your game is live. Share the Vercel URL with the team.

## How It Works

- Single HTML file, no build step, no dependencies
- Canvas-based game engine at 60fps
- Supabase REST API called directly from the browser (no backend needed)
- The anon key is safe to expose (Row Level Security restricts to read + insert only)
- Works on desktop and mobile (landscape orientation)

## Game Mechanics

- 4-minute score-attack sessions
- Collect good FOUNDA knowledge articles to build answer confidence
- Avoid detractors: bad articles, knowledge gaps, retrieval issues, negative feedback
- Chain good articles for combo multipliers up to x3
- TextBuddy power-up converts bad articles into good ones
- Deliver answers through portals to earn bonus points
- Global leaderboard with 3-letter arcade names

## Tech Stack

- Vanilla JavaScript + HTML5 Canvas
- DanoneOne font (WOFF2, embedded)
- Supabase (PostgreSQL + REST API)
- Vercel (static hosting)
