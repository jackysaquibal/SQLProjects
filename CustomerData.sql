/*
    Name: Jacqueline Saquibal
    Data and Database Managment with SQL
*/

--------------------------------------------------------------------------------
/*				                 Table Creation		  		                  */
--------------------------------------------------------------------------------
/* Created the table customer_spending with appropriate data types, making sure to 
accommodate to the full range of values from the csv. */

CREATE TABLE customer_spending(
sale_date date,
sale_year char(4),
sale_month varchar(9),
age int,
gender char(1),
country varchar(50),
state varchar(25),
category varchar(25),
sub_category varchar(50),
quantity int,
unit_cost numeric,
unit_price numeric,
cost bigint,
revenue bigint
);

--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Import Data           		  		          */
--------------------------------------------------------------------------------
/* Used the COPY statement to import data from csv. */

COPY customer_spending
FROM '/Users/customer_spending (5).csv'
WITH (FORMAT CSV,HEADER);

/* Ran a basic SELECT statement to verify the data is present and matches with what 
is in the csv file. */

SELECT * FROM customer_spending;

--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
/*				                 Question 1: 		  		                  */
--------------------------------------------------------------------------------
/* Queried each category and the corresponding total revenue for that
category for the sale year 2016, sorted in alphabetically. */

SELECT category, SUM(revenue) FROM customer_spending 
WHERE sale_year = '2016'
GROUP BY category
ORDER BY category;

--------------------------------------------------------------------------------
/*				                  Question 2           		  		          */
--------------------------------------------------------------------------------
/* Queried a list of sub categories and their corresponding average unit price, 
average unit cost, as well as the difference between these two values (new column
aliased as 'margin')  for the sale year of 2015. The list is sorted alphabetically. */

SELECT sub_category, AVG(unit_price), AVG(unit_cost), AVG(unit_price) - AVG(unit_cost) AS margin 
FROM customer_spending
WHERE sale_year = '2015'
GROUP BY sub_category
ORDER BY sub_category;

--------------------------------------------------------------------------------
/*				                  Question 3           		  		          */
--------------------------------------------------------------------------------
/* Queried a list of all female buyers from the clothing category.*/

SELECT COUNT(gender) FROM customer_spending
WHERE gender = 'F' AND category = 'Clothing';
   
--------------------------------------------------------------------------------
/*				                  Question 4           		  		          */
--------------------------------------------------------------------------------
/* Queried the age, sub_category, average quantitiy, and average cost columns.
Grouped by age and sub_category to show more insight to customer spending patterns.
Ordered the list by oldest to youngest age, and by sub_category alphabetically. */

SELECT age, sub_category, AVG(quantity) AS avg_quantity, AVG(cost) AS avg_cost FROM customer_spending 
GROUP BY age, sub_category
ORDER BY age DESC, sub_category;

--------------------------------------------------------------------------------
/*				                  Question 5           		  		          */
--------------------------------------------------------------------------------
/* Queried a list of countries where more than 30 transactions were made by people 
within the age range of 18 - 25. */

SELECT country FROM customer_spending
WHERE age >= 18 AND age <= 25
GROUP BY country
HAVING COUNT(quantity) > 30;
    
--------------------------------------------------------------------------------
/*				                  Question 6           		  		          */
--------------------------------------------------------------------------------
/* Queried a list of sub categories and added columns of average quanitity and 
average cost, aliased as avg_quantity and avg_cost respectively. These column values
were rounded to 2. Only included sub categories that had at least 10 records within
the data set. Organized the sub_category column alphabetically. */

SELECT sub_category, ROUND(AVG(quantity),2) AS avg_quantity, ROUND(AVG(cost),2) AS avg_cost FROM customer_spending
GROUP BY sub_category
HAVING COUNT(sub_category) >= 10
ORDER BY sub_category;

--------------------------------------------------------------------------------
/*				                  Question 7           		  		          */
--------------------------------------------------------------------------------
/* Queried a list of sub categories with their respective total
quantity and total revenue from male buyers in the year 2016. */

SELECT sub_category, SUM(quantity), SUM(revenue) FROM customer_spending 
WHERE gender = 'M' AND sale_year = '2016'
GROUP BY sub_category;

--------------------------------------------------------------------------------
/*				                  Question 8           		  		          */
--------------------------------------------------------------------------------
/* Queried a list of countries along with their respective total revenue generated
from sales, sorted alphabetically. */

SELECT country, SUM(revenue) FROM customer_spending 
GROUP BY country
ORDER BY country;

--------------------------------------------------------------------------------
/*				                  Question 9           		  		          */
--------------------------------------------------------------------------------
/* Queried a list to determine the highest unit cost, lowest unit cost, and average
unit cost for each gender in each category. */

SELECT gender, category, MAX(unit_cost) AS high_cost, MIN(unit_cost) AS low_cost, AVG(unit_cost) AS avg_cost
FROM customer_spending
GROUP BY gender, category
ORDER BY category, gender;

--------------------------------------------------------------------------------
/*				                  Question 10           		  	          */
--------------------------------------------------------------------------------
/* Queried the country that has the highest average revenue. */

SELECT country, AVG(revenue) AS high_sales FROM customer_spending
GROUP BY country
ORDER BY high_sales DESC
LIMIT 1;
