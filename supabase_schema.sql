-- Dany AI Knowledge Runner - Supabase Leaderboard Schema
-- Run this in the Supabase SQL Editor (Dashboard > SQL Editor > New Query)

-- 1. Create the scores table
CREATE TABLE scores (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(3) NOT NULL,
  country VARCHAR(2) NOT NULL,
  score INTEGER NOT NULL DEFAULT 0,
  questions INTEGER NOT NULL DEFAULT 0,
  avg_quality INTEGER NOT NULL DEFAULT 0,
  max_combo INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 2. Create an index for fast leaderboard queries
CREATE INDEX idx_scores_ranking ON scores (score DESC, created_at ASC);

-- 3. Enable Row Level Security
ALTER TABLE scores ENABLE ROW LEVEL SECURITY;

-- 4. Allow anyone to read scores (public leaderboard)
CREATE POLICY "Public read access"
  ON scores FOR SELECT
  USING (true);

-- 5. Allow anyone to insert scores (anonymous play)
CREATE POLICY "Public insert access"
  ON scores FOR INSERT
  WITH CHECK (true);

-- 6. No one can update or delete scores (immutable leaderboard)
-- (No policies = no access for UPDATE/DELETE)
