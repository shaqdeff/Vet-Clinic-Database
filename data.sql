/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES 
 ('Agumon', date '2020-02-03', 0 , TRUE, 10.23),
 ('Gabumon', date '2018-11-15', 2 , TRUE, 8.0),
 ('Pikachu', date '2021-01-07', 1 , FALSE, 15.04),
 ('Devimon', date '2017-05-12', 2 , TRUE, 11),
 ('Charmander', date '2020-02-08', 0 , FALSE, -11),
 ('Plantmon', date '2021-11-15', 2 , TRUE, -5.7),
 ('Squirtle', date '1993-04-02', 3 , FALSE, -12.13),
 ('Angemon', date '2005-06-12', 1 , TRUE, -45),
 ('Boarmon', date '2005-06-07', 7 , TRUE, 20.4),
 ('Blossom', date '1998-10-13', 3 , TRUE, 17),
 ('Ditto', date '2022-05-14', 4 , TRUE, 22);

INSERT INTO owners (full_name, age) VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

  INSERT INTO species (name) VALUES 
  ('Pokemon'),
  ('Digimon');

  -- Modify inserted animals so it includes the species_id value
  UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
  UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

-- Modify inserted animals to include owner information (owner_id)
  UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
  UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
  UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
  UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
  UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';

-- Insert data into vets table
  INSERT INTO vets (name, age, date_of_graduation) VALUES
  ('William Tatcher', 45, date '2000-04-23'),
  ('Maisy Smith', 26, date '2019-01-17'),
  ('Stephanie Mendez', 64, date '1981-05-04'),
  ('Jack Harkness', 38, date '2008-02-14');

-- Insert data for specialties
INSERT INTO specializations (species_id, vet_id)
VALUES(1, 1),
      (2, 3),
      (1, 3),
      (2, 4);


  -- Insert data for visits table
INSERT INTO visits (animal_id, vet_id, date_of_visit)
VALUES(1, 1, date '2020-05-24'),
      (1, 3, '2020-07-22'),
      (2, 4, '2021-02-02'),
      (5, 2, '2020-01-05'),
      (5, 2, '2020-03-08'),
      (5, 2, '2020-05-14'),
      (3, 3, '2021-05-04'),
      (10, 4, '2021-02-24'),
      (8, 2, '2019-12-21'),
      (8, 1, '2020-08-10'),
      (8, 2, '2021-04-07'),
      (11, 3, '2019-09-29'),
      (9, 4, '2020-10-03'),
      (9, 4, '2020-11-04'),
      (4, 2, '2019-01-24'),
      (4, 2, '2019-05-15'),
      (4, 2, '2020-02-27'),
      (4, 2, '2020-08-03'),
      (6, 3, '2020-05-24'),
      (6, 1, '2021-01-11');