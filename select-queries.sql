-- This file contains 10 examples of SELECT statements to demonstrate SQL querying capabilities.
-- Retrieve all columns from the dataset for the first 10 rows.
select
    *
from
    heartdisease
limit
    10;

-- Retrieve all records where the patient has heart disease.
select
    *
from
    heartdisease
where
    target = 1;