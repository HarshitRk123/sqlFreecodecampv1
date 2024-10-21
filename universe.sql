-- 1. Connect to the universe database (if it doesn't exist, create it)
\c universe;

-- 2. Create tables with corrected relationships

-- Create the galaxy table
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,                      -- Automatically incrementing primary key
    name VARCHAR(20) UNIQUE NOT NULL,                  -- Unique name column of type VARCHAR
    area INTEGER,                                      -- INT column for area
    volume INTEGER,                                    -- INT column for volume
    age NUMERIC,                                       -- NUMERIC column for age
    material TEXT,                                     -- TEXT column for material
    has_life BOOLEAN,                                  -- BOOLEAN column for life existence
    has_water BOOLEAN                                  -- BOOLEAN column for water existence
);

-- Create the star table with a foreign key referencing the galaxy table
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,                        -- Automatically incrementing primary key
    galaxy_id INTEGER NOT NULL,                        -- Foreign key referencing galaxy table
    name VARCHAR(20) UNIQUE NOT NULL,                  -- Unique name column of type VARCHAR
    area INTEGER,                                      -- INT column for area
    volume INTEGER,                                    -- INT column for volume
    age NUMERIC,                                       -- NUMERIC column for age
    material TEXT,                                     -- TEXT column for material
    has_life BOOLEAN,                                  -- BOOLEAN column for life existence
    has_water BOOLEAN,                                 -- BOOLEAN column for water existence
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id) -- Reference to galaxy table
);

-- Create the planet table with a foreign key referencing the star table
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,                      -- Automatically incrementing primary key
    star_id INTEGER NOT NULL,                          -- Foreign key referencing star table
    name VARCHAR(20) UNIQUE NOT NULL,                  -- Unique name column of type VARCHAR
    area INTEGER,                                      -- INT column for area
    volume INTEGER,                                    -- INT column for volume
    age NUMERIC,                                       -- NUMERIC column for age
    material TEXT,                                     -- TEXT column for material
    has_life BOOLEAN,                                  -- BOOLEAN column for life existence
    has_water BOOLEAN,                                 -- BOOLEAN column for water existence
    FOREIGN KEY (star_id) REFERENCES star(star_id)     -- Reference to star table
);

-- Create the moon table with a foreign key referencing the planet table
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,                        -- Automatically incrementing primary key
    planet_id INTEGER NOT NULL,                        -- Foreign key referencing planet table
    name VARCHAR(20) UNIQUE NOT NULL,                  -- Unique name column of type VARCHAR
    area INTEGER,                                      -- INT column for area
    volume INTEGER,                                    -- INT column for volume
    age NUMERIC,                                       -- NUMERIC column for age
    material TEXT,                                     -- TEXT column for material
    has_life BOOLEAN,                                  -- BOOLEAN column for life existence
    has_water BOOLEAN,                                 -- BOOLEAN column for water existence
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id) -- Reference to planet table
);

-- Create the more_info table as an additional table
CREATE TABLE more_info (
    more_info_id SERIAL PRIMARY KEY,                   -- Automatically incrementing primary key
    object_id INTEGER,                                 -- Foreign key to any object
    name VARCHAR(20) UNIQUE NOT NULL,                  -- Unique name column of type VARCHAR
    description TEXT                                   -- TEXT column for description
);

-- 3. Insert sample data into each table

-- Insert data into galaxy table
INSERT INTO galaxy (name, area, volume, age, material, has_life, has_water) VALUES
('galaxy1', 500, 750, 1500.75, 'solid', true, true),
('galaxy2', 500, 750, 1500.75, 'solid', true, true),
('galaxy3', 500, 750, 1500.75, 'solid', true, true),
('galaxy4', 500, 750, 1500.75, 'solid', true, true),
('galaxy5', 500, 750, 1500.75, 'solid', true, true),
('galaxy6', 500, 750, 1500.75, 'solid', true, true);

-- Insert data into star table
INSERT INTO star (galaxy_id, name, area, volume, age, material, has_life, has_water) VALUES
(1, 'star1', 500, 750, 1500.75, 'solid', true, true),
(2, 'star2', 500, 750, 1500.75, 'solid', true, true),
(3, 'star3', 500, 750, 1500.75, 'solid', true, true),
(4, 'star4', 500, 750, 1500.75, 'solid', true, true),
(5, 'star5', 500, 750, 1500.75, 'solid', true, true),
(6, 'star6', 500, 750, 1500.75, 'solid', true, true);

-- Insert data into planet table
INSERT INTO planet (star_id, name, area, volume, age, material, has_life, has_water) VALUES
(1, 'planet1', 500, 750, 1500.75, 'solid', true, true),
(2, 'planet2', 500, 750, 1500.75, 'solid', true, true),
(3, 'planet3', 500, 750, 1500.75, 'solid', true, true),
(4, 'planet4', 500, 750, 1500.75, 'solid', true, true),
(5, 'planet5', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet6', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet7', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet8', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet9', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet10', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet11', 500, 750, 1500.75, 'solid', true, true),
(6, 'planet12', 500, 750, 1500.75, 'solid', true, true);

-- Insert data into moon table
INSERT INTO moon (planet_id, name, area, volume, age, material, has_life, has_water) VALUES
(1, 'moon1', 500, 750, 1500.75, 'solid', true, true),
(2, 'moon2', 500, 750, 1500.75, 'solid', true, true),
(3, 'moon3', 500, 750, 1500.75, 'solid', true, true),
(4, 'moon4', 500, 750, 1500.75, 'solid', true, true),
(5, 'moon5', 500, 750, 1500.75, 'solid', true, true),
(6, 'moon6', 500, 750, 1500.75, 'solid', true, true),
(7, 'moon7', 500, 750, 1500.75, 'solid', true, true),
(8, 'moon8', 500, 750, 1500.75, 'solid', true, true),
(9, 'moon9', 500, 750, 1500.75, 'solid', true, true),
(10, 'moon10', 500, 750, 1500.75, 'solid', true, true),
(11, 'moon11', 500, 750, 1500.75, 'solid', true, true),
(12, 'moon12', 500, 750, 1500.75, 'solid', true, true),
(13, 'moon13', 500, 750, 1500.75, 'solid', true, true),
(14, 'moon14', 500, 750, 1500.75, 'solid', true, true),
(15, 'moon15', 500, 750, 1500.75, 'solid', true, true),
(16, 'moon16', 500, 750, 1500.75, 'solid', true, true),
(17, 'moon17', 500, 750, 1500.75, 'solid', true, true),
(18, 'moon18', 500, 750, 1500.75, 'solid', true, true),
(19, 'moon19', 500, 750, 1500.75, 'solid', true, true),
(20, 'moon20', 500, 750, 1500.75, 'solid', true, true);

-- Insert data into more_info table
INSERT INTO more_info (object_id, name, description) VALUES
(1, 'info1', 'lorem impsum'),
(2, 'info2', 'lorem impsum'),
(3, 'info3', 'lorem impsum'),
(4, 'info4', 'lorem impsum'),
(5, 'info5', 'lorem impsum');

-- 5. Export the data into a SQL dump file
pg_dump -cC --inserts -U freecodecamp universe > universe.sql
