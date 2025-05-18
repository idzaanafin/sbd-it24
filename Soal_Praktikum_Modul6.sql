SELECT 
    Posts.post_id, 
    Posts.post_title, 
    Users.username
FROM Posts
JOIN Users ON Posts.user_id = Users.user_id;


UPDATE Posts
SET status_post = 'Published';


ALTER TABLE Posts
ADD comment_count INT DEFAULT 0;


DELIMITER //

CREATE TRIGGER increment_comment_count
AFTER INSERT ON Comments
FOR EACH ROW
BEGIN
    UPDATE Posts
    SET comment_count = comment_count + 1
    WHERE post_id = NEW.post_id;
END;
//

DELIMITER ;


INSERT INTO Comments (comment_id, post_id, user_id, konten_comment, comment_date)
VALUES
(10005, 1001, 2, 'Sorry, Aku Apple dari umur 15', '2025-05-13 08:12:31'),
(10006, 1002, 1, 'Konten kok plagiat peng peng peng! wluwluwlu..', '2025-05-12 11:12:13'),
(10007, 1004, 1, 'MU donkk UNBEATEN, ini baru King Eropa Bos', '2025-05-12 21:41:00'),
(10008, 1003, 3, 'Mending rakit PC dewe ae, sak karep', '2025-05-11 14:01:21');


SELECT 
    Posts.post_title,
    Users.username,
    Comments.konten_comment
FROM Comments
JOIN Posts ON Comments.post_id = Posts.post_id
JOIN Users ON Comments.user_id = Users.user_id
WHERE Posts.status_post = 'Published';


SELECT 
    Users.username,
    COUNT(Posts.post_id) AS total_posts
FROM Users
LEFT JOIN Posts ON Users.user_id = Posts.user_id
GROUP BY Users.user_id, Users.username;


SELECT 
    Users.username,
    Posts.post_title
FROM Comments
JOIN Users ON Comments.user_id = Users.user_id
JOIN Posts ON Comments.post_id = Posts.post_id
ORDER BY Users.username, Posts.post_title;


SELECT 
    Comments.konten_comment,
    Posts.post_title,
    Users.username
FROM Comments
JOIN Posts ON Comments.post_id = Posts.post_id
JOIN Users ON Comments.user_id = Users.user_id
WHERE TRIM(Comments.konten_comment) <> '';


DELIMITER //

CREATE TRIGGER update_last_login_on_comment
AFTER INSERT ON Comments
FOR EACH ROW
BEGIN
    UPDATE Users
    SET last_login = NOW()
    WHERE user_id = NEW.user_id;
END;
//

DELIMITER ;


CREATE VIEW vw_simple_posts AS
SELECT 
    Posts.post_id,
    Posts.post_title,
    Users.username
FROM Posts
JOIN Users ON Posts.user_id = Users.user_id;


CREATE VIEW vw_all_comments AS
SELECT 
    Comments.comment_id,
    Comments.konten_comment,
    Users.username,
    Posts.post_title
FROM Comments
JOIN Users ON Comments.user_id = Users.user_id
JOIN Posts ON Comments.post_id = Posts.post_id;




CREATE VIEW vw_monthly_posts AS
SELECT 
    DATE_FORMAT(tanggal_publikasi, '%Y-%m'),
    COUNT(*)
FROM Posts
GROUP BY DATE_FORMAT(tanggal_publikasi, '%Y-%m')
ORDER BY tanggal_publikasi;
