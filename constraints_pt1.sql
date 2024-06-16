-- This file contains 10 SQL queries demonstrating the use of constraints to filter and retrieve specific data from tables.

-- Showing all columns for reference.
SELECT *
FROM heartdisease;

-- 1. Find the patient with an age of 50.
select * from heartdisease
where age IN(50);