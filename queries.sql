/*Queries that provide answers to the questions from all projects.*/

-- Find all animals whose name ends in "mon"
SELECT * FROM animals WHERE name LIKE '%mon';

-- List the name of all animals born between 2016 and 2019.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                -- 
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

-- List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name FROM animals WHERE neutered=TRUE AND escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

-- List name and escape attempts of animals that weigh more than 10.5kg.
SELECT name FROM animals WHERE weight_kg > 10.5;

-- Find all animals that are neutered.
SELECT * FROM animals WHERE neutered=TRUE;

-- Find all animals not named Gabumon.
SELECT * FROM animals WHERE name <> 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

-- Begin transaction.
BEGIN;

-- Update species column to unspecified.
UPDATE animals SET species = 'unspecified';

-- Verify changes.
SELECT * FROM animals;

-- Rollback changes made.
ROLLBACK;

-- Verify changes after rollback.
SELECT * FROM animals;

-- Set species column to digimon for all animals that have a name ending in mon.
-- Begin transaction.
BEGIN;

-- Update species column.
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';

-- Set species column to pokemon for all animals that don't have species already set.
UPDATE animals SET species = 'pokemon' WHERE species = '';

-- Commit transaction.
COMMIT;

-- Delete all records in the animals table.
-- Begin transaction.
BEGIN;

-- Delete records;
DELETE FROM animals;

-- Verify changes;
SELECT * FROM animals;

-- Rollback the transaction.
ROLLBACK;

-- Verify rollback changes;
SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction.
SAVEPOINT DELETE_DITTO;

-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint.
ROLLBACK TO DELETE_DITTO;

-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Commit transaction;
COMMIT;

-- How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT MAX(escape_attempts) FROM animals WHERE neutered = TRUE OR FALSE;

-- Who escapes the most, neutered or not neutered animals?
SELECT COUNT(escape_attempts) AS escape_count, neutered
FROM animals
GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT MIN(weight_kg), MAX(weight_kg), species
FROM animals
GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts), species
FROM animals
WHERE date_of_birth BETWEEN '01-01-1990' AND '12-31-2000'
GROUP BY species;