-- Load data into Users table
INSERT INTO Users (user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender)
SELECT DISTINCT user_id, first_name, last_name, year_of_birth, month_of_birth, day_of_birth, gender
FROM project1.Public_User_Information;

-- Load data into Cities table
INSERT INTO Cities (city_id, city_name, state_name, country_name)
WITH Unique_Cities AS (
    SELECT DISTINCT current_city AS city_name, current_state AS state_name, current_country AS country_name
    FROM project1.Public_User_Information
    UNION
    SELECT DISTINCT hometown_city AS city_name, hometown_state AS state_name, hometown_country AS country_name
    FROM project1.Public_User_Information
    UNION
    SELECT DISTINCT event_city AS city_name, event_state AS state_name, event_country AS country_name
    FROM project1.Public_Event_Information
)
SELECT ROW_NUMBER() OVER (ORDER BY city_name, state_name, country_name) AS city_id,
       city_name, state_name, country_name
FROM Unique_Cities;


-- Load data into User_Current_Cities table
INSERT INTO User_Current_Cities (user_id, current_city_id)
SELECT DISTINCT u.user_id,
    (SELECT c.city_id FROM Cities c
     WHERE c.city_name = u.current_city AND c.state_name = u.current_state AND c.country_name = u.current_country)
FROM project1.Public_User_Information u;

INSERT INTO User_Hometown_Cities (user_id, hometown_city_id)
SELECT DISTINCT u.user_id,
    (SELECT c.city_id FROM Cities c
     WHERE c.city_name = u.hometown_city AND c.state_name = u.hometown_state AND c.country_name = u.hometown_country)
FROM project1.Public_User_Information u;

-- Load data into Programs table
INSERT INTO Programs (program_id, institution, concentration, degree)
WITH Unique_Programs AS (
    SELECT DISTINCT institution_name AS institution, program_concentration AS concentration, program_degree AS degree
    FROM project1.Public_User_Information
    WHERE institution_name IS NOT NULL
)
SELECT ROW_NUMBER() OVER (ORDER BY institution, concentration, degree) AS program_id,
       institution, concentration, degree
FROM Unique_Programs;

-- Load data into Education table
INSERT INTO Education (user_id, program_id, program_year)
SELECT u.user_id,
       (SELECT p.program_id FROM Programs p
        WHERE p.institution = u.institution_name AND p.concentration = u.program_concentration AND p.degree = u.program_degree),
       u.program_year
FROM project1.Public_User_Information u
WHERE u.institution_name IS NOT NULL;

-- Load data into Friends table
INSERT INTO Friends (user1_id, user2_id)
SELECT DISTINCT LEAST(user1_id, user2_id) AS user1_id,
                GREATEST(user1_id, user2_id) AS user2_id
FROM project1.Public_Are_Friends;

-- Load data into Albums table (without cover_photo_id)
INSERT INTO Albums (album_id, album_owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility)
SELECT DISTINCT album_id, owner_id AS album_owner_id, album_name, album_created_time, album_modified_time, album_link, album_visibility
FROM project1.Public_Photo_Information;

-- Load data into Photos table
INSERT INTO Photos (photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link)
SELECT DISTINCT photo_id, album_id, photo_caption, photo_created_time, photo_modified_time, photo_link
FROM project1.Public_Photo_Information;

-- Update Albums table to set cover_photo_id
MERGE INTO Albums a
USING (
    SELECT DISTINCT album_id, cover_photo_id
    FROM project1.Public_Photo_Information
) p
ON (a.album_id = p.album_id)
WHEN MATCHED THEN
UPDATE SET a.cover_photo_id = p.cover_photo_id;

-- Load data into Tags table
INSERT INTO Tags (tag_photo_id, tag_subject_id, tag_created_time, tag_x, tag_y)
SELECT DISTINCT photo_id AS tag_photo_id, tag_subject_id, tag_created_time, tag_x_coordinate AS tag_x, tag_y_coordinate AS tag_y
FROM project1.Public_Tag_Information;

-- Load data into User_Events table
INSERT INTO User_Events (event_id, event_creator_id, event_name, event_tagline, event_description, event_host, event_type, event_subtype,
                         event_address, event_city_id, event_start_time, event_end_time)
SELECT e.event_id, e.event_creator_id, e.event_name, e.event_tagline, e.event_description, e.event_host, e.event_type, e.event_subtype,
       e.event_address,
       (SELECT c.city_id FROM Cities c
        WHERE c.city_name = e.event_city AND c.state_name = e.event_state AND c.country_name = e.event_country),
       e.event_start_time, e.event_end_time
FROM project1.Public_Event_Information e;
