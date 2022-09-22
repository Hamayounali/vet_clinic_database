/* Populate database with sample data. */

insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','2020-02-03',0,true,10.23);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','2018-11-15',2,true,8);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu','2021-01-07',1,false,15.04);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','2017-05-12',5,true,11);


insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander','2020-02-08',0,false,-11);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6,'Plantmon','2021-11-15',2,true,-5.7);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7,'Squirtle','1993-04-02',3,false,-12.13);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8,'Angemon','2005-06-12',1,true,-45);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9,'Boarmon','2005-06-07',7,true,20.4);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10,'Boarmon','1998-10-13',3,true,17);
insert into animals (ID,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (11,'Ditto','2022-05-14',4,true,14);


insert into owners(full_name, age) values ('Sam Smith', 34);
insert into owners(full_name, age) values ('Jennifer Orwell', 19);
insert into owners(full_name, age) values ('Bob', 45);
insert into owners(full_name, age) values ('Melody Pond', 77);
insert into owners(full_name, age) values ('Dean Winchester', 14);
insert into owners(full_name, age) values ('Jodie Whittaker', 38);

insert into species(name) values ('Pokemon');
insert into species(name) values ('Digimon');

update animals set species_id = 1 where name like '%mon';
update animals set species_id = 2 where name not like '%mon';

update animals set owner_id = 1 where name = 'Agumon';
update animals set owner_id = 2 where name = 'Pikachu';
update animals set owner_id = 3 where name = 'Plantmon' or name = 'Devimon';
update animals set owner_id = 4 where name = 'Charmander' or name = 'Squirtle' or name = 'Blossom';
update animals set owner_id = 5 where name = 'Angemon' or name = 'Boarmon';


