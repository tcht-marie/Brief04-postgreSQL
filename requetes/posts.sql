--------------------------------------------------------------------------------------------------------------------
----- INSERT d'un post -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO post(description, image, date, accountUser_id)
VALUES (
        'Les Hobbits, également appelés Semi-hommes ou Periannath, sont un des peuples de la Terre du Milieu. Ils apparaissent pour la première fois dans Le Hobbit, mais leur histoire est principalement racontée dans Le Seigneur des Anneaux. Dans ce livre, plusieurs chapitres leurs sont dédiés racontant leur histoires et leurs mœurs. J.R.R. Tolkien a ajouté dans une lettre qu ils sont très apparentés aux hommes, mais sont pacifiques.',
        'image-hobbit',
        '2024-03-12 11:12:37',
        43
    );
--------------------------------------------------------------------------------------------------------------------
----- INSERT de trois posts -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO post(description, image, date, accountUser_id)
VALUES (
        'Le Hobbit (The Hobbit) est une trilogie cinématographique américano-néo-zélandaise de fantasy coécrite, produite et réalisée par Peter Jackson, adaptée du roman Le Hobbit de l écrivain britannique J. R. R. Tolkien. Elle est composée de Un voyage inattendu (2012), de La Désolation de Smaug (2013) et de La Bataille des Cinq Armées (2014).',
        'affiche-film',
        '2023-09-04 23:35:37',
        97
    );
INSERT INTO post(description, image, date, accountUser_id)
VALUES (
        'Ces trois films constituent une adaptation libre du roman homonyme de J. R. R. Tolkien paru en 1937 ainsi que des événements qui se déroulent en parallèle de ce récit et publiés dans les appendices du Seigneur des anneaux. Ce projet s inscrit dans la continuité de l adaptation du Seigneur des anneaux en trois films (2001-2003), également réalisée par Jackson.',
        'portrait-tolkien',
        '2019-10-30 07:00:00',
        2
    );
INSERT INTO post(description, image, date, accountUser_id)
VALUES (
        'Bilbon Sacquet, oncle de Frodon, est un hobbit comme les autres : il évite le danger, l action, l aventure ainsi que les autres races que les hobbits. Il apprécie le plaisir simple de se sentir bien au chaud dans sa demeure, mais un soir, treize nains (Thorin et ses compagnons) font leur entrée chez lui, accompagnés du magicien Gandalf le Gris. Ce dernier lui propose de les suivre pour un long et dangereux voyage vers la Montagne Solitaire où se trouve un trésor gardé par le redoutable Smaug qui a pris Erebor. Bien que Bilbon se désintéresse dans un premier temps de ce voyage, les nains et Gandalf finissent par le convaincre de les accompagner. Lors de leur périlleux voyage, ils rencontrent de nombreuses difficultés, et participent à la bataille des Cinq Armées. Par accident, Bilbon croise la route de la créature nommée Gollum et s empare de son trésor, un anneau magique qui permet de devenir invisible ce qui lui permettra par moments de mieux aider ses amis et de réussir sa mission.',
        'portrait-bilbon',
        '2012-11-04 19:35:13',
        66
    );
--------------------------------------------------------------------------------------------------------------------
----- INSERT de commentaires ayant pour parent un post -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO post(description, accountUser_id, parent_id)
VALUES (
        'Notre histoire date de très longtemps ! Bien plus que les nains...',
        43,
        1
    ),
    ('Vive les Hobbits !!!', 77, 1),
    ('Le troisième film est mon préféré.', 61, 2),
    (
        'Mouais toujours parler de Bilbon et tous les autres on les oublie',
        100,
        4
    );
--------------------------------------------------------------------------------------------------------------------
----- INSERT de commentaires ayant pour parent un commentaire -----
--------------------------------------------------------------------------------------------------------------------
INSERT INTO post(description, accountUser_id, parent_id)
VALUES ('Vive les nains !!!', 5, 8),
    (
        'Je ne vois pas où est le problème franchement',
        7,
        10
    );
--------------------------------------------------------------------------------------------------------------------
----- Vérification des insertions -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM post;
--------------------------------------------------------------------------------------------------------------------
-----SELECT les commentaires qui ont un parent_id -----
--------------------------------------------------------------------------------------------------------------------
SELECT description,
    parent_id
FROM post
WHERE parent_id IS NOT NULL;
--------------------------------------------------------------------------------------------------------------------
-----SELECT d'une réponse (ou plusieurs s'il y en a) à un commentaire -----
--------------------------------------------------------------------------------------------------------------------
SELECT description,
    parent_id
FROM post
WHERE parent_id = 10;
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts par date (à partir d'une date) -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM post
WHERE date > '2024-01-01';
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts par user -----
--------------------------------------------------------------------------------------------------------------------
SELECT p.*
FROM post p
    JOIN accountUser au ON p.accountUser_id = au.id
WHERE au.id = 42;
--------------------------------------------------------------------------------------------------------------------
----- Filtre les posts par mots clés -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM post
WHERE description LIKE '%hobbit%';
--------------------------------------------------------------------------------------------------------------------
----- Pagination (première page) -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM post
WHERE parent_id IS NULL
LIMIT 3 OFFSET 0;
--------------------------------------------------------------------------------------------------------------------
----- Pagination (deuxième page) -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM post
WHERE parent_id IS NULL
LIMIT 3 OFFSET 3;