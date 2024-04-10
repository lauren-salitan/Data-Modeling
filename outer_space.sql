-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

  -- from the terminal run:
-- psql < outer_space.sql


CREATE TABLE galaxies
(
  galaxy_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE stars
(
  star_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  galaxy_id INTEGER NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxies(galaxy_id)
);

CREATE TABLE planets
(
  planet_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INTEGER NOT NULL,
  FOREIGN KEY (star_id) REFERENCES stars(star_id)
);

CREATE TABLE moons
(
  moon_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  planet_id INTEGER NOT NULL,
  FOREIGN KEY (planet_id) REFERENCES planets(planet_id)
);

INSERT INTO galaxies (name) VALUES
('Milky Way');

INSERT INTO stars (name, galaxy_id) VALUES
('The Sun', (SELECT galaxy_id FROM galaxies WHERE name = 'Milky Way')),
('Proxima Centauri', (SELECT galaxy_id FROM galaxies WHERE name = 'Milky Way')),
('Gliese 876', (SELECT galaxy_id FROM galaxies WHERE name = 'Milky Way'));

INSERT INTO planets (name, orbital_period_in_years, star_id) VALUES
('Earth', 1.00, (SELECT star_id FROM stars WHERE name = 'The Sun')),
('Mars', 1.88, (SELECT star_id FROM stars WHERE name = 'The Sun')),
('Venus', 0.62, (SELECT star_id FROM stars WHERE name = 'The Sun')),
('Neptune', 164.8, (SELECT star_id FROM stars WHERE name = 'The Sun')),
('Proxima Centauri b', 0.03, (SELECT star_id FROM stars WHERE name = 'Proxima Centauri')),
('Gliese 876 b', 0.23, (SELECT star_id FROM stars WHERE name = 'Gliese 876'));

INSERT INTO moons (name, planet_id) VALUES
('The Moon', (SELECT planet_id FROM planets WHERE name = 'Earth')),
('Phobos', (SELECT planet_id FROM planets WHERE name = 'Mars')),
('Deimos', (SELECT planet_id FROM planets WHERE name = 'Mars')),



-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 1, 1, 1),
--   ('Mars', 1.88, 1, 1, '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 1, 1, '{}'),
--   ('Neptune', 164.8, 1, 1, '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 2, 1, '{}'),
--   ('Gliese 876 b', 0.23, 3, 1, '{}');

--   -- orbits around
--   CREATE TABLE orbits_arounds
--   (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--   );
--   INSERT INTO orbits_arounds
--   (name)
--   VALUES
--   ('The Sun'),
--   ('Proxima Centauri'),
--   ('Gliese 876');
--   -- galaxy
--     CREATE TABLE galaxy
--   (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--   );
--   INSERT INTO galaxy
--   (name)
--   VALUES
--   ('Milky Way');
--   -- moons
--     CREATE TABLE moons
--   (
--     id SERIAL PRIMARY KEY,
--     name TEXT NOT NULL,
--   );
--   INSERT INTO moons
--   (name)
--   VALUES
--   ('The moon'),
--   ('Phobos'),
--   ('Deimos'),
--   ('Naiad'),
--   ('Thalassa'),
--   ('Despina'),
--   ('Galatea'),
--   ('Larissa'),
--   ('S/2004 N 1'),
--   ('Proteus'),
--   ('Triton'),
--   ('Nereid'),
--   ('Halimede'),
--   ('Sao'),
--   ('Laomedeia'),
--   ('Psamathe'),
--   ('Neso');