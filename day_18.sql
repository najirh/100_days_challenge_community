-- DAY 18/100

DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    mail VARCHAR(100)
);


INSERT INTO Users (user_id, name, mail) VALUES
(1, 'Winston', 'winston@ymail.com'),
(2, 'Jonathan', 'jonathanisgreat'),
(3, 'Annabelle', 'bella-@ymail.com'),
(4, 'Sally', 'sally.come@ymail.com'),
(5, 'Marwan', 'quarz#2020@ymail.com'),
(6, 'David', 'john@gmail.com'),
(7, 'David', 'sam25@gmail.com'),
(8, 'David', 'david69@gmail.com'),
(9, 'Shapiro', '.shapo@ymail.com');




-- You are given table below
-- Write SQL Query to find users whose email addresses contain only lowercase letters before the @ symbol


SELECT * FROM users
WHERE mail ~ '^[a-z.0-9]+@[a-z]+\.[a-z]+$'; 



SELECT * FROM users
WHERE mail REGEXP '^[a-z.0-9]+@[a-z]+\.[a-z]+$'; 















-- Task Question : Find email that has lowercase and numbers before the @ symbol!


