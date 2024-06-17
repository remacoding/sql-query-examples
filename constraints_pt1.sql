-- This file contains 10 SQL queries demonstrating the use of constraints to filter and retrieve specific data from tables.

-- Querying all columns for reference data.
SELECT
    *
FROM
    heartdisease;

-- 1. Find the patient with an age of 50.
select
    *
from
    heartdisease
where
    age IN (50);

-- 2. Find patients with cholesterol levels between 200 and 300.
select
    *
from
    heartdisease
where
    cholesterol BETWEEN 200 AND 300;

-- 3. Find patients with cholesterol levels not between 200 and 300.
select
    *
from
    heartdisease
WHERE
    cholesterol NOT BETWEEN 200 and 300;

-- 4. Find the first 5 patients with the lowest resting blood pressure and their cholesterol levels.
select
    `resting bp s`,
    cholesterol
from
    heartdisease
ORDER BY
    `resting bp s` ASC
LIMIT
    5;

-- 5. Find the average cholesterol level for patients older than 60 and having heart disease.
select
    AVG(cholesterol)
FROM
    heartdisease
WHERE
    age > 60
    AND target = 1;

-- 6. Find patients with a resting blood pressure less than 120 and a maximum heart rate greater than 150.
select
    *
from
    heartdisease
where
    `resting bp s` < 120
    and `max heart rate` > 150;

-- 7. Find the count of patients grouped by their chest pain type who have a fasting blood sugar level of 1.

-- 8. Find the youngest patient with a resting blood pressure greater than 140 and a cholesterol level over 250.
select
    MIN(age)
from
    heartdisease
where
    `resting bp s` > 140
    and cholesterol > 250;