-- file: spec/seeds_artists.sql

TRUNCATE TABLE artists RESTART IDENTITY; -- empties the table and resets the primary key

INSERT INTO artists (name, genre) VALUES('Beyonce', 'pop');
INSERT INTO artists (name, genre) VALUES('Dua Lipa', 'pop');