-- Complete SQL setup for the 'events' table

-- 1. Create the events table
CREATE TABLE IF NOT EXISTS public.events (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    title TEXT NOT NULL,
    date DATE NOT NULL,
    time TEXT,
    category TEXT,
    speakers TEXT,
    description TEXT,
    image_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- 2. Enable Row Level Security (RLS)
ALTER TABLE public.events ENABLE ROW LEVEL SECURITY;

-- 3. Create policies
-- Allow public read access to everyone
CREATE POLICY "Public profiles are viewable by everyone." 
ON public.events FOR SELECT 
USING ( true );

-- For simplicity in the applet admin panel (assuming admin is handled at app level or auth level),
-- allow inserts/updates/deletes. You can restrict this later based on admin roles.
CREATE POLICY "Enable insert for all users" 
ON public.events FOR INSERT 
WITH CHECK ( true );

CREATE POLICY "Enable update for all users" 
ON public.events FOR UPDATE 
USING ( true );

CREATE POLICY "Enable delete for all users" 
ON public.events FOR DELETE 
USING ( true );

-- 4. Create an index on the date column for faster timeframe filtering
CREATE INDEX IF NOT EXISTS events_date_idx ON public.events (date);
