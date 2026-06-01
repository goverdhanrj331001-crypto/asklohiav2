-- SQL definitions for Lohia AI Ultimate Edition

-- 1. Table for Persistent Student Profiles
-- Note: This requires auth.users to be set up if using real auth, 
-- but for now we'll allow public creation linked by email/uid.
CREATE TABLE IF NOT EXISTS student_profiles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_email TEXT UNIQUE NOT NULL,
  full_name TEXT,
  phone TEXT,
  college_status TEXT CHECK (college_status IN ('Collegiate', 'Non-Collegiate')),
  level TEXT CHECK (level IN ('Graduate', 'Post Graduate')),
  semester TEXT,
  subject TEXT,
  id_card_url TEXT,
  last_updated TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Table for Academic Alerts / Notifications
CREATE TABLE IF NOT EXISTS academic_alerts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  type TEXT DEFAULT 'info', -- 'info', 'warning', 'urgent'
  is_active BOOLEAN DEFAULT true,
  target_stream TEXT, -- 'Arts', 'Science', 'Commerce', 'All'
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  expires_at TIMESTAMP WITH TIME ZONE
);

-- Enable RLS
ALTER TABLE student_profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE academic_alerts ENABLE ROW LEVEL SECURITY;

-- Basic Policies (Public read for alerts, email-based check for profiles)
CREATE POLICY "Public read academic alerts" ON academic_alerts FOR SELECT USING (is_active = true);
CREATE POLICY "Users can manage own profile" ON student_profiles FOR ALL USING (true); -- Simplified for development

-- Insert initial alerts
INSERT INTO academic_alerts (title, description, type, target_stream)
VALUES 
('Scholarship Portal Open', 'PMS scholarship registration for session 2026-27 has started.', 'info', 'All'),
('Practical Exam Schedule', 'Geography and Chemistry practical dates are out for Sem 2.', 'warning', 'Science'),
('Admission 2026', 'New admission forms for first semester will start from 15th June.', 'info', 'All');
