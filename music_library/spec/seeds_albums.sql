-- file: spec/seeds_albums.sql

TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY;

INSERT INTO artists (name, genre) VALUES ('Beyonce', 'pop');
INSERT INTO artists (name, genre) VALUES ('Dua Lipa', 'pop');

INSERT INTO albums (title, release_year, artist_id) VALUES ('Renaissance', '2022', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Future Nostalgia', '2021', '2');