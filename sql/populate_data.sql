-- Run this SQL in Supabase to populate your college data
-- 1. General College Info (Principal & Contact)
DELETE FROM college_info WHERE key IN ('principal', 'principal_mobile', 'principal_email', 'college_address', 'college_phone', 'college_email', 'nodal_officer');
INSERT INTO college_info (key, value) VALUES 
('principal', 'Prof. (Dr.) Manju Sharma (Professor - Hindi)'),
('principal_mobile', '+91-9414665955'),
('principal_email', 'manjudinesh.8@gmail.com'),
('college_address', 'Opposite Railway Station, Station Road, Churu, Rajasthan – 331001'),
('college_phone', '01562-250362'),
('college_email', 'lohiacollegechuru@gmail.com'),
('nodal_officer', 'Dr. Mohd. Javed Khan (Assistant Professor) - 9785159841');

-- 2. Basic Sections (Founder, Vision, Mission, History, Library)
DELETE FROM college_sections WHERE key IN ('founder', 'vision', 'mission', 'history', 'library', 'hostel');
INSERT INTO college_sections (key, title, content) VALUES 
('founder', 'Founder: Seth Kanhiya Lal Lohia (1884-1957)', 'Seth Kanhiya Lal Lohia was an eminent entrepreneur doing a brisk jute business in Calcutta. He dreamed of building a college in his home town for a holy cause during the pre-independence era. He is a visionary who brought this desert town on the educational map. Churu came to be known by Lohia College because of its excellent infrastructure and standards. This uneducated businessman had incredible foresight, providing higher education opportunities when facilities were far away.'),
('vision', 'College Vision', 'To become a center of academic excellence by providing quality education, practical training, and research opportunities that shape responsible and capable citizens for the future.'),
('mission', 'College Mission', '1. To provide inspired learning and construct value based education system.\n2. To ensure exposure to diverse disciplines.\n3. To encourage merit and enhance employability skills.\n4. To instil a culture of hands-on learning and research.\n5. To impart quality education at an affordable price.\n6. To make available quality education to disadvantageous, marginalized and differently able students.\n7. To lay stress on holistic development of the students’ personality by ensuring their participation in co-curricular and extra-curricular activities.\n8. To inculcate scientific temperament and make them technology-savvy and eco-friendly.'),
('history', 'College History Summary', 'Established in 1945 at intermediate level with 47 students. Shifted to the present location in 1949 and upgraded to graduation level in Commerce. Seth K.L. Lohia built the original huge building, and more additions have been made over time. It was declared a Model College by the Govt of Rajasthan in 2006.'),
('library', 'College Library & Reading Room', 'The library is rich with over 100,184 books. It includes a UGC section (28,932 books), SC/ST section (4,463 books), General section (62,161 books), and RUSA section (4,628 books). It subscribes to 43 journals and magazines, and several newspapers (Dainik Bhaskar, Rajasthan Patrika, etc.). Students have free access to open shelves.'),
('hostel', 'Hostel Facility', 'The hostel is situated on the college campus itself, just a stone''s throw from the main college building. It is among the largest in Rajasthan with 128 rooms, one auditorium, and playgrounds. Seth Kanhaiya Lal Lohia built such a big hostel at a time when there was absolutely no need of such a big size, showing his great vision. The fee structure is very reasonable and even poor students can afford it.');

-- 3. Milestones (Timeline)
DELETE FROM college_milestones;
INSERT INTO college_milestones (year, event_description, order_index) VALUES 
('1945', 'Established as Intermediate College', 1),
('1949', 'Upgraded as Degree College with Faculty of Commerce', 2),
('1954', 'Faculty of Arts started (English, Hindi, History, Pol Science)', 3),
('1955', 'Faculty of Science started (Zoology, Botany, Chemistry, Physics, Maths)', 4),
('1957', 'Economics added to Faculty of Arts', 5),
('1970', 'Recognized by UGC (2f and 12B)', 6),
('1972', 'Upgraded to Post Graduate level in Commerce', 7),
('1974', 'Post Graduation in Chemistry started', 8),
('1977', 'Post Graduation in History and Political Science', 9),
('1980', 'Post Graduation in Botany', 10),
('1982', 'PG in Zoology and UG in Urdu started', 11),
('1993', 'First Govt college in Rajasthan to start UGC Vocational Communicative English', 12),
('1999', 'PG in Geography introduced', 13),
('2004', 'Accredited as B+ by UGC', 14),
('2006', 'Declared a Model College by Govt of Rajasthan', 15),
('2010', 'PG in Urdu introduced', 16),
('2013', 'NAAC awarded "B" certificate; Online Admission started', 17),
('2016', 'PG in Maths, Physics, Sanskrit started; UG in Public Admin', 18),
('2018', 'PG in Hindi started', 19);

-- 5. Detailed Course & Subject List (UG & PG)
DELETE FROM courses;
INSERT INTO courses (name, stream, total_seats, subjects) VALUES 
('B.A. Semester-I', 'Arts', 1600, ARRAY['History', 'Political Science', 'Sociology', 'Public Administration', 'Economics', 'Geography', 'Psychology', 'Philosophy', 'Home Science', 'Hindi Literature', 'English Literature', 'Sanskrit', 'Urdu', 'Punjabi', 'Rajasthani', 'Music', 'Drawing & Painting']),
('B.Sc. Bio. Semester-I', 'Science', 264, ARRAY['Botany', 'Zoology', 'Chemistry', 'Computer Application']),
('B.Sc. Math. Semester-I', 'Science', 264, ARRAY['Mathematics', 'Physics', 'Chemistry', 'Computer Application']),
('B.Com. Semester-I', 'Commerce', 600, ARRAY['A.B.S.T.', 'Economic Administration & Financial Management', 'Business Administration', 'Computer Application']),
('M.A. Previous/Final', 'Arts', 400, ARRAY['History', 'Geography', 'Political Science', 'Hindi', 'English', 'Sanskrit', 'Urdu']),
('M.Sc. Previous/Final', 'Science', 200, ARRAY['Botany', 'Chemistry', 'Physics', 'Mathematics', 'Zoology']),
('M.Com. Previous/Final', 'Commerce', 180, ARRAY['A.B.S.T.', 'E.A.F.M.', 'Business Management']);
