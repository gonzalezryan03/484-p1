-- Drop Triggers
DROP TRIGGER trg_friends_check;
DROP TRIGGER trg_album_photo_check;

-- Drop Tables in correct order to avoid dependency issues
DROP TABLE Tags;
DROP TABLE Participants;
DROP TABLE Photos;
DROP TABLE Albums;
DROP TABLE Messages;
DROP TABLE Education;
DROP TABLE Friends;
DROP TABLE User_Hometown_Cities;
DROP TABLE User_Current_Cities;
DROP TABLE User_Events;
DROP TABLE Programs;
DROP TABLE Cities;
DROP TABLE Users;