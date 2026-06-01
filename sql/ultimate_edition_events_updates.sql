-- SQL updates for Advanced Event Management

DO $$ 
BEGIN
  -- Add time column if it doesn't exist
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='events' AND column_name='time') THEN
    ALTER TABLE events ADD COLUMN time TEXT;
  END IF;
  
  -- Add category column if it doesn't exist
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='events' AND column_name='category') THEN
    ALTER TABLE events ADD COLUMN category TEXT;
  END IF;

  -- Add speakers column if it doesn't exist
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='events' AND column_name='speakers') THEN
    ALTER TABLE events ADD COLUMN speakers TEXT;
  END IF;

  -- Add image_url column if it doesn't exist
  IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name='events' AND column_name='image_url') THEN
    ALTER TABLE events ADD COLUMN image_url TEXT;
  END IF;
END $$;
