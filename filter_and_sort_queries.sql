-- This file contains 10 SQL queries demonstrating the use of filtering and sorting to retrieve specific data from tables.

-- Querying all columns for reference data.
SELECT
    *
FROM
    heartdisease;

-- 1. List all unique chest pain types without duplicates.
select distinct `chest pain type` from heartdisease
order by `chest pain type` asc;

-- 2. List the last four patients (by age) who have a maximum heart rate greater than 150, ordered from oldest to youngest.
select * from heartdisease
where `max heart rate` > 150
order by age DESC
limit 4;

-- 3. List the first five patients (by cholesterol level) sorted alphabetical.
select * from heartdisease
order by cholesterol
limit 5;

-- 4. List the next five patients sorted alphabetically by cholesterol, starting from the sixth patient.
select * from heartdisease
order by cholesterol
offset 5 limit 5;

-- 5. List all distinct ages of patients who have a maximum heart rate greater than 150, ordered from lowest to highest.
select DISTINCT(age) from heartdisease
where `max heart rate` > 150
order by age;

-- 6. Find the top three patients with the highest resting blood pressure, along with their cholesterol levels, ordered by resting blood pressure in descending order.

-- 7. Retrieve the distinct exercise-induced angina status values and their corresponding counts, sorted by the counts in descending order.

-- 8. Calculate the percentage of patients diagnosed with heart disease who have a resting blood pressure less than 140. Group the results by age groups (e.g., 30-39, 40-49, etc.).

-- 9. Find the top 5 patients with the highest cholesterol levels who do not have exercise-induced angina and have a maximum heart rate greater than 150.

-- 10. Identify the age group with the highest average oldpeak value among patients with chest pain type 4 and who are diagnosed with heart disease.