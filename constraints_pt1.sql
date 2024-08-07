-- SQL Lesson 2: Queries with constraints (Pt. 1)
-- This file contains 10 SQL queries demonstrating the use of constraints to filter and retrieve specific data FROM tables.
-- Querying all columns for reference data.
SELECT *
FROM heartdisease;

-- 1. Find patients with an age of 50.
SELECT *
FROM heartdisease
WHERE age IN (50);

-- 2. Find patients with cholesterol levels between 200 and 300.
SELECT *
FROM heartdisease
WHERE cholesterol BETWEEN 200 and 300;

-- 3. Find patients with cholesterol levels not between 200 and 300.
SELECT *
FROM heartdisease
WHERE cholesterol NOT BETWEEN 200 and 300;

-- 4. Find the first 5 patients with the lowest resting blood pressure and their cholesterol levels.
SELECT `resting bp s`,
    cholesterol
FROM heartdisease
ORDER BY `resting bp s` ASC
LIMIT 5;

-- 5. Find the average cholesterol level for patients older than 60 and having heart disease.
SELECT AVG(cholesterol)
FROM heartdisease
WHERE age > 60
    and TARGET = 1;

-- 6. Find patients with a resting blood pressure less than 120 and a maximum heart rate greater than 150.
SELECT *
FROM heartdisease
WHERE `resting bp s` < 120
    and `max heart rate` > 150;

-- 7. Find the count of patients grouped by their chest pain type who have a fasting blood sugar level of 1.
SELECT COUNT(*) as total_count
FROM heartdisease
WHERE `fasting blood sugar` = 1
GROUP BY `chest pain type`;

-- 8. Find the youngest patient with a resting blood pressure greater than 140 and a cholesterol level over 250.
SELECT MIN(age)
FROM heartdisease
WHERE `resting bp s` > 140
    and cholesterol > 250;

-- 9. Find the average age, maximum heart rate, and cholesterol level for each sex, where patients have a resting ECG result of 2.
SELECT sex,
    AVG(age) AS average_age,
    MAX(`max heart rate`) as max_heart_rate,
    AVG(cholesterol) as avg_cholesterol
FROM heartdisease
WHERE `resting ecg` = 2
GROUP BY sex;

-- 10. Find the average age, maximum heart rate, and cholesterol level for patients with heart disease, grouped by chest pain type, and having a resting blood pressure greater than 130.
SELECT `chest pain type`,
    AVG(age) AS average_age,
    MAX(`max heart rate`) as max_heart_rate,
    AVG(cholesterol) as avg_cholesterol
FROM heartdisease
WHERE TARGET = 1
    and `resting bp s` > 130
GROUP BY `chest pain type`
ORDER BY `chest pain type`;