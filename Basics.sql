/* Select Where Distinct Like */

SELECT * from movies;
SELECT title, industry from movies;   
SELECT * from movies where industry="Hollywood";   
SELECT * from movies where industry="Bollywood";
SELECT DISTINCT industry from movies;
SELECT * from movies where title LIKE '%THOR%';
SELECT * from movies where title LIKE '%America%';
SELECT COUNT(*) from movies where industry="Hollywood";
SELECT * FROM movies WHERE studio='';

/* Exercise */

SELECT title, release_year FROM movies WHERE studio = "Marvel Studios";
select * from movies where title like "%avengers%"
select release_year from movies where title = "The Godfather";
select distinct studio from movies where industry = "Bollywood"

/* BETWEEN, IN, ORDER BY, LIMIT, OFFSET */

SELECT * from movies where imdb_rating>9;
SELECT * from movies where imdb_rating>=6 and imdb_rating <=8;
	SELECT * from movies where imdb_rating BETWEEN 6 AND 8;
SELECT * from movies where release_year=2022 
	or release_year=2019 or release_year=2018;
SELECT * from movies where release_year IN (2018,2019,2022);
SELECT * from movies where imdb_rating IS NULL;
SELECT * from movies where imdb_rating IS NOT NULL;
SELECT * from movies WHERE industry = "bollywood" ORDER BY imdb_rating ASC;
SELECT * from movies WHERE industry = "bollywood" ORDER BY imdb_rating DESC LIMIT 5;
SELECT * from movies WHERE industry = "bollywood" ORDER BY imdb_rating DESC LIMIT 5 OFFSET 1;

/* Exercise */

select * from movies order by release_year desc
select * from movies where release_year = '2022'
select * from movies where release_year >2020 
select * from movies where release_year >2020 and imdb_rating >8
select * from movies where studio IN ('Marvel Studios','Hombale Films')
select * from movies where title like "%thor%" order by release_year
select * from movies where studio != "Marvel Studios"

/* Count Max Min Avg Groupby */

SELECT COUNT(*) from movies;
SELECT MAX(imdb_rating) from movies where industry="Bollywood";
SELECT MIN(imdb_rating) from movies where industry="Bollywood";
SELECT AVG(imdb_rating) from movies where studio="Marvel Studios";
SELECT ROUND(AVG(imdb_rating),2) from movies where studio="Marvel Studios";
SELECT MIN(imdb_rating) as min_rating, MAX(imdb_rating) as max_rating, ROUND(AVG(imdb_rating),2) as avg_rating
	FROM movies WHERE studio="Marvel Studios";
SELECT industry, count(industry) FROM movies GROUP BY industry;
SELECT industry, count(industry) as movie_count,avg(imdb_rating) as avg_rating FROM movies GROUP BY industry;    
SELECT studio, count(studio) as movies_count from movies WHERE studio != '' GROUP BY studio ORDER BY movies_count DESC;    
SELECT studio, count(studio) as cnt, round(avg(imdb_rating), 1) as avg_rating from movies WHERE studio != ''
		GROUP BY studio
        order by avg_rating DESC;

/* Exercise */

select count(*) from movies where release_year between 2015 and 2022
select min(release_year) as min_year,max(release_year) as max_year from movies
select release_year, count(*) from movies group by release_year order by release_year Desc   


/* Having Clause */

SELECT release_year, count(*) as movies_count FROM movies GROUP BY release_year HAVING movies_count>2 
ORDER BY movies_count DESC;

/* Calculated Columns If, Case, Year, Curyear */

SELECT name, birth_year, (YEAR(CURDATE())-birth_year) as age FROM actors;
SELECT *, (revenue-budget) as profit from financials;
SELECT movie_id, revenue, currency, unit, IF (currency='USD', revenue*77, revenue) as revenue_inr FROM financials;
select distinct unit From financials;
SELECT movie_id, revenue, currency, unit,
	CASE
	WHEN unit="Thousands" THEN revenue/1000
	WHEN unit="Billions" THEN revenue*1000
	ELSE revenue
	END as revenue_mln
	FROM financials
    
/* Exercise */

select * from financials
select *, 
    (revenue-budget) as profit, 
    (revenue-budget)*100/budget as profit_pct 
   from financials

