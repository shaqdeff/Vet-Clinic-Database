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