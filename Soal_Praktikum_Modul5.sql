SELECT * FROM Users ORDER BY username;

SELECT title_post, tanggal_publikasi FROM Posts ORDER BY tanggal_publikasi DESC;

SELECT COUNT(*) AS total_users FROM Users;

SELECT MIN(tanggal_publikasi) AS tanggal_pertama_dipublikasikan FROM Posts;

SELECT COUNT(*) AS total_postingan FROM Posts;

SELECT title_post, tanggal_publikasi FROM Posts
WHERE tanggal_publikasi BETWEEN '2025-03-01' AND '2025-04-01';

SELECT category_name FROM BlogCategories
WHERE category_name LIKE '%logy%';

SELECT title_post,
  CASE status_post
    WHEN 'Published' THEN 'Aktif'
    WHEN 'Archived' THEN 'Diarsipkan'
    WHEN 'Draft' THEN 'Konsep'
    ELSE 'Tidak Diketahui'
  END AS status_deskriptif
FROM Posts;

SELECT title_post, YEAR(tanggal_publikasi) AS tahun_publikasi FROM Posts;

SELECT title_post, MONTH(tanggal_publikasi) AS bulan_publikasi FROM Posts;

SELECT username, DATEDIFF(CURDATE(), registration_date) AS hari_bergabung FROM Users;

