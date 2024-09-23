-- View 1: View_User_Information
CREATE OR REPLACE VIEW View_User_Information AS
SELECT 
    U.user_id,
    U.first_name,
    U.last_name,
    U.year_of_birth,
    U.month_of_birth,
    U.day_of_birth,
    U.gender,
    H.city_name AS hometown_city,
    C.city_name AS current_city
FROM 
    Users U
LEFT JOIN User_Hometown_Cities UH ON U.user_id = UH.user_id
LEFT JOIN Cities H ON UH.hometown_city_id = H.city_id
LEFT JOIN User_Current_Cities UC ON U.user_id = UC.user_id
LEFT JOIN Cities C ON UC.current_city_id = C.city_id;

-- View 2: View_Are_Friends
CREATE OR REPLACE VIEW View_Are_Friends AS
SELECT 
    F.user1_id,
    F.user2_id,
    U1.first_name AS user1_first_name,
    U1.last_name AS user1_last_name,
    U2.first_name AS user2_first_name,
    U2.last_name AS user2_last_name
FROM 
    Friends F
JOIN Users U1 ON F.user1_id = U1.user_id
JOIN Users U2 ON F.user2_id = U2.user_id;

-- View 3: View_Photo_Information
CREATE OR REPLACE VIEW View_Photo_Information AS
SELECT 
    P.photo_id,
    P.album_id,
    A.album_name,
    P.photo_caption,
    P.photo_created_time,
    P.photo_modified_time,
    P.photo_link,
    A.album_owner_id,
    U.first_name AS album_owner_first_name,
    U.last_name AS album_owner_last_name
FROM 
    Photos P
JOIN Albums A ON P.album_id = A.album_id
JOIN Users U ON A.album_owner_id = U.user_id;

-- View 4: View_Event_Information
CREATE OR REPLACE VIEW View_Event_Information AS
SELECT 
    E.event_id,
    E.event_name,
    E.event_tagline,
    E.event_description,
    E.event_host,
    E.event_type,
    E.event_subtype,
    E.event_address,
    C.city_name AS event_city,
    E.event_start_time,
    E.event_end_time,
    U.user_id AS event_creator_id,
    U.first_name AS event_creator_first_name,
    U.last_name AS event_creator_last_name
FROM 
    User_Events E
JOIN Cities C ON E.event_city_id = C.city_id
JOIN Users U ON E.event_creator_id = U.user_id;

-- View 5: View_Tag_Information
CREATE OR REPLACE VIEW View_Tag_Information AS
SELECT 
    T.tag_photo_id,
    T.tag_subject_id,
    P.photo_link,
    U.first_name AS tag_subject_first_name,
    U.last_name AS tag_subject_last_name,
    T.tag_x,
    T.tag_y,
    T.tag_created_time
FROM 
    Tags T
JOIN Users U ON T.tag_subject_id = U.user_id
JOIN Photos P ON T.tag_photo_id = P.photo_id;
