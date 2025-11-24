#1.1 How many countries became independent in the twentieth century? 
SELECT * from Country;
SELECT * FROM Country WHERE IndepYear > 1900 && IndepYear <= 2000;
#The 20th century consists of the years from 1901 to 2000 (Looked up 20th Century and according to Google Gemini this is the time frame)  

#1.2 How many people in the world are expected to live for 75 years or more? 
SELECT * FROM Country WHERE LifeExpectancy >= 75.0; #countries over 75
SELECT SUM(Population) From Country; #6,078,749,450 (people in the world)
#Query to answer 1.2:
SELECT SUM(Population) AS "People living over 75 this year!" FROM Country WHERE LifeExpectancy >= 75.0; #982,470,200 people are living over 75

#1.3 List the 10 most populated countries in the world with their populations as a percentage of the world population.
#[Hint: You can first find the population for the world and then use it for percentage for countries, so something like: select Population/5000000000 from Country ....] 
SELECT Name, Population FROM Country order by population desc limit 10; #Listed top 10 countries in population in the world
SELECT SUM(Population) FROM Country; #6,078,749,450 (people in the world)
#Query to answer 1.3:
SELECT Name, Population/(SELECT SUM(Population) / 100 FROM Country) FROM Country ORDER BY Population DESC LIMIT 10;

#1.4 List the top 10 countries with the highest population density.
#[Hint: For population density, you can try something like: select Population/SurfaceArea from Country where....]
SELECT Name, SurfaceArea FROM Country ORDER BY Name; #See what SurfaceArea is like
SELECT Name, SurfaceArea FROM Country ORDER BY SurfaceArea DESC; #See Countries Listed by Size
#Query to answer 1.4:
SELECT Name, Population/SurfaceArea AS PopulationDensity FROM Country ORDER BY PopulationDensity DESC LIMIT 10;

#1.5 How many countries are there in each “Region”?
#Write a SQL query that produces a list of regions with a column for country counts
#for each region and order the count descending.
SELECT Name, Region FROM Country;
SELECT DISTINCT Region FROM Country; #used https://www.w3schools.com/sql/sql_distinct.asp to discover DISTINCT keyword
#DISTINCT keyword only selects values that are different or unique
SELECT count(*) AS CountryCount FROM Country;  
SELECT DISTINCT Region, count(*) AS CountryCount FROM Country GROUP BY Region; #using groupby because sql console told me to use it. ErrorCode: 1140
#Query answer to 1.5:
SELECT DISTINCT Region, count(*) AS CountryCount FROM Country GROUP BY Region ORDER BY CountryCount DESC;

#1.6 What countries have more than 10 languages represented? 
#Write a SQL query, using the "HAVING" clause, that produces the list of countries
#that have greater than 10 languages. Group by "CountryCode" 
#and order by language count descending. 
SELECT * FROM countrylanguage;
#Query to 1.6:
SELECT Country.Name, COUNT(countrylanguage.CountryCode) AS LanguageCount FROM Country 
JOIN countrylanguage ON Country.Code=countrylanguage.CountryCode
GROUP BY Country.Name
HAVING Count(countrylanguage.CountryCode)  > 10 #HAVING clause doesnt read AS keyword
ORDER BY LanguageCount DESC;







