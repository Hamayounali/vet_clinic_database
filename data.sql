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

-- Insert data in vets table 
INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', 38, '2008-07-08');

-- Insert data in specialization table 
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets where species.name = 'Pokemon' AND vets.name = 'William Tatcher';
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets where species.name = 'Digimon' AND vets.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets where species.name = 'Pokemon' AND vets.name = 'Stephanie Mendez';
INSERT INTO specializations (species_id, vet_id) SELECT species.id, vets.id FROM species, vets where species.name = 'Digimon' AND vets.name = 'Jack Harkness';

-- Insert data into visits tables 
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-05-24' FROM animals, vets where animals.name = 'Agumon' AND vets.name = 'William Tatcher';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-07-22' FROM animals, vets where animals.name = 'Agumon' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2021-02-02' FROM animals, vets where animals.name = 'Gabumon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-01-05' FROM animals, vets where animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-03-08' FROM animals, vets where animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-05-14' FROM animals, vets where animals.name = 'Pikachu' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2021-05-04' FROM animals, vets where animals.name = 'Devimon' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2021-02-24' FROM animals, vets where animals.name = 'Charmander' AND vets.name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2019-12-21' FROM animals, vets where animals.name = 'Plantmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-08-10' FROM animals, vets where animals.name = 'Plantmon' AND vets.name = 'William Tatcher';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2021-04-07' FROM animals, vets where animals.name = 'Plantmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2019-09-29' FROM animals, vets where animals.name = 'Squirtle' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-10-03' FROM animals, vets where animals.name = 'Angemon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-11-04' FROM animals, vets where animals.name = 'Angemon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2019-01-24' FROM animals, vets where animals.name = 'Boarmon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2019-05-15' FROM animals, vets where animals.name = 'Angemon' AND vets.name = 'Jack Harkness';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-02-27' FROM animals, vets where animals.name = 'Angemon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-08-03' FROM animals, vets where animals.name = 'Angemon' AND vets.name = 'Maisy Smith';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2020-04-24' FROM animals, vets where animals.name = 'Blossom' AND vets.name = 'Stephanie Mendez';
INSERT INTO visits (animal_id, vet_id, visit_date) SELECT animals.id, vets.id, '2021-01-11' FROM animals, vets where animals.name = 'Blossom' AND vets.name = 'William Tatcher';
