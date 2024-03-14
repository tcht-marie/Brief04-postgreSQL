--------------------------------------------------------------------------------------------------------------------
----- INSERT dans la table reactPostUser / une réaction sur un post par un user -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO reactPostUser(reaction_id, post_id, accountUser_id)
VALUES (3, 1, 26),
    (3, 1, 97),
    (1, 1, 56),
    (6, 1, 77),
    (1, 2, 13),
    (5, 2, 56),
    (7, 2, 34),
    (1, 2, 44),
    (3, 2, 3),
    (1, 3, 66),
    (3, 3, 67),
    (6, 3, 88),
    (1, 4, 33),
    (2, 4, 33),
    (4, 4, 82),
    (4, 4, 1);
--------------------------------------------------------------------------------------------------------------------
----- SELECT pour vérifier mon INSERT -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM reactPostUser;
--------------------------------------------------------------------------------------------------------------------
----- SELECT de toute la table reactPostUser avec affichage du type de reaction et name du user -----
----- j'aurai pû utiliser rpu.* pour afficher plus rapidement toute la table mais je voulais un ordre précis -----
--------------------------------------------------------------------------------------------------------------------
SELECT rpu.post_id,
    rpu.reaction_id,
    r.type AS reaction,
    rpu.accountUser_id,
    acc.name AS user
FROM reactPostUser rpu
    JOIN accountUser acc ON acc.id = rpu.accountuser_id
    JOIN reaction r ON r.id = rpu.reaction_id;
--------------------------------------------------------------------------------------------------------------------
----- SELECT du nombre de reaction par post avec affichage des posts dans l'ordre croissant -----
--------------------------------------------------------------------------------------------------------------------
SELECT post_id,
    COUNT(reaction_id) AS nbReaction
FROM reactPostUser
GROUP BY post_id
ORDER BY post_id ASC;
--  post_id | nbreaction
-- ---------+------------
--        1 |          4
--        2 |          5
--        3 |          3
--        4 |          4
-- (4 lignes)
--------------------------------------------------------------------------------------------------------------------
----- INSERT dans la table reactPostUser / une nouvelle reaction Shared -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO reactPostUser(reaction_id, post_id, accountUser_id)
VALUES (8, 1, 45),
    (8, 1, 55),
    (8, 2, 66),
    (8, 2, 33),
    (8, 3, 99),
    (8, 3, 27),
    (8, 4, 2),
    (8, 4, 8);
--------------------------------------------------------------------------------------------------------------------
----- SELECT du nombre de reaction ayant l'id 8 (Shared) avec affichage des posts dans l'ordre croissant -----
--------------------------------------------------------------------------------------------------------------------
SELECT post_id,
    COUNT(reaction_id) AS nbReaction
FROM reactPostUser
WHERE reaction_id = 8
GROUP BY post_id
ORDER BY post_id ASC;
--------------------------------------------------------------------------------------------------------------------
----- SELECT posts avec nombre de like et partage -----
--------------------------------------------------------------------------------------------------------------------
SELECT post_id,
    COUNT(reaction_id) AS nbReaction
FROM reactPostUser
WHERE reaction_id = 1
    OR reaction_id = 8
GROUP BY post_id
ORDER BY post_id ASC;
--------------------------------------------------------------------------------------------------------------------
----- SELECT posts avec nombre de like et partage (distinction des likes et des partage pour chaque post) -----
----- ces deux requetes donnent le même résultat -----
--------------------------------------------------------------------------------------------------------------------
SELECT post_id,
    reaction_id
FROM reactPostUser
WHERE reaction_id = 1
UNION ALL
SELECT post_id,
    reaction_id
FROM reactPostUser
WHERE reaction_id = 8
ORDER BY post_id ASC;
--------------------
SELECT post_id,
    reaction_id AS reaction
FROM reactPostUser
WHERE reaction_id IN (1, 8)
ORDER BY post_id ASC;
--------------------------------------------------------------------------------------------------------------------
----- INSERT nouvelles reactions dans la table reactPostUser sur les commentaires -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO reactPostUser(reaction_id, post_id, accountUser_id)
VALUES (1, 7, 3),
    (3, 7, 53),
    (5, 9, 71),
    (4, 10, 66);
--------------------------------------------------------------------------------------------------------------------
----- SELECT nb reaction par post avec affichage des posts dans l'ordre croissant pour verif l'insertion -----
--------------------------------------------------------------------------------------------------------------------
SELECT post_id,
    COUNT(reaction_id) AS nbReaction
FROM reactPostUser
GROUP BY post_id
ORDER BY post_id ASC;
--------------------------------------------------------------------------------------------------------------------
----- SELECT les reactions seulement sur les commentaires -----
--------------------------------------------------------------------------------------------------------------------
SELECT post_id,
    reaction_id
FROM reactPostUser
WHERE post_id IN (7, 8, 9, 10);
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts qui ont le plus de reactions (les plus populaires)-----
--------------------------------------------------------------------------------------------------------------------
SELECT p.*,
    COUNT(reaction_id)
FROM reactPostUser rpu
    JOIN post p ON p.id = rpu.post_id
GROUP BY p.id
ORDER BY p.id ASC;