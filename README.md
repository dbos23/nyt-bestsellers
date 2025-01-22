## New York Times Bestseller List Project

### Tools used
- dbt
- SQL
- Snowflake
- Alteryx

### Overview
This is a project I created to practice using dbt Cloud. The actual transformation of the data is simple. It's intended to demonstrate knowledge of dbt and understanding of best practices

The preparation for the project was done using Alteryx, Snowflake, and the [NYT Books API](https://developer.nytimes.com/docs/books-product/1/overview). To see how the data looked after the first API call, see the sample_data folder

### What I did in Alteryx to set up the project before the dbt portion

1. Pulled data from the NYT Books API. The data contained the top 15 books of the given week from the Combined Print & E-Book Fiction list
2. Loaded that data to Snowflake in two tables
3. Since the list updates weekly, I scheduled the workflow to run weekly on Alteryx Server

### What I did in dbt

1. Defined each raw table as a source
2. Implemented tests on the sources to ensure data quality
3. Checked for source freshness to ensure source tables were still being maintained
4. Configured the final model to materialize as a table, which would reduce the time needed to query it
5. Created staging models (as views to reduce storage used) with some simple transformations and pared down data
6. Joined the staging models to create a final table intended for downstream use
7. Created documentation to make my work easier to understand and maintain
8. Scheduled the dbt build command to run weekly the day after the API call, while also checking for source freshness
9. Adhered to dbt style conventions and best practices to organize my work and make it easier to follow