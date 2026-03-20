![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# How Tourism Shapes Dining: Insights from European Cities 
## Mini Project - SQL: From Data to Insight

Two data sources were used to complement restaurant data with tourism and economic insights. The data was normalized into a relational MySQL database, and analytical SQL queries were run, with findings visualized in a Jupyter Notebook report.


## Research Hypothesis

1. **Cities with higher annual tourist arrivals tend to have more reviews.**
2. **Capital cities typically feature restaurants with higher average TripAdvisor ratings.**
3. **Cities with a higher cost of living generally have restaurants with higher price levels.**

## Key Findings

- TO COMPLETE

## Database Schema

The 2 raw datasets are normalized into 3 tables
Two data sources were used to complement restaurant data with tourism and economic insights, allowing the analysis of relationships between tourist numbers, cost of living, and restaurant ratings and prices. 
The datasets were merged using city names.
1. City destinations and related tourism and economic data, such as the annual number of tourists and cost of living. 
2. Restaurant and city data including rating, ranking, price range, number of reviews.


![Database Schema](schema-image.png)

## Project Structure

```
sql_mini_project/
├── README.md
├── data-processing.ipynb          # ETL: load, clean, normalize, export CSVs
├── main.ipynb                     # Report: load query results, visualize findings
├── sql-scripts/
│   ├── create-schema.sql          # MySQL DDL (CREATE DATABASE, CREATE TABLE)
│   └── queries.sql                
├── data/
│   ├── raw/
│   │   └── TA_restaurants_curated.csv    # Kaggle dataset (125528 rows)
│   │   └── destinations.csv    # Kaggle dataset (210 rows)
│   ├── processed/
│   │   ├── cities.csv       # Lookup table: city id and name
│   │   ├── city_data.csv               # Lookup table: city id, annual tourists and cost of living
│   │   └── restaurants.csv         # Main table with foreign keys (125528 rows)
│   └── query-results/
│       ├── 1. xxx TO FILL OUT


```

## How to Reproduce

1. **Data processing** — Run `data-processing.ipynb` to clean the raw CSV and export the 3 normalized tables to `data/processed/`.

2. **Create the database** — Open `sql-scripts/create-schema.sql` in MySQL Workbench and execute it to create `tourism_project` with 3 tables.

3. **Import data** — Use MySQL Workbench's Table Data Import Wizard. Import in order:
   - `cities.csv` (no foreign keys)
   - `city_data.csv` (has foreign keys)
   - `restaurants.csv` (has foreign keys)

4. **Run queries** — Execute `sql-scripts/queries.sql` in MySQL Workbench. Export each result set to `data/query-results/`.

5. **View the report** — Run `main.ipynb` to load query results and generate all visualizations.

## Tools

- **Python** — Pandas, Matplotlib, Seaborn
- **MySQL** — MySQL Workbench
- **Jupyter Notebooks**

## Data Source

[TripAdvisor Restaurants Info for 31 Euro-Cities](https://www.kaggle.com/datasets/damienbeneschi/krakow-ta-restaurans-data-raw) (Kaggle)
[European Tour Destinations Dataset] (https://www.kaggle.com/datasets/faizadani/european-tour-destinations-dataset) (Kaggle)

## Presentation
[Mini Project - SQL: From Data to Insight - How Tourism Shapes Dining: Insights from European Cities] (https://docs.google.com/presentation/d/1gfHJ7QD8jrgsyCFFReLe7Hu3mmg9ij1qbg6ucXQvtHo/edit?usp=sharing)