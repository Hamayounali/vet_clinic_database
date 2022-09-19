/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    ID int,
    name varchar(100),
    date_of_birth date,
    escape_attempts int (10),
    neutered boolean,
    weight_kg decimal (10,2)
);
