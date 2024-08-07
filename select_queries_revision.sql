-- SQL Review: Simple SELECT Queries
-- This file contains 15 SQL queries for revision of SELECT queries, constraints, and filter and sort queries.
-- Querying all columns for reference data.
SELECT *
FROM heartdisease;

-- 1. Find the age group with the highest average oldpeak value among patients with chest pain type 4 and who are diagnosed with heart disease.
SELECT age_group,
    AVG(oldpeak) AS avg_oldpeak
FROM (
        SELECT CASE
                WHEN age BETWEEN 20 AND 30 THEN '20-30'
                WHEN age BETWEEN 30 AND 40 THEN '30-40'
                WHEN age BETWEEN 40 AND 50 THEN '40-50'
                WHEN age BETWEEN 50 AND 60 THEN '50-60'
                WHEN age BETWEEN 60 AND 70 THEN '60-70'
                WHEN age > 70 THEN 'Above 70'
            END AS age_group,
            oldpeak
        FROM heartdisease
        WHERE `chest pain type` = 4
            AND target = 1
    ) AS age_group_oldpeak
GROUP BY age_group
ORDER BY avg_oldpeak DESC
LIMIT 1;

-- 2. Find the top 5 patients with the highest cholesterol levels who do not have exercise-induced angina and have a maximum heart rate greater than 150, then retrieve their age, cholesterol level, and maximum heart rate, ordered by maximum heart rate in descending order.
SELECT age,
    cholesterol,
    `max heart rate`
FROM heartdisease
WHERE `exercise angina` = 0
    and `max heart rate` > 150
ORDER BY `max heart rate` DESC
LIMIT 5;

-- 3. -- Retrieve the top 10 patients with the highest maximum heart rate who have an oldpeak value greater than 1.0 and are male.
SELECT age,
    cholesterol,
    `max heart rate`,
    oldpeak
FROM heartdisease
WHERE oldpeak > 1.0
    AND sex = 1
ORDER BY `max heart rate` DESC
LIMIT 10;

-- 4. List the distinct exercise-induced angina status values and their corresponding counts, but only include those with a resting blood pressure less than 140. Order the results by the counts in descending order.
SELECT DISTINCT(`exercise angina`),
    COUNT(`exercise angina`) as exercise_angina_count
from heartdisease
WHERE `resting bp s` < 140
GROUP BY `exercise angina`
ORDER BY exercise_angina_count DESC;

-- 5. Retrieve the first 5 patients (by age) who have a maximum heart rate greater than 150, ordered from oldest to youngest, and include their cholesterol levels and oldpeak values.
SELECT age,
    cholesterol,
    oldpeak
FROM heartdisease
WHERE `max heart rate` > 150
ORDER BY age DESC
LIMIT 5;

-- 6. Calculate the percentage of patients with heart disease who have a fasting blood sugar level of 1.
SELECT 
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM heartdisease WHERE target = 1) AS percentage_with_fasting_blood_sugar_1
FROM heartdisease
WHERE target = 1
    AND `fasting blood sugar` = 1;

-- 7. Find the average cholesterol level for patients with heart disease who have a resting ECG result of 2, and list these results grouped by sex.
SELECT sex,
    AVG(cholesterol) as avg_cholesterol
FROM heartdisease
WHERE target = 1
    AND `resting ecg` = 2
GROUP BY sex;

-- 8. Retrieve the youngest patient with a resting blood pressure greater than 140 and a cholesterol level over 250, and include their age, cholesterol level, and resting blood pressure.
SELECT age,
    cholesterol,
    `resting bp s` as "resting blood pressure"
FROM heartdisease
WHERE `resting bp s` > 140
    AND cholesterol > 250
ORDER BY age
LIMIT 1;

-- 9. Find the average age, maximum heart rate, and cholesterol level for each chest pain type, where patients have a resting blood pressure greater than 130. Then, sort the results by chest pain type in ascending order.
SELECT `chest pain type`,
    AVG(age) AS avg_age,
    MAX(`max heart rate`) AS max_heart_rate,
    AVG(cholesterol) AS avg_cholesterol
FROM heartdisease
WHERE `resting bp s` > 130
GROUP BY `chest pain type`
ORDER BY `chest pain type` ASC;

-- 10. List all unique chest pain types for patients who have a maximum heart rate greater than 150 and a cholesterol level between 200 and 300. Order the results alphabetically by chest pain type.
SELECT DISTINCT `chest pain type`
FROM heartdisease
WHERE `max heart rate` > 150
    AND cholesterol BETWEEN 200 and 300
ORDER BY `chest pain type` ASC;

-- 11. Retrieve patients who are female and have cholesterol levels greater than 250, then calculate the average resting blood pressure and maximum heart rate for these patients.
SELECT ROUND(AVG(`resting bp s`), 0),
    ROUND(AVG(`max heart rate`), 0)
FROM heartdisease
WHERE sex = 0
    and cholesterol > 250;

-- 12. Find patients with atypical angina and cholesterol levels between 200 and 300. Retrieve their age, maximum heart rate, and exercise-induced angina status.
SELECT age,
    `max heart rate`,
    `exercise angina`
FROM heartdisease
WHERE `chest pain type` = 2
    and cholesterol BETWEEN 200 and 300;

-- 13. Calculate the average cholesterol level for patients older than 60 who have heart disease, and list this average by sex.
SELECT sex,
    AVG(cholesterol)
FROM heartdisease
WHERE age > 60
    and target = 1
GROUP BY sex;

-- 14. Find the first 10 patients with the lowest resting blood pressure and their cholesterol levels. Retrieve their ages.
SELECT `resting bp s` as "resting blood pressure", cholesterol, age FROM heartdisease
ORDER BY `resting bp s` ASC
LIMIT  10;

-- 15. Retrieve patients who have a maximum heart rate achieved greater than 150 and oldpeak less than or equal to 1.0. Sort the results by age in ascending order and include their sex and chest pain type.
SELECT age, sex as "gender", `chest pain type`, `max heart rate`, oldpeak FROM heartdisease
WHERE `max heart rate` > 150 and oldpeak <= 1
ORDER BY age ASC;