-- This file contains 10 examples of SELECT statements to demonstrate SQL querying capabilities.

-- Showing all columns for reference.
SELECT * FROM heartdisease;

-- 1. Retrieve all columns from the dataset for the first 10 rows.
SELECT *
FROM heartdisease
LIMIT 10;

-- 2. Retrieve all records where the patient has heart disease.
SELECT *
FROM heartdisease
WHERE target = 1;

-- 3. Retrieve patient information sorted by age in descending order.
SELECT *
FROM heartdisease
ORDER BY age DESC;

-- 4. Calculate the average age of patients in the dataset.
SELECT AVG(age) AS average_age
FROM heartdisease;

-- 5. Retrieve the age and gender of each patient.
SELECT age, sex AS gender
FROM heartdisease;

-- 6. Retrieve the cholesterol level and resting blood pressure of each patient.
SELECT cholesterol, `resting bp s` AS resting_blood_pressure
FROM heartdisease;

-- 7. Retrieve the average cholesterol level for patients with heart disease.
SELECT AVG(cholesterol) AS avg_heartdisease_cholesterol
FROM heartdisease
WHERE target = 1;

-- 8. Retrieve the age, sex, and chest pain type of patients with heart disease.
SELECT age, sex, `chest pain type`
FROM heartdisease
WHERE target = 1;

-- 9. Retrieve the age, resting blood pressure, and fasting blood sugar level for patients with heart disease, ordered by age in descending order.
SELECT age, `resting bp s`, `fasting blood sugar`
FROM heartdisease
WHERE target = 1
ORDER BY age DESC;

-- 10. Retrieve the age, sex, and ST slope for patients with heart disease, ordered by ST slope.
SELECT age, sex, `ST slope`
FROM heartdisease
WHERE target = 1
ORDER BY `ST slope`;
