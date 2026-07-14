-- Netflix Data Analysis using SQL
-- Solutions of 16 business problems
-- 1. Count the number of Movies vs TV Shows

SELECT 
	type,
	COUNT(*)
FROM netflix
GROUP BY 1

-- 2. Find the most common rating for movies and TV shows

WITH RatingCounts AS (
    SELECT 
        type,
        rating,
        COUNT(*) AS rating_count
    FROM netflix
    GROUP BY type, rating
),
RankedRatings AS (
    SELECT 
        type,
        rating,
        rating_count,
        RANK() OVER (PARTITION BY type ORDER BY rating_count DESC) AS rank
    FROM RatingCounts
)
SELECT 
    type,
    rating AS most_frequent_rating
FROM RankedRatings
WHERE rank = 1;



-- 3. Find the top 5 countries with the most content on Netflix

SELECT * 
FROM
(
	SELECT 
		-- country,
		UNNEST(STRING_TO_ARRAY(country, ',')) as country,
		COUNT(*) as total_content
	FROM netflix
	GROUP BY 1
)as t1
WHERE country IS NOT NULL
ORDER BY total_content DESC
LIMIT 5





-- 4. Find content added in the last 5 years
SELECT
*
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'






-- 5. List all TV shows with more than 5 seasons

SELECT *
FROM netflix
WHERE 
	TYPE = 'TV Show'
	AND
	SPLIT_PART(duration, ' ', 1)::INT > 5


-- 6. Count the number of content items in each genre

SELECT 
	UNNEST(STRING_TO_ARRAY(listed_in, ',')) as genre,
	COUNT(*) as total_content
FROM netflix
GROUP BY 1








-- 7. Find the top 10 actors who have appeared in the highest number of movies produced in India.



SELECT 
	UNNEST(STRING_TO_ARRAY(casts, ',')) as actor,
	COUNT(*)
FROM netflix
WHERE country = 'India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10

/*
Question 8:
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.
*/


SELECT 
    category,
	TYPE,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2



	

-- 9.Which countries contribute the highest percentage of Netflix's total content library??

SELECT
    country,
    COUNT(*) AS total_titles,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
        2
    ) AS contribution
FROM Netflix
WHERE country IS NOT NULL
GROUP BY country
ORDER BY contribution DESC;




-- 10.How has the Movies vs TV Shows ratio changed over the years?


SELECT RELEASE_YEAR, 
SUM(CASE WHEN TYPE='Movie' THEN  1  ELSE 0 END),
SUM(CASE WHEN TYPE='TV Show' THEN 1 ELSE 0 END),
 ROUND(
        SUM(CASE WHEN TYPE = 'Movie' THEN 1 ELSE 0 END) * 1.0 /
        NULLIF(SUM(CASE WHEN TYPE = 'TV Show' THEN 1 ELSE 0 END), 0),
        2
    ) AS RATIO
FROM NETFLIX	
GROUP BY RELEASE_YEAR
ORDER BY RELEASE_YEAR DESC;





--11.Identify the Top 10 directors by total content and calculate their contribution to the platform.


SELECT DIRECTOR,
	COUNT(*) AS TOTAL_COUNT,
	ROUND(
	COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),
	2
	) AS CONTRIBUTION
FROM NETFLIX
WHERE DIRECTOR IS NOT NULL
GROUP BY DIRECTOR
ORDER BY TOTAL_COUNT DESC
LIMIT 10;




-- 12.Which directors successfully created both Movies and TV Shows?



SELECT DIRECTOR ,
COUNT(DISTINCT TYPE) AS FORMAT
FROM NETFLIX
WHERE DIRECTOR IS NOT NULL
GROUP BY DIRECTOR
HAVING COUNT(DISTINCT TYPE)=2
ORDER BY DIRECTOR DESC;





--13.Calculate the gap between consecutive releases for every director to identify highly active creators.

SELECT DIRECTOR,
		RELEASE_YEAR,
			RELEASE_YEAR-LAG(RELEASE_YEAR) OVER
			(
			PARTITION BY DIRECTOR ORDER BY RELEASE_YEAR 
			) AS gap_year
FROM NETFLIX
WHERE DIRECTOR IS NOT  NULL;




--14.Identify the Top 3 newest titles in every country.

SELECT
    TITLE,COUNTRY,RELEASE_YEAR,
    newest
FROM
(
    SELECT
        title,
        country,
        release_year,
        ROW_NUMBER() OVER (
            PARTITION BY country
            ORDER BY release_year DESC
        ) AS newest
    FROM Netflix
) T
WHERE newest <= 3;




--15.Which genre dominates each country?

SELECT
    country,
    listed_in,
    total_count
FROM
(
    SELECT
        country,
        listed_in,
        total_count,
       ROW_NUMBER() OVER(PARTITION BY COUNTRY ORDER BY TOTAL_COUNT DESC  )AS rn
    FROM
    (
        SELECT
            country,
            listed_in,
            COUNT(*) AS TOTAL_COUNT
        FROM Netflix
		WHERE COUNTRY IS NOT  NULL
        GROUP BY LISTED_IN,COUNTRY
    ) t1
) t2
WHERE RN<=1
ORDER BY COUNTRY



	

--16.Which content rating dominates every country?
	
SELECT
    COUNTRY,
    RATING,
    TOTAL_COUNT
FROM
(
    SELECT
        COUNTRY,
   		 RATING,
    	TOTAL_COUNT,
        RANK() OVER(
            PARTITION BY COUNTRY
            ORDER BY TOTAL_COUNT DESC
        ) AS rn
    FROM
    (
        SELECT
            COUNTRY,
            RATING,
            COUNT(*) AS TOTAL_COUNT
        FROM NETFLIX
        WHERE COUNTRY IS NOT NULL
        GROUP BY COUNTRY, RATING
    ) t1
) t2
WHERE rn = 1
ORDER BY COUNTRY;





-- End of reports

