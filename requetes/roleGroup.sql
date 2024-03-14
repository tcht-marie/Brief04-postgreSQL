INSERT INTO roleGroup(accountUser_id, role_id)
VALUES (1, 1),
    (5, 2),
    (88, 5),
    (33, 4),
    (32, 3),
    (99, 5),
    (13, 1);
--------------------------------------------------------------------------------------------------------------------
----- Vérif insertion -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM roleGroup;
--------------------------------------------------------------------------------------------------------------------
----- SELECT toute la table roleGroup, le type du role, le name du user -----
--------------------------------------------------------------------------------------------------------------------
SELECT rg.*,
    au.name,
    r.type,
    gu.name
FROM roleGroup rg
    JOIN accountUser au ON au.id = rg.accountUser_id
    JOIN role r ON r.id = rg.role_id
    JOIN groupUser gu ON rg.groupUser_id = gu.id;
--      accountuser_id | role_id | groupuser_id |            name             |       type        |           name
-- ----------------+---------+--------------+-----------------------------+-------------------+--------------------------
--               1 |       1 |            1 | Frodon Sacquet              | Super Utilisateur | Les hobbits en vacances
--               5 |       2 |            2 | Gorbadoc Burrows            | Administrateur    | Les pouvoirs de l anneau
--              88 |       5 |            2 | Caramella Sackville-Baggins | Visiteur          | Les pouvoirs de l anneau
--              33 |       4 |            3 | Pandora Took                | Editeur           | Golum
--              32 |       3 |            1 | Dinodas Goodchild           | Modérateur        | Les hobbits en vacances
--              99 |       5 |            1 | Hamfast Brandybuck          | Visiteur          | Les hobbits en vacances
--              13 |       1 |            3 | Grimalda Brandagamba        | Super Utilisateur | Golum
-- (7 lignes)
SELECT COUNT(accountUser_id),
    gu.name AS nameGroup
FROM roleGroup rg
    JOIN groupUser gu ON gu.id = rg.accountUser_id
GROUP BY rg.accountUser_id,
    gu.name;