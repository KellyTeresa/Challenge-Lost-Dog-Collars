# YOUR SQL CODE GOES HERE

-- 1. For which collars can we identify an owner?
SELECT lost_dog_collars.dog_name AS collar, dog_owners.name AS owner, dog_owners.id AS owner_id
FROM lost_dog_collars
JOIN dog_owners
ON (lost_dog_collars.dog_name = dog_owners.dog_name)
ORDER BY collar;

-- collar  |  owner  | owner_id
-- ---------+---------+----------
-- Boogie  | Evan    |        2
-- Bronson | Omid    |        1
-- Gilly   | Whitney |        3
-- Lilly   | Spencer |        4
-- Linux   | Dan     |        6
-- (5 rows)

-- owner_id included to distinguish between Dans


-- 2. For which collars is there no known owner?
SELECT lost_dog_collars.dog_name AS collar, dog_owners.name AS unknown_owner
FROM dog_owners
RIGHT OUTER JOIN lost_dog_collars
ON (lost_dog_collars.dog_name = dog_owners.dog_name)
WHERE dog_owners.name IS NULL
ORDER BY collar;

-- collar | unknown_owner
-- --------+---------------
-- Fido   |
-- Goose  |
-- Lassie |
-- (3 rows)


-- 3. We need to see all collars, with an owner, if one matches.
SELECT lost_dog_collars.dog_name AS collar, dog_owners.name AS owner
FROM lost_dog_collars
LEFT OUTER JOIN  dog_owners
ON (lost_dog_collars.dog_name = dog_owners.dog_name)
ORDER BY collar;

-- collar  |  owner
-- ---------+---------
-- Boogie  | Evan
-- Bronson | Omid
-- Fido    |
-- Gilly   | Whitney
-- Goose   |
-- Lassie  |
-- Lilly   | Spencer
-- Linux   | Dan
-- (8 rows)


-- 4. We need to see all owners, with collars in the Lost and Found, if one matches.
SELECT dog_owners.id AS owner_id, dog_owners.name AS owner,  lost_dog_collars.dog_name AS collar
FROM lost_dog_collars
RIGHT OUTER JOIN  dog_owners
ON (lost_dog_collars.dog_name = dog_owners.dog_name)
ORDER BY owner_id;

-- owner_id |  owner  | collar
-- ----------+---------+---------
--        1 | Omid    | Bronson
--        2 | Evan    | Boogie
--        3 | Whitney | Gilly
--        4 | Spencer | Lilly
--        5 | Dan     |
--        6 | Dan     | Linux
-- (6 rows)
