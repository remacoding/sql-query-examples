-- This file contains 10 SQL queries demonstrating the use of filtering and sorting to retrieve specific data from tables.
-- Querying all columns for reference data.
SELECT *
FROM heartdisease;

-- 1. List all unique chest pain types without duplicates.
select distinct `chest pain type`
from heartdisease
order by `chest pain type` asc;

-- 2. List the last four patients (by age) who have a maximum heart rate greater than 150, ordered from oldest to youngest.
select *
from heartdisease
where `max heart rate` > 150
order by age DESC
limit 4;

-- 3. List the first five patients (by cholesterol level) sorted alphabetical.
select *
from heartdisease
order by cholesterol
limit 5;

-- 4. List the next five patients sorted alphabetically by cholesterol, starting from the sixth patient.
select *
from heartdisease
order by cholesterol 
limit 5 OFFSET 5;

-- 5. List all distinct ages of patients who have a maximum heart rate greater than 150, ordered from lowest to highest.
select DISTINCT age
from heartdisease
where `max heart rate` > 150
order by age;

-- 6. Find the top three patients with the highest resting blood pressure, along with their cholesterol levels, ordered by resting blood pressure in descending order.
select `resting bp s`,
    cholesterol
from heartdisease
ORDER BY `resting bp s` DESC
LIMIT 3;

-- 7. Retrieve the distinct exercise-induced angina status values and their corresponding counts, sorted by the counts in descending order.
select DISTINCT (`exercise angina`),
    COUNT(`exercise angina`) exercise_angina_count
FROM heartdisease
GROUP BY `exercise angina`
ORDER BY COUNT(`exercise angina`) desc;

-- 8. Identify the top 10 patients with the highest maximum heart rate, who have an oldpeak value greater than 1.0 and are male, filtering out those with a cholesterol level below 200.
select * from heartdisease
where oldpeak > 1 and sex = 1 and cholesterol > 200
order by `max heart rate`desc
limit 10;

-- 9. Find the top 5 patients with the highest cholesterol levels who do not have exercise-induced angina and have a maximum heart rate greater than 150.
select *
from heartdisease
where `exercise angina` = 0
    and `max heart rate` > 150
ORDER BY cholesterol DESC
Limit 5;

-- 10. Identify the age group with the highest average oldpeak value among patients with chest pain type 4 and who are diagnosed with heart disease.
select avg(oldpeak) as avg_oldpeak from heartdisease
where `chest pain type` = 4 and target = 1
GROUP BY age ORDER BY avg_oldpeak DESC
LIMIT 1;