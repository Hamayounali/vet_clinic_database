/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between "2016-01-01" and "2019-01-01";
select name from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name = "Agumon" or name = "Pikachu";
select name, escape_attempts from animals where weight_kg >10.5;
select * from animals where neutered = true;
select * from animals where name != "Gabumon";
select * from animals where weight_kg between 10.4 and 17.3 or weight_kg = 10.4 or weight_kg = 17.3;


vet_clinic=# BEGIN TRANSACTION;
BEGIN
vet_clinic=*# delete from animals where date_of_birth > '2022-01-01';
DELETE 1
vet_clinic=*# SAVEPOINT del;
SAVEPOINT
vet_clinic=*# update animals set weight_kg = weight_kg * -1;
UPDATE 10
vet_clinic=*# ROLLBACK TO del;
ROLLBACK
vet_clinic=*# update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
UPDATE 4
vet_clinic=*# COMMIT TRANSACTION;
COMMIT

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select name, escape_attempts from animals where escape_attempts =(select max(escape_attempts) from animals);
select species, max(weight_kg), min(weight_kg) from animals GROUP BY species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-01' and '2000-01-01' GROUP BY species;

-- joins
-- What animals belong to Melody Pond?
select name from animals inner join owners on animals.owner_id = owners.id where full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
select animals.name from animals INNER JOIN species on animals.species_id=species.id where species.name='Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
select animals.name, owners.full_name from animals right JOIN owners on animals.owner_id=owners.id;

-- How many animals are there per species?
select species.name, count(animals.name) as numbers from animals inner JOIN species on animals.species_id=species.id group by species.name;

-- List all Digimon owned by Jennifer Orwell.
select animals.name from animals inner join owners on animals.owner_id=owners.id where owners.full_name = 'Jennifer Orwell';

--List all animals owned by Dean Winchester that haven't tried to escape.
select animals.name from animals inner join owners on animals.owner_id=owners.id where owners.full_name = 'Dean Winchester' and animals.escape_attempts = 0;

-- Who owns the most animals?
select full_name, count(full_name) from animals inner join owners on animals.owner_id=owners.id group by full_name;



-- Who was the last animal seen by William Tatcher?
SELECT animals.name FROM animals INNER JOIN visits ON animal_id = animals.id WHERE vet_id=1 ORDER BY visits.visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(*) FROM species INNER JOIN specializations ON specializations.species_id = species.id WHERE vet_id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT species.name, vets.name FROM species INNER JOIN specializations ON specializations.species_id = species.id 
RIGHT JOIN vets ON specializations.vet_id = vets.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals INNER JOIN visits ON visits.animal_id = animals.id 
INNER JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(*) as total FROM animals INNER JOIN visits ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY total DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name, visits.visit_date FROM animals INNER JOIN visits ON visits.animal_id = animals.id INNER JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.visit_date ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name as Animals_Name, Vets.name as Vets_Name, visits.visit_date FROM animals INNER JOIN visits ON visits.animal_id = animals.id INNER JOIN vets ON visits.vet_id = vets.id ORDER BY visits.visit_date DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits WHERE vet_id = ( SELECT vets.id FROM vets left JOIN specializations ON vets.id = specializations.vet_id WHERE species_id IS NULL);

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(species.name) as total FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith'GROUP BY species.name ORDER BY total DESC LIMIT 1;