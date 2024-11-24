SELECT * FROM crime_scene_report
WHERE city = 'SQL City'
AND date LIKE '201801%'
AND type = 'murder';

SELECT * FROM person
WHERE address_street_name LIKE 'northwestern%'
order by address_number desc
limit 1;

SELECT * FROM person
WHERE address_street_name LIKE 'franklin%'
AND name LIKE 'ann%'
order by address_number desc
;

SELECT * FROM interview
WHERE person_id IN(14887,16371)
;

SELECT * FROM get_fit_now_member
WHERE id LIKE '48Z%'
AND membership_status = 'gold';

SELECT * FROM get_fit_now_check_in
WHERE membership_id IN ('48Z7A', '48Z55');

SELECT * FROM drivers_license
WHERE plate_number LIKE '%H42W%';

SELECT * 
FROM person p
JOIN drivers_license d
on p.license_id = d.id
JOIN get_fit_now_member m
ON p.id = m.person_id
JOIN get_fit_now_check_in c
ON c.membership_id = m.id
WHERE d.plate_number LIKE '%H42W%'
AND m.id LIKE '48Z%'
AND m.membership_status = 'gold'
AND membership_id IN ('48Z7A', '48Z55');

/* 67318	Jeremy Bowers */

---------------------------------------

SELECT * FROM drivers_license d
JOIN person p 
ON p.license_id = d.id
WHERE d.car_make = 'Tesla'
AND d.car_model = 'Model S'
AND d.gender = 'female'
AND d.hair_color = 'red';

SELECT person_id, count(*) as count 
FROM facebook_event_checkin
WHERE date LIKE '201712%'
AND event_name LIKE '%SQL%'
GROUP BY person_id
HAVING count = 3;

---------------------------------------

with drivers as (
  SELECT * FROM drivers_license d
  JOIN person p 
  ON p.license_id = d.id
  WHERE d.car_make = 'Tesla'
  AND d.car_model = 'Model S'
  AND d.gender = 'female'
  AND d.hair_color = 'red'
)
, concert as (
  SELECT person_id, count(*) as count 
  FROM facebook_event_checkin
  WHERE date LIKE '201712%'
  AND event_name LIKE '%SQL%'
  GROUP BY person_id
  HAVING count = 3
)

SELECT * FROM person p
JOIN concert c
ON p.id = c.person_id
JOIN drivers d
ON p.license_id = d.id
;

/* 99716	Miranda Priestly */

---------------------------------------