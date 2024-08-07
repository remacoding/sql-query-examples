-- SQL Lesson 4: Filtering and sorting Query results
-- This file contains 10 SQL queries demonstrating the use of filtering and sorting to retrieve specific data FROM tables.
-- Querying all columns for reference data.
SELECT *
FROM heartdisease;

-- 1. List all unique chest pain types without duplicates.
SELECT DISTINCT `chest pain type`
FROM heartdisease
ORDER BY `chest pain type` ASC;

-- 2. List the last four patients (by age) who have a maximum heart rate greater than 150, ORDERed FROM oldest to youngest.
SELECT *
FROM heartdisease
WHERE `max heart rate` > 150
ORDER BY age DESC
LIMIT 4;

-- 3. List the first five patients (by cholesterol level) sorted alphabetical.
SELECT *
FROM heartdisease
ORDER BY cholesterol
LIMIT 5;

-- 4. List the next five patients sorted alphabetically by cholesterol, starting FROM the sixth patient.
SELECT *
FROM heartdisease
ORDER BY cholesterol 
LIMIT 5 OFFSET 5;

-- 5. List all distinct ages of patients who have a maximum heart rate greater than 150, ORDERed FROM lowest to highest.
SELECT DISTINCT age
FROM heartdisease
WHERE `max heart rate` > 150
ORDER BY age;

-- 6. Find the top three patients with the highest resting blood pressure, along with their cholesterol levels, ORDERed by resting blood pressure in descending ORDER.
SELECT `resting bp s`,
    cholesterol
FROM heartdisease
ORDER BY `resting bp s` DESC
LIMIT 3;

-- 7. Retrieve the distinct exercise-induced angina status values and their corresponding counts, sorted by the counts in descending ORDER.
SELECT DISTINCT (`exercise angina`),
    COUNT(`exercise angina`) exercise_angina_count
FROM heartdisease
GROUP BY `exercise angina`
ORDER BY COUNT(`exercise angina`) desc;

-- 8. Identify the top 10 patients with the highest maximum heart rate, who have an oldpeak value greater than 1.0 and are male, filtering out those with a cholesterol level below 200.
SELECT * FROM heartdisease
WHERE oldpeak > 1 AND sex = 1 AND cholesterol > 200
ORDER BY `max heart rate`desc
LIMIT 10;

-- 9. Find the top 5 patients with the highest cholesterol levels who do not have exercise-induced angina and have a maximum heart rate greater than 150.
SELECT *
FROM heartdisease
WHERE `exercise angina` = 0
    AND `max heart rate` > 150
ORDER BY cholesterol DESC
LIMIT 5;

-- 10. Identify the age group with the highest average oldpeak value among patients with chest pain type 4 and who are diagnosed with heart disease.
SELECT avg(oldpeak) AS avg_oldpeak FROM heartdisease
WHERE `chest pain type` = 4 AND TARGET = 1
GROUP BY age ORDER BY avg_oldpeak DESC
LIMIT 1;