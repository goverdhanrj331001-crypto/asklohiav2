-- SQL for Sports Achievements and University Colour Holders
-- This table stores sports records of students

CREATE TABLE IF NOT EXISTS sports (
    id BIGSERIAL PRIMARY KEY,
    category TEXT NOT NULL, -- e.g. University Colour Holders, Sports Achievement
    year TEXT NOT NULL,
    student_name TEXT NOT NULL,
    sport TEXT,
    division TEXT,
    position_in_college TEXT,
    remarks TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE sports ENABLE ROW LEVEL SECURITY;

-- Allow public read access
DROP POLICY IF EXISTS "Public Read Sports" ON sports;
CREATE POLICY "Public Read Sports" ON sports FOR SELECT USING (true);

-- Allow authenticated users to perform all operations
DROP POLICY IF EXISTS "Authenticated All Sports" ON sports;
CREATE POLICY "Authenticated All Sports" ON sports FOR ALL TO authenticated USING (true);

-- Insert Data
INSERT INTO sports (category, year, student_name, sport, remarks) VALUES
('University Colour Holders', '1956', 'Shri Mahabir Prasad Sharma', 'Volley-Ball', NULL),
('University Colour Holders', '1957', 'Shri Lal Chand Sharma', 'Volley-Ball', NULL),
('University Colour Holders', '1959', 'Shri Manphool Singh Dhaka', 'Foot-Ball', NULL),
('University Colour Holders', '1960', 'Shri Mohan Lal Minni', 'Volley-Ball', NULL),
('University Colour Holders', '1960', 'Volley-Ball Team', 'Volley-Ball', 'Winners in the University of Raj. Central Tournaments'),
('University Colour Holders', '1961', 'Shri Barisal Singh', 'Kabaddi', NULL),
('University Colour Holders', '1962', 'Foot-Ball Team', 'Foot-Ball', 'Winners in the University Inter-College Tournament'),
('University Colour Holders', '1970', 'Shri Subash Chander Poonia', 'Volley-Ball', NULL),
('University Colour Holders', '1971', 'Shri Jain Arain', 'Volley-Ball', NULL),
('University Colour Holders', '1971', 'Shri Lal Chand Gehlot', 'Kabaddi', NULL),
('University Colour Holders', '1985', 'Shri Sudhir Sharma', 'Badminton', NULL),
('University Colour Holders', '1985', 'Shri Mohd. Aslam Khan', 'Tennis', NULL),
('University Colour Holders', '1985', 'Shri Satya Narayan', 'Table Tennis', NULL),
('University Colour Holders', '1985', 'Shri Ramesh K. Punia', 'Table Tennis', NULL),
('University Colour Holders', '1985', 'Shri Ram Prasad', 'Volley-Ball', NULL),
('University Colour Holders', '1985', 'Shri Ratan Singh', 'Athletics', NULL),
('University Colour Holders', '1985', 'Kabaddi Team', 'Kabaddi', 'Winners in the University Tournament'),
('University Colour Holders', '1986', 'Shri Ranvir Singh', 'Kabaddi', NULL),
('University Colour Holders', '1986', 'Shri Ram Prasad', 'Volley-Ball', NULL),
('University Colour Holders', '1986', 'Shri Ishwar Singh', 'Athletics', NULL),
('University Colour Holders', '1987', 'Shri Vijai Kumar', 'Volley-Ball', NULL),
('University Colour Holders', '1987', 'Shri Vidya Sagar', 'Kabaddi', NULL),
('University Colour Holders', '1987', 'Shri Rajendra Singh', 'Kabaddi', NULL),
('University Colour Holders', '1987', 'Shri Mahesh Kumar', 'Kabaddi', NULL),
('University Colour Holders', '1987', 'Shri Ishwar Singh', 'Athletics', NULL),
('University Colour Holders', '1989', 'Shri Sanjay Punia', 'Table Tennis', NULL),
('University Colour Holders', '1989', 'Shri Vijai Kumar', 'Volley-Ball', NULL),
('University Colour Holders', '1990', 'Shri Ratan Singh', 'Volley-Ball', NULL),
('University Colour Holders', '1990', 'Shri Sanjay Punia', 'Table Tennis', NULL),
('University Colour Holders', '1990', 'Shri Mahesh Kumar', 'Kabaddi', NULL),
('University Colour Holders', '1990', 'Shri Pawan Kumar', 'Kabaddi', NULL),
('University Colour Holders', '1991', 'Shri Raj Karan', 'Volley-Ball', NULL),
('University Colour Holders', '1991', 'Shri Om Prakash', 'Volley-Ball', NULL),
('University Colour Holders', '1991', 'Shri Ratan Singh', 'Volley-Ball', NULL),
('University Colour Holders', '1991', 'Shri Rakesh Singh', 'Hand-Ball', NULL),
('University Colour Holders', '1991', 'Shri Sanjay Punia', 'Table Tennis', NULL),
('University Colour Holders', '1991', 'Shri Raj Karan', 'Athletics', NULL),
('University Colour Holders', '1991', 'Shri Lal Chand', 'Kabaddi', NULL),
('University Colour Holders', '1991', 'Shri Shafi Mohammad', 'Kabaddi', NULL),
('University Colour Holders', '1992', 'Shri Sanjay Punia', 'Table Tennis', NULL),
('University Colour Holders', '1992', 'Shri Rajesh Verma', 'Table Tennis', NULL),
('University Colour Holders', '1992', 'Shri Pawan K. Verma', 'Chess', NULL),
('University Colour Holders', '1992', 'Shri Akhtar Rasool', 'Chess', NULL),
('University Colour Holders', '1993', 'Shri Jai P. Chotia', 'Badminton', NULL),
('University Colour Holders', '1993', 'Shri Surendra S. Soora', 'Table Tennis', NULL),
('University Colour Holders', '1993', 'Shri Sanjay Punia', 'Table Tennis', NULL);
