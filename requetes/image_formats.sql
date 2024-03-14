INSERT INTO image_formats(format_name)
VALUES ('URL'),
    ('JPEG'),
    ('GIF');
----------------------------
SELECT *
FROM image_formats;
--  id | format_name 
-- ----+-------------
--   1 | URL         
--   2 | JPEG        
--   3 | GIF         
-- (3 lignes)
----------------------------