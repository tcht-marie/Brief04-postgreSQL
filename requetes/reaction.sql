INSERT INTO reaction(type)
VALUES ('Like'),
    ('Dislike'),
    ('Heart'),
    ('Thumb'),
    ('Shit'),
    ('Joy'),
    ('Sad');
INSERT INTO reaction(type)
VALUES ('Shared');
--------------------------------------------------------------------------------------------------------------------
----- Vériif des insertions -----
--------------------------------------------------------------------------------------------------------------------
SELECT *
FROM reaction;