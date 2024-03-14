INSERT INTO follower(follower_id, followed_id)
VALUES (1, 33),
    (1, 66),
    (66, 1),
    (13, 59),
    (56, 48),
    (99, 14),
    (78, 34),
    (98, 22),
    (46, 93),
    (7, 9),
    (65, 23),
    (15, 44),
    (30, 50);
--------------------------------------------------------------------------------------------------------------------
----- SELECT toute la table follower en affichant aussi les noms associés aux users -----
--------------------------------------------------------------------------------------------------------------------
SELECT f.follower_id,
    f.followed_id,
    au.name AS follower_name,
    au.name AS followed_name
FROM follower f
    JOIN accountUser au ON f.follower_id = au.id
    JOIN accountUser accu ON f.followed_id = accu.id;
--------------------------------------------------------------------------------------------------------------------
----- SELECT le nb de followers par user -----
--------------------------------------------------------------------------------------------------------------------
SELECT COUNT(follower_id),
    au.name AS follower,
    ac.name AS followed
FROM follower f
    JOIN accountUser au ON f.follower_id = au.id
    JOIN accountUser ac ON f.followed_id = ac.id
GROUP BY f.follower_id,
    au.name,
    ac.name;
--  count |       follower       |       followed
-- -------+----------------------+-----------------------
--      1 | Frodon Sacquet       | Belinda Galbassi
--      1 | Frodon Sacquet       | Pandora Took
--      1 | Cerdic Goodchild     | Cara Headstrong
--      1 | Primrose Smallburrow | Cora Bracegirdle
--      1 | Savanna Galbassi     | Pamphila Took-Took
--      1 | Belinda Galbassi     | Frodon Sacquet
--      1 | Hamfast Brandybuck   | Bilbo Burrows
--      1 | Grimalda Brandagamba | Iolo Hornblower
--      1 | Mimosa Rumble        | Iolo Boffin
--      1 | Rudigar Sandheaver   | Saradoc Puddifoot
--      1 | Marigold Took        | Isembold Longhole
--      1 | Moro Gammidge        | Belladonna Headstrong
--      1 | Fastred Fairbairn    | Carambo Lightfoot
-- (13 lignes)