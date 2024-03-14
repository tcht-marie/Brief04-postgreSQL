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