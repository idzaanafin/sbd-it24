CREATE DATABASE `C017_FRD`;
USE `C017_FRD`;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    tanggal_registrasi DATE NOT NULL
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    judul_post VARCHAR(255) NOT NULL,
    konten_post TEXT NOT NULL,
    tanggal_publikasi DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    user_id INT,
    konten_comment TEXT NOT NULL,
    tanggal_comment DATE NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    nama_category VARCHAR(50) NOT NULL
);

CREATE TABLE Post_Categories (
    post_category_id INT PRIMARY KEY AUTO_INCREMENT,
    post_id INT,
    category_id INT,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);





ALTER TABLE Users
ADD last_login DATETIME;


ALTER TABLE Users
CHANGE tanggal_registrasi registration_date DATE;


ALTER TABLE Posts
ADD status_post ENUM('Draft', 'Published', 'Archived') NOT NULL DEFAULT 'Draft';


ALTER TABLE Posts
CHANGE judul_post post_title VARCHAR(255);

ALTER TABLE Comments
CHANGE tanggal_comment comment_date DATE;

ALTER TABLE Categories
CHANGE nama_category category_name VARCHAR(100) NOT NULL UNIQUE;

ALTER TABLE Post_Categories
DROP PRIMARY KEY,
DROP COLUMN post_category_id;

ALTER TABLE Post_Categories
ADD PRIMARY KEY (post_id, category_id);



INSERT INTO Users (user_id, username, email, registration_date, last_login)
VALUES
(1, 'connorkenway', 'ckenway@ac.com', '2024-09-05', '2025-04-30 3:45:24'),
(2, 'ezioautditore', 'brotherhoodmaster@ac.com', '2024-10-30', '2025-04-29 9:25:07'),
(3, 'altairlaahad', 'goldeneagle@ac.com', '2024-07-28', '2025-04-30 10:00:33');

INSERT INTO Posts (post_id, user_id, post_title, konten_post, tanggal_publikasi, status_post)
VALUES
(1001, 1, 'Review Gadget Terbaru', 'RTX is a jokes? apakah AMD sedang memasak...', '2025-03-02 8:12:31', 'Published'),
(1002, 2, 'Tips Menjaga Pola Hidup Sehat', 'Panduan singkat untuk pola makan sehat...', '2025-03-12 13:33:54', 'Archived'),
(1003, 1, 'PC Gaming Low Budget FPS RATA KANAN!!!', 'Langkah-langkah merakit PC gaming tepat sasaran...', '2025-04-22 1:11:11', 'Published'),
(1004, 3, 'REMONTADA IS REAL??', 'Real Madrid bapuk, siapa yang harus disalahkan...', '2025-04-11 16:00:39', 'Draft');

INSERT INTO Comments (comment_id, post_id, user_id, konten_comment, comment_date)
VALUES
(10001, 1001, 2, 'Reviewnya kerenn!', '2025-04-27 8:12:31'),
(10002, 1002, 1, 'MasyaAllah sangat bermanfaat, materi full daging!', '2025-04-25 11:12:13'),
(10003, 1001, 3, 'Wah ini mah.....', '2025-04-25 21:41:00'),
(10004, 1004, 1, 'Mbah Ance lah sopo maneh bos! iku board sisan!', '2025-04-26 14:01:21');

INSERT INTO Categories (category_id, category_name)
VALUES
(101, 'Technology'),
(102, 'Lifestyle'),
(103, 'Sports'),
(104, 'Tutorial');

INSERT INTO Post_Categories (post_id, category_id)
VALUES
(1001, 101),
(1002, 102),
(1003, 101),
(1003, 104),
(1004, 103);

SELECT username, email FROM Users;

UPDATE Posts
SET status_post = 'Archived'
WHERE post_id = 1003;

DELETE FROM Comments
WHERE comment_id = 10003;


SELECT post_title, status_post FROM Posts;

RENAME TABLE Categories TO BlogCategories;

TRUNCATE TABLE Comments;

SELECT * FROM Comments;

