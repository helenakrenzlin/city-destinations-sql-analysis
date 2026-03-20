CREATE DATABASE tourism_project;
USE tourism_project;

CREATE TABLE cities (
 city_id INT PRIMARY KEY, 
name VARCHAR(255));


CREATE TABLE city_data (
    city_id INT PRIMARY KEY,
    annual_tourists INT,
    cost_of_living VARCHAR(255),
    FOREIGN KEY (city_id) REFERENCES cities(city_id));

CREATE TABLE restaurants (
	restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    ranking FLOAT,
    rating FLOAT,
    price_range FLOAT,
    number_of_reviews INT, FOREIGN KEY (city_id) REFERENCES cities(city_id));
    
   

DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS city_data;
DROP TABLE IF EXISTS cities;


SELECT * FROM city_data;
SELECT * FROM restaurants;
SELECT * FROM cities;