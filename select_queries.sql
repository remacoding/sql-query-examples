-- This file contains various examples of SELECT statements to demonstrate SQL querying capabilities.

select * from heartdisease;

select age, sex from heartdisease
where age > 1 order by sex asc
;