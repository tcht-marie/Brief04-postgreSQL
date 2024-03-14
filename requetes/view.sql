--------------------------------------------------------------------------------------------------------------------
----- Filtre toutes les réactions avec le name de la reaction et name de user-----
--------------------------------------------------------------------------------------------------------------------
CREATE VIEW allReactions AS
SELECT rpu.post_id,
    rpu.reaction_id,
    r.type AS reaction,
    rpu.accountUser_id,
    acc.name AS user
FROM reactPostUser rpu
    JOIN accountUser acc ON acc.id = rpu.accountuser_id
    JOIN reaction r ON r.id = rpu.reaction_id;
SELECT *
FROM allReactions;
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts qui ont le plus de reactions (les plus populaires)-----
--------------------------------------------------------------------------------------------------------------------
CREATE VIEW filterPostPopular AS
SELECT p.id AS post_id,
    p.description,
    COUNT(rpu.reaction_id) AS total_reactions
FROM post p
    LEFT JOIN reactPostUser rpu ON p.id = rpu.post_id
WHERE parent_id IS NULL
GROUP BY p.id,
    p.description
ORDER BY total_reactions DESC;
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts les plus récents (tri par date) -----
--------------------------------------------------------------------------------------------------------------------
CREATE VIEW filterPostRecentDate AS
SELECT p.id AS post_id,
    p.description,
    p.date,
    COUNT(p.date)
FROM post p
WHERE parent_id IS NULL
GROUP BY p.id,
    p.description
ORDER BY p.date DESC;
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts les plus récents (tri par date) avec le nombre de like et partage -----
--------------------------------------------------------------------------------------------------------------------
CREATE VIEW filterPostWithNbReact AS
SELECT p.id AS post_id,
    p.description,
    COUNT(rp.reaction_id) AS total_reactions
FROM post p
    CROSS JOIN reactPostUser rp
WHERE rp.reaction_id IN (1, 8)
    AND parent_id IS NULL
GROUP BY p.id,
    p.description,
    p.date
HAVING COUNT(DISTINCT rp.reaction_id) = 2
ORDER BY p.date DESC;