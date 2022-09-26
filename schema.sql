/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE DATABASE vet_clinic;
alter table animals add species varchar(100);

CREATE TABLE animals (
ID  SERIAL PRIMARY KEY,
name varchar(100),
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal(10,2),
species_id int,
owner_id int
);

create table owners (
ID  SERIAL PRIMARY KEY,
full_name varchar(100),
age int
);

create table species (
ID  SERIAL PRIMARY KEY,
name varchar(100)
);

create table vets (
ID  SERIAL PRIMARY KEY,
name varchar(100),
age int,
date_of_graduation date
);

create table specializations (
    ID SERIAL PRIMARY KEY,
    species_id int,
    vet_id int,
    FOREIGN KEY (species_id) REFERENCES species(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

CREATE TABLE visits (
    ID SERIAL PRIMARY KEY,
    animal_id INT,
    vet_id INT,
    visit_date DATE,
    FOREIGN KEY (animal_id) REFERENCES animals(id),
    FOREIGN KEY (vet_id) REFERENCES vets(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

ALTER TABLE visits DROP CONSTRAINT visits_pkey;

ALTER TABLE visits ADD COLUMN id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY;

CREATE INDEX visits_animalsId_asc ON visits(animal_id ASC);
CREATE INDEX visits_vetsId_asc ON visits(vet_id ASC);
CREATE INDEX owners_email_asc ON owners(email ASC);


