/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;
alter table animals add species varchar(100);

CREATE TABLE animals (
ID int,
name varchar(100),
date_of_birth date,
escape_attempts int,
neutered boolean,
weight_kg decimal(10,2),
species varchar(100)
);
