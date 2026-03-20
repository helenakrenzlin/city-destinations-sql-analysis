
SELECT * FROM city_data;
SELECT * FROM restaurants;
SELECT * FROM cities;

-- 1. Turn off the safety brake
SET SQL_SAFE_UPDATES = 0;

-- 2. Delete the row (this will work now)
DELETE FROM cities WHERE name IS NULL;

-- 3. Turn the safety brake back on
SET SQL_SAFE_UPDATES = 1;

-- HYPOTHESIS 1: Cities with higher annual tourist arrivals tend to have more reviews.
SELECT 
    c.name AS city,
    cd.annual_tourists,
    SUM(r.number_of_reviews) AS total_reviews
FROM cities c
JOIN city_data cd ON c.city_id = cd.city_id
JOIN restaurants r ON r.city_id = cd.city_id
GROUP BY c.city_id, c.name, cd.annual_tourists
ORDER BY cd.annual_tourists DESC;


-- Calculate annual tourists by city
SELECT c.name AS city, cd.annual_tourists
FROM cities c
JOIN city_data cd ON c.city_id = cd.city_id
ORDER BY cd.annual_tourists DESC 
LIMIT 10; 

-- Calculate number of reviews by city 
SELECT c.name AS city, SUM(r.number_of_reviews) AS total_reviews
FROM cities AS c 
JOIN restaurants AS r on r.city_id = c.city_id
GROUP by c.city_id, c.name
ORDER BY total_reviews DESC
LIMIT 10;

-- HYPOTHESIS 1: Cities with higher annual tourist arrivals tend to have more reviews.
SELECT 
    c.name AS city,
    cd.annual_tourists,
    SUM(r.number_of_reviews) AS total_reviews
FROM cities c
JOIN city_data cd ON c.city_id = cd.city_id
JOIN restaurants r ON r.city_id = cd.city_id
GROUP BY c.city_id, c.name, cd.annual_tourists
ORDER BY cd.annual_tourists DESC;

-- HYPOTHESIS 2: Cities with a higher cost of living generally have restaurants with higher price levels.
SELECT c.name AS city, cd.cost_of_living, ROUND(AVG(r.price_range),1) AS avg_price_range
FROM cities c
JOIN city_data cd ON c.city_id = cd.city_id
JOIN restaurants r ON r.city_id = cd.city_id
GROUP BY c.city_id, c.name, cd.cost_of_living
ORDER BY cd.cost_of_living DESC;

-- EXTRA (OPTIONAL)
-- HYPOTHESIS 1: Tourist Arrivals vs. Total Review Volume
SELECT 
    c.name AS city,
    cd.annual_tourists,
    stats.total_reviews,
    stats.avg_rating -- Added this just for extra insight!
FROM cities c
JOIN city_data cd ON c.city_id = cd.city_id
JOIN (
    -- This subquery pre-calculates the totals for each city
    SELECT city_id, 
           SUM(number_of_reviews) AS total_reviews,
           AVG(rating) AS avg_rating
    FROM restaurants
    GROUP BY city_id
) AS stats ON c.city_id = stats.city_id
ORDER BY cd.annual_tourists DESC;


-- HYPOTHESIS 1 (Refined): Does more tourists = more reviews per person?
SELECT 
    c.name AS city,
    cd.annual_tourists,
    SUM(r.number_of_reviews) AS total_reviews,
    -- This calculates how many reviews exist for every 1,000 tourists
    ROUND((SUM(r.number_of_reviews) / cd.annual_tourists) * 1000, 2) AS reviews_per_1k_tourists
FROM cities c
JOIN city_data cd ON c.city_id = cd.city_id
JOIN restaurants r ON r.city_id = c.city_id
GROUP BY c.city_id, c.name, cd.annual_tourists
-- We order by intensity to see the "punchiest" food cities
ORDER BY reviews_per_1k_tourists DESC;

