-- Populating the Cities table
INSERT INTO Cities (city_id, city_name, state_name, country_name) VALUES
(1, 'Ann Arbor', 'Michigan', 'USA'),
(2, 'Detroit', 'Michigan', 'USA'),
(3, 'Chicago', 'Illinois', 'USA'),
(4, 'New York', 'New York', 'USA'),
(5, 'Los Angeles', 'California', 'USA');

-- Populating the Users table
INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender) VALUES
(1, 'Alice', 'Smith', 1990, 5, 15, 'Female'),
(2, 'Bob', 'Johnson', 1989, 8, 22, 'Male'),
(3, 'Charlie', 'Williams', 1991, 12, 2, 'Non-binary'),
(4, 'David', 'Brown', 1988, 7, 10, 'Male'),
(5, 'Eva', 'Jones', 1992, 11, 25, 'Female'),
(6, 'Frank', 'Miller', 1985, 2, 18, 'Male'),
(7, 'Grace', 'Davis', 1993, 3, 30, 'Female'),
(8, 'Henry', 'Garcia', 1987, 6, 5, 'Male'),
(9, 'Isabel', 'Rodriguez', 1994, 9, 12, 'Female'),
(10, 'Jack', 'Wilson', 1995, 1, 20, 'Male');

-- Populating User_Current_Cities table
INSERT INTO User_Current_Cities (user_id, current_city_id) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 2),
(5, 1),
(6, 5),
(7, 3),
(8, 2),
(9, 4),
(10, 5);

-- Populating User_Hometown_Cities table
INSERT INTO User_Hometown_Cities (user_id, hometown_city_id) VALUES
(1, 2),
(2, 1),
(3, 3),
(4, 5),
(5, 4),
(6, 2),
(7, 1),
(8, 3),
(9, 5),
(10, 1);

-- Populating the Friends table
INSERT INTO Friends (user1_id, user2_id) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 3),
(2, 5),
(3, 5),
(4, 5),
(6, 7),
(6, 8),
(7, 8),
(9, 10);

-- Populating the Programs table
INSERT INTO Programs (program_id, institution, concentration, degree) VALUES
(1, 'University of Michigan', 'Computer Science', 'Bachelors'),
(2, 'University of Michigan', 'Computer Science', 'Masters'),
(3, 'University of Illinois', 'Computer Science', 'Bachelors'),
(4, 'New York University', 'Business', 'MBA'),
(5, 'University of California', 'Engineering', 'PhD');

-- Populating the Education table
INSERT INTO Education (user_id, program_id, program_year) VALUES
(1, 1, 2012),
(2, 1, 2011),
(3, 2, 2014),
(4, 3, 2010),
(5, 1, 2013),
(6, 4, 2008),
(7, 1, 2015),
(8, 3, 2011),
(9, 5, 2016),
(10, 2, 2018);

-- Populating the Messages table
INSERT INTO Messages (message_id, sender_id, receiver_id, message_content, sent_time) VALUES
(1, 1, 2, 'Hey Bob, how are you?', TIMESTAMP '2023-01-01 10:00:00'),
(2, 2, 1, 'I am good, Alice! Thanks for asking.', TIMESTAMP '2023-01-01 10:05:00'),
(3, 3, 5, 'Hi Eva, long time no see!', TIMESTAMP '2023-02-01 15:30:00'),
(4, 5, 3, 'Hi Charlie! Yes, it''s been a while.', TIMESTAMP '2023-02-01 15:35:00'),
(5, 4, 1, 'Alice, are you coming to the reunion?', TIMESTAMP '2023-03-01 20:00:00'),
(6, 1, 4, 'Yes, David! Looking forward to it.', TIMESTAMP '2023-03-01 20:05:00');

-- Populating the User_Events table
INSERT INTO User_Events (event_id, event_creator_id, event_name, event_tagline, event_description, event_host, event_type, event_subtype, event_address, event_city_id, event_start_time, event_end_time) VALUES
(1, 1, 'Class Reunion', 'Back together again', 'Annual class reunion', 'Alumni Association', 'Social', 'Reunion', '123 Main St', 1, TIMESTAMP '2023-06-01 18:00:00', TIMESTAMP '2023-06-01 22:00:00'),
(2, 3, 'Tech Conference', 'Innovate and Inspire', 'Annual tech conference', 'Tech Org', 'Professional', 'Conference', '456 Technology Dr', 4, TIMESTAMP '2023-07-15 09:00:00', TIMESTAMP '2023-07-15 17:00:00');

-- Populating the Participants table
INSERT INTO Participants (event_id, user_id, confirmation) VALUES
(1, 1, 'Attending'),
(1, 2, 'Attending'),
(1, 4, 'Attending'),
(2, 3, 'Attending'),
(2, 5, 'Unsure'),
(2, 7, 'Not_Replied');

-- Populating the Albums table with NULL cover_photo_id temporarily
INSERT INTO Albums (album_id, album_owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility, cover_photo_id) VALUES
(1, 1, 'Alice Album', TIMESTAMP '2023-04-01 10:00:00', NULL, 'http://example.com/albums/1', 'Friends', NULL),
(2, 2, 'Bob Album', TIMESTAMP '2023-04-02 11:00:00', NULL, 'http://example.com/albums/2', 'Friends', NULL),
(3, 3, 'Charlie Album', TIMESTAMP '2023-04-03 12:00:00', NULL, 'http://example.com/albums/3', 'Friends', NULL);

-- Populating the Photos table
INSERT INTO Photos (photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link) VALUES
(1, 1, 'Alice''s first photo', TIMESTAMP '2023-04-01 10:05:00', NULL, 'http://example.com/photos/1'),
(2, 1, 'Alice''s second photo', TIMESTAMP '2023-04-01 10:10:00', NULL, 'http://example.com/photos/2'),
(3, 2, 'Bob''s photo', TIMESTAMP '2023-04-02 11:05:00', NULL, 'http://example.com/photos/3'),
(4, 3, 'Charlie''s photo', TIMESTAMP '2023-04-03 12:05:00', NULL, 'http://example.com/photos/4');

-- Updating Albums to set the cover_photo_id
UPDATE Albums SET cover_photo_id = 1 WHERE album_id = 1;
UPDATE Albums SET cover_photo_id = 3 WHERE album_id = 2;
UPDATE Albums SET cover_photo_id = 4 WHERE album_id = 3;

-- Populating the Tags table
INSERT INTO Tags (tag_photo_id, tag_subject_id, tag_created_time, tag_x, tag_y) VALUES
(1, 1, TIMESTAMP '2023-04-01 10:06:00', 0.5, 0.5),
(3, 2, TIMESTAMP '2023-04-02 11:06:00', 0.4, 0.6),
(4, 3, TIMESTAMP '2023-04-03 12:06:00', 0.3, 0.7);
