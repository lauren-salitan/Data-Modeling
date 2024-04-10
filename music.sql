-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');

-- Creating a table for artists
CREATE TABLE artists
(
  artist_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

-- Creating a table for albums
CREATE TABLE albums
(
  album_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_date DATE NOT NULL,
  artist_id INTEGER NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE producers
(
  producer_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE songs
(
  song_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE song_producers
(
  song_id INTEGER NOT NULL,
  producer_id INTEGER NOT NULL,
  PRIMARY KEY (song_id, producer_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id),
  FOREIGN KEY (producer_id) REFERENCES producers(producer_id)
);

INSERT INTO artists (name) VALUES
('Hanson'), 
('Queen'), 
('Mariah Carey'), 
('Boyz II Men'), 
('Lady Gaga'), 
('Bradley Cooper'),
('Nickelback'), 
('Jay Z'), 
('Alicia Keys'), 
('Katy Perry'), 
('Juicy J'), 
('Maroon 5'),
('Christina Aguilera'), 
('Avril Lavigne'), 
('Destiny''s Child');


INSERT INTO albums (title, release_date, artist_id) VALUES
('Middle of Nowhere', '1997-04-15', (SELECT artist_id FROM artists WHERE name = 'Hanson')),
('A Night at the Opera', '1975-10-31', (SELECT artist_id FROM artists WHERE name = 'Queen'));

INSERT INTO songs (title, duration_in_seconds, album_id) VALUES
('MMMBop', 238, (SELECT album_id FROM albums WHERE title = 'Middle of Nowhere'));

INSERT INTO producers (name) VALUES
('Dust Brothers'), 
('Stephen Lironi'), 
('Roy Thomas Baker'), 
('Walter Afanasieff'), 
('Benjamin Rice');

INSERT INTO song_producers (song_id, producer_id) VALUES
((SELECT song_id FROM songs WHERE title = 'MMMBop'), (SELECT producer_id FROM producers WHERE name = 'Dust Brothers'));
