SELECT count(*) from City; 
SELECT count(*) FROM City WHERE population > 7000000;
SELECT Name, Population, Region FROM Country WHERE Region='Caribbean'
ORDER BY Population DESC;

-- 1. Name of the place that has the third largest population in the Carribean Region
SELECT Name FROM Country WHERE Region='Caribbean' ORDER BY Population DESC LIMIT 1 OFFSET 2; 
-- Limit gives only one option and offset two skips the first two elements in the list to get
-- the third one

-- 2. List the name of two places which are least populated among the places which have at 
-- least 400,000 people.

SELECT Name, Population FROM Country WHERE Population > 400000 ORDER BY Population LIMIT 2;

SELECT * FROM Country WHERE HeadOfState LIKE '%bush%';
SELECT * FROM Country WHERE HeadOfState LIKE '%elisa%';
SELECT * FROM Country WHERE HeadOfState LIKE '%II%';

ALTER TABLE `Country` ADD FULLTEXT `HeadOfState` (`HeadOfState`);
SELECT * FROM Country WHERE MATCH (HeadOfState) AGAINST ('elisa');

-- Search for population in the last table where Name contains "US"
SELECT Population, Name FROM Country WHERE Name LIKE '%US%';

-- Search for records in the Country table where the head of state's name ends with "i" and the country name starts with a "U"
SELECT * FROM Country WHERE HeadOfState LIKE '%i' AND Name LIKE 'U%';



