-- Run this in Supabase SQL Editor to add Hostel Facility Information
DELETE FROM college_sections WHERE key = 'hostel';

INSERT INTO college_sections (key, title, content) VALUES 
('hostel', 'Hostel Facility', 'The hostel is situated on the college campus itself, just a stone''s throw from the main college building. It is among the largest (perhaps the largest one) in Rajasthan with 128 rooms, one auditorium, and playgrounds. This is to say something about the farsightedness of that great visionary, Seth Kanhaiya Lal Lohia, that he built such a big hostel at a time when there was absolutely no need of such a big size. The fee structure is very reasonable and even poor students can afford it.');
