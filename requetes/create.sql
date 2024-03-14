CREATE DATABASE social_media;
-- CREATE DATABASE
----------------------------
CREATE TABLE "user" (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    birth DATE,
    PRIMARY KEY(id)
);
----------------------------
ALTER TABLE "user"
    RENAME TO accountUser;
----------------------------
ALTER TABLE accountUser
ALTER COLUMN birth TYPE VARCHAR(10);
----------------------------
CREATE TABLE accountUser (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    birth VARCHAR(10),
    PRIMARY KEY(id)
);
----------------------------
CREATE TABLE post (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    description VARCHAR(255) NOT NULL,
    image VARCHAR(150) NOT NULL,
    date TIMESTAMP NOT NULL,
    accountUser_id INT NOT NULL,
    image_formats_id INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_accountUser FOREIGN KEY(accountUser_id) REFERENCES accountUser(id),
    CONSTRAINT fk_image_formats FOREIGN KEY(image_formats_id) REFERENCES image_formats(id)
);
----------------------------
ALTER TABLE post
ALTER COLUMN description TYPE TEXT;
----------------------------
-- CREATE TABLE comment (
--     id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
--     description VARCHAR(255) NOT NULL,
--     accountUser_id INT NOT NULL,
--     post_id INT NOT NULL,
--     PRIMARY KEY(id),
--     CONSTRAINT fk_accountUser FOREIGN KEY(accountUser_id) REFERENCES accountUser(id),
--     CONSTRAINT fk_post FOREIGN KEY(post_id) REFERENCES post(id)
-- );
----------------------------
CREATE TABLE reaction (
    id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    type VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
----------------------------
CREATE TABLE reactPostUser (
    reaction_id INT NOT NULL,
    post_id INT NOT NULL,
    accountUser_id INT NOT NULL,
    CONSTRAINT fk_accountUser FOREIGN KEY(accountUser_id) REFERENCES accountUser(id),
    CONSTRAINT fk_post FOREIGN KEY(post_id) REFERENCES post(id),
    CONSTRAINT fk_reaction FOREIGN KEY(reaction_id) REFERENCES reaction(id)
);
----------------------------
CREATE TABLE follower (
    follower_id INT NOT NULL,
    followed_id INT NOT NULL,
    PRIMARY KEY(follower_id, followed_id),
    CONSTRAINT fk_follower_id FOREIGN KEY(follower_id) REFERENCES accountUser(id),
    CONSTRAINT fk_followed_id FOREIGN KEY(followed_id) REFERENCES accountUser(id)
);
----------------------------
DROP TABLE comment;
----------------------------
ALTER TABLE post
ADD parent_id INT;
----------------------------
ALTER TABLE post
ADD CONSTRAINT FK_parent FOREIGN KEY(parent_id) REFERENCES post(id);
----------------------------
ALTER TABLE post
ALTER COLUMN image DROP NOT NULL;
----------------------------
ALTER TABLE post
ALTER COLUMN date DROP NOT NULL;
--------------------------------------------------------------------------------------------------------------------
----- oubli de la contrainte NO DELETE CASCADE dans toutes mes tables -----
----- ajout de la contrainte sur les tables : post, reactPostUser et follower  -----
--------------------------------------------------------------------------------------------------------------------
ALTER TABLE follower DROP CONSTRAINT fk_follower_id;
----------------------------
ALTER TABLE follower
ADD CONSTRAINT fk_follower_id FOREIGN KEY(follower_id) REFERENCES accountUser(id) ON DELETE CASCADE;
----------------------------
CREATE TABLE role (
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(20)
);
----------------------------
CREATE TABLE roleGroup (
    accountUser_id INT NOT NULL,
    role_id INT NOT NULL,
    groupUser_id INT,
    CONSTRAINT fk_accountUser FOREIGN KEY(accountUser_id) REFERENCES accountUser(id) ON DELETE CASCADE,
    CONSTRAINT fk_role FOREIGN KEY(role_id) REFERENCES role(id) ON DELETE CASCADE,
    CONSTRAINT fk_groupUser FOREIGN KEY(groupUser_id) REFERENCES groupUser(id) ON DELETE CASCADE
);
----------------------------
CREATE TABLE image_formats (
    id SERIAL PRIMARY KEY,
    format_name VARCHAR(50) NOT NULL
);
----------------------------
ALTER TABLE post
ADD COLUMN image_formats_id INT,
    ADD CONSTRAINT fk_image_formats FOREIGN KEY (image_formats_id) REFERENCES image_formats(id);
----------------------------
CREATE TABLE groupUser (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
-- id |           name
-- ----+--------------------------
--   1 | Les hobbits en vacances
--   2 | Les pouvoirs de l anneau
--   3 | Golum
-- (3 lignes)