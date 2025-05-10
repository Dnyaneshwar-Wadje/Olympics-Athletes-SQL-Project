
create table athletes(
	Id int,
    Name varchar(200),
    Sex char(1),
    Age int,
    Height float,
    Weight float,
    Team varchar(200),
    NOC char(3),
    Games varchar(200),
    Year int,
    Season varchar(200),
    City varchar(200),
    Sport varchar(200),
    Event varchar(200),
    Medal Varchar(50));

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Cleaned.csv"
into table athletes
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from athletes;

-- Q1. Show how many medal counts present for entire data.

SELECT COUNT(medal) from athletes;
SELECT COUNT(medal)
FROM athletes
WHERE MEDAL NOT IN("NoMedal");

-- Q2. Show count of unique Sports are present in olympics.

SELECT COUNT(DISTINCT(sport)) 
FROM athletes; 

-- Q3. Show how many different medals won by Team India in data.

SELECT COUNT(DISTINCT(medal))
FROM athletes 
WHERE team="india" AND medal NOT IN("NOMEDAL");

/* Q4. Show event wise medals won by india show from highest to 
lowest medals won in order. */

SELECT event,COUNT(medal)as medals_won_by_india 
FROM athletes 
WHERE MEDAL NOT IN("NOMEDAL")
GROUP BY event 
ORDER BY medals_won_by_india DESC;

-- Q5. Show event and yearwise medals won by india in order of year.

SELECT event,year,COUNT(medal)as medals_won_by_india
FROM athletes
WHERE MEDAL NOT IN("NOMEDAL")
GROUP BY event,year
ORDER BY Year; 

-- Q6. Show the country with maximum medals won gold, silver, bronze

SELECT team,count(medal)as total_medal
FROM athletes
where medal NOT IN("nomedal")
GROUP BY team 
ORDER BY total_medal DESC
LIMIT 1;

-- Q7. Show the top 10 countries with respect to gold medals

SELECT team,COUNT(medal)AS gold_medal
FROM athletes
WHERE medal IN("gold")
GROUP BY team
ORDER BY gold_medal DESC
LIMIT 10;

-- Q8. Show in which year did United States won most medals

SELECT team,year,COUNT(medal)AS total_medal
FROM athletes
WHERE team="United States" AND medal NOT IN("nomedal")
GROUP BY team,year
ORDER BY total_medal DESC
LIMIT 1;

-- Q9. In which sports United States has most medals

SELECT team,sport,COUNT(medal)AS total_medal
FROM athletes
WHERE team="United States" AND medal NOT IN("nomedal")
GROUP BY team,sport
ORDER BY total_medal DESC
LIMIT 1;

-- Q10. Find top 3 players who have won most medals along with their sports and country

SELECT name,sport,team, COUNT(medal)AS total_medal
FROM athletes
WHERE medal NOT IN("nomedal")
GROUP BY name,sport,team
ORDER BY total_medal DESC
LIMIT 3;

-- Q11. Find player with most gold medals in cycling along with his country.

SELECT name,sport,team,COUNT(medal) as total_count
FROM athletes
WHERE sport="cycling" AND medal="gold" 
GROUP BY name,sport,team
ORDER BY total_count DESC
LIMIT 1;


-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.

SELECT name,sport,team,COUNT(medal) as total_count
FROM athletes
WHERE sport="Basketball" AND medal  IN ("gold","silver","bronze") 
GROUP BY name,sport,team
ORDER BY total_count DESC
LIMIT 1;

-- Q13. Find out the count of different medals of the top basketball player.

SELECT name,medal,sport,COUNT(medal) as total_count
FROM athletes
WHERE name="Teresa Edwards" 
GROUP BY name,medal,sport
ORDER BY total_count DESC;

-- Q14. Find out medals won by male, female each year.

SELECT year,sex,count(medal) as total_medal
FROM athletes
WHERE medal NOT IN("nomedal")
GROUP BY year,sex
ORDER BY year ;





