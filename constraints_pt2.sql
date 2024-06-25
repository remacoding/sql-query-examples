-- This file contains 10 SQL queries demonstrating the use of constraints to filter and retrieve specific data from tables.

-- Querying all columns for reference data.
SELECT
    *
from
    heartdisease;

-- 1. Retrieve patients with an age of 40 and resting blood pressure exactly equal to 140.
SELECT
    *
from
    heartdisease
where
    age = 40
    and `resting bp s` = 140;

-- 2. Find patients with fasting blood sugar levels exactly equal to 0 and normal resting ECG result.
select
    *
from
    heartdisease
where
    `fasting blood sugar` = 0
    and `resting ecg` = 0;

-- 3. Identify patients with atypical angina and cholesterol levels between 200 and 300.
SELECT
    *
FROM
    heartdisease
where
    `chest pain type` = 2
    and cholesterol BETWEEN 200 and 300;

-- 4. Calculate the average age of patients with heart disease and exercise-induced angina.
SELECT
    ROUND(AVG(age), 1)
from
    heartdisease
where
    target = 1
    and `exercise angina` = 1;

-- 5. Retrieve patients who have maximum heart rate achieved greater than 150 and oldpeak less than or equal to 1.0.
SELECT
    *
FROM
    heartdisease
where
    `max heart rate` > 150
    and oldpeak <= 1.0;

-- 6. Find patients with asymptomatic chest pain and a resting blood pressure between 120 and 140.
SELECT
    *
FROM
    heartdisease
where
    `chest pain type` = 4
    and `resting bp s` BETWEEN 120 and 140;

-- 7. Identify patients with a flat ST slope and normal fasting blood sugars.
SELECT
    *
from
    heartdisease
where
    `ST slope` = 2
    and `fasting blood sugar` = 0;

-- 8. Calculate the percentage of patients with heart disease and resting blood pressure less than 140.
SELECT
    (
        COUNT(*) * 100.0 / (
            SELECT
                COUNT(*)
            FROM
                heartdisease
        )
    ) AS total_percentage
FROM
    heartdisease
WHERE
    target = 1
    AND `resting bp s` < 140;

-- 9. Retrieve patients who are female and have cholesterol levels greater than 250.
SELECT
    *
from
    heartdisease
where
    sex = 0
    and cholesterol > 250;

-- 10. Find patients with non-anginal chest pain and age between 40 and 50.
SELECT
    *
from
    heartdisease
where
    `chest pain type` = 3
    and age BETWEEN 40 and 50;