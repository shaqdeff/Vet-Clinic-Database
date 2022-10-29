/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id INT,
name VARCHAR(50),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL,
species VARCHAR(50)
);

CREATE TABLE owners (
  id INT,
  full_name VARCHAR(50),
  age INT,
  PRIMARY KEY (id)
)

CREATE TABLE species (
 id INT PRIMARY KEY,
 name VARCHAR(50)
);

-- Make sure that id is set as autoincremented PRIMARY KEY
ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN ID SERIAL PRIMARY KEY;

-- Remove column species
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INTEGER,
ADD FOREIGN KEY (species_id) REFERENCES species (id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INTEGER,
ADD FOREIGN KEY (owner_id) REFERENCES owners (id);