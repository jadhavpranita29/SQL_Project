CREATE DATABASE SupplyChinFinanceManagement;
USE SupplyChinFinanceManagement;

/** 1. dim_customer Table **/

CREATE TABLE dim_customer (
customer_code INT,
customer VARCHAR(150),
platform VARCHAR(45),
channel VARCHAR(45),
market VARCHAR(45),
sub_zone VARCHAR(45),
region VARCHAR(45)
);

INSERT INTO dim_customer (customer_code, customer, platform, channel, market, sub_zone, region)
VALUES 
('70020104', 'Atliq e Store', 'E-Commerce', 'Direct', 'Austria', 'NE', 'EU'),
('70021096', 'Atliq e Store', 'E-Commerce', 'Direct', 'United Kimgdom', 'NE', 'EU'),
('70022084', 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'USA', 'NA', 'NA'),
('70022085', 'Atliq e Store', 'E-Commerce', 'Direct', 'USAS', 'NA', 'NA'),
('70023031', 'Atliq Exclusive', 'Brick & Mortar', 'Direct',' Canada', 'NA', 'NA'),
('70023032', 'Atliq e Store ', 'E-Commerce', 'Direct', 'Canada', 'NA', 'NA'),
('70025206', 'Atliq e Store', 'E-Commerce', 'Direct', 'Mixico', 'LATAM', 'LATAM'),
('70027208', 'Atliq e Store', 'E-Commerce', 'Direct', 'Brazil', 'LATAM', 'LATAM'),
('80001019', 'Neptune', 'Brick & Mortar', 'Distributor', 'China', 'ROA', 'APAC'),
('80006154', 'Synthetic', 'Brick & Mortar', 'Distributor', 'Philiphines', 'ROA', 'APAC'),
('80006155', 'Novua', 'Bricl & Mortar', 'Distributor', 'Philiphines', 'ROA', 'APAC');

select * from dim_customer;


/** 2. dim_product table **/


create table dim_product (
product_code VARCHAR(45),
division VARCHAR(45),
segment VARCHAR (45),
category VARCHAR (45),
product VARCHAR(45),
variant VARCHAR(45)
);


INSERT INTO dim_product (product_code, division, segment, category, product, variant)
values
('A1919150403', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito', 'Plus 2'),
('A1920150404', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito', 'Premium'),
('A2020150501', 'P & A', 'Peripherals', 'Mother Board', 'AQ MB Lito 2', 'Standard'),
('A2020150502', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Plua 1'),
('A2021150503', 'P & A', 'Peripherals', 'MotherBoard','AQ MB Lito 2', 'Plus 2'),
('A2021150504', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Premium'),
('A2118150101', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'standard'),
('A2118150102', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Standard 2'),
('A2118150103', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Plus 1'),
('A2118150104', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Plus 2'),
('A2118150105', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Premium 1');

select * from dim_product;

/** 3. fact_forecast_Monthly **/


create table fact_forecast_monthly(
date DATE,
fiscal_year INT,
product_code VARCHAR(45),
customer_code INT,
forecast_quantity INT,
dim_customer_customer_code INT,
dim_product_product_code VARCHAR(45)
);

INSERT INTO fact_forecast_monthly (date, fiscal_year, product_code, customer_code, forecast_quantity)
Values
('2017-09-01', '2018', 'A0118150101', '70002017', '18'),
('2017-09-01', '2018', 'A0118150101', '70002018', '11'),
('2017-09-01', '2018', 'A0118150101', '70003181',  '9'),
('2017-09-01', '2018', 'A0118150101', '70003182', '6'),
('2017-09-01', '2018', 'A0118150101', '70006157', '5'),
('2017-09-01', '2018', 'A0118150101', '70006158', '6'),
('2017-09-01', '2018', 'A0118150101', '70007198', '4'),
('2017-09-01', '2018', 'A0118150101', '70007199', '7'),
('2017-09-01', '2018', 'A0118150101', '70008169', '7'),
('2017-09-01', '2018', 'A0118150101', '70008170', '8'),
('2017-09-01', '2018', 'A0118150101', '70011193', '5');

select * from fact_forecast_monthly;


/** 4.fact_freight_cost **/

create table fact_freight_cost (
market VARCHAR(45),
fiscal_year INT,
freight_pct DECIMAL(5,4),
other_cost_pct DECIMAL(5,4)
);

INSERT INTO fact_freight_cost (market, fiscal_year, freight_pct, other_cost_pct)
VALUES
('Germany', '2020', '0.0226', '0.0060'),
('Germany', '2020', '0.0226', '0.0060'),
('Germany', '2020', '0.0226', '0.0060'),
('India', '2018', '0.0244', '0.0026'),
('India', '2019', '0.0219', '0.0057'),
('India' , '2020', '0.0309', '0.0029'),
('India' ,'2021', '0.0309', '0.0029'),
('India', '2022', '0.0309', '0.0029'),
('Indonesia', '2018', '0.0190', '0.0042'),
('Indonesia', '2019', '0.0187', '0.0052'),
('Indinesia', '2020', '0.0195', '0.0023');

select * from fact_freight_cost;

/**  5. fact_gross_price  **/

create table fact_gross_price (
product_code VARCHAR(45),
fiscal_year INT,
gross_price DECIMAL(15, 4),
dim_product_product_code VARCHAR(45),
);

INSERT INTO fact_gross_price (product_code, fiscal_year, gross_price)
VALUES
('A0118150101', '2018', '15.3952'),
('A0118150101', '2019', '14.4392'),
('A0118150101', '2020', '16.2323'),
('A0118150101', '2021', '19.0573'),
('A0118150101', '2018', '19.5875'),
('A0118150101', '2019', '18.5595'),
('A0118150101', '2020', '19.8577'),
('A0118150101', '2021', '21.4565'),
('A0118150101', '2018', '19.3630'),
('A0118150101', '2019', '19.3442'),
('A0118150101', '2020', '22.1317');


select * from fact_gross_price;


/**  6. fact_manufacturing_cost  **/


create table fact_manufacturing_cost (
product_code VARCHAR(45),
cost_year INT,
manufacturing_cost DECIMAL(15, 4)
);

INSERT INTO fact_manufacturing_cost (product_code, cost_year, manufacturing_cost)
values
('A0118150101', '2018', '4.61990'),
('A0118150101', '2019', '4.2033'),
('A0118150101', '2020', '5.0207'),
('A0118150101', '2021', '5.5172'),
('A0118150102', '2018', '5.6036'),
('A0118150102', '2019', '5.3235'),
('A0118150102', '2020', '5.7180'),
('A0118150102', '2021', '6.2835'),
('A0118150103', '2018', '5.9469'),
('A0118150103', '2019', '5.5306'),
('A0118150103', '2020', '6.3264');

select * from fact_manufacturing_cost;


/** 7. fact_post_invoice_deductions  **/


create table fact_post_invoice_deductions (
customer_code INT,
product_code VARCHAR(45),
date DATE,
discounts_pct DECIMAL(5,4),
other_deeuctions_pct DECIMAL(5,4)
);

INSERT INTO fact_post_invoice_deductions (customer_code, product_code, date, discounts_pct, other_deeuctions_pct)
values
('70002017', 'A0118150101', '2017-09-01', '0.2660', '0.0719'),
('70002017', 'A0118150101', '2017-10-01', '0.3090', '0.0976'),
('70002017', 'A0118150101', '2017-11-01', '0.3313', '0.0752'),
('70002017', 'A0118150101', '2018-01-01', '0.2958', '0.0720'),
('70002017', 'A0118150101', '2018-02-02', '0.3208', '0.0793'),
('70002017', 'A0118150101', '2018-03-01', '0.2635', '0.01007'),
('70002017', 'A0118150101', '2018-05-01', '0.2231', '0.0820'),
('70002017', 'A0118150101', '2018-06-01', '0.3020', '0.0791'),
('70002017', 'A0118150101', '2018-07-01', '0.3123', '0.00929'),
('70002017', 'A0118150101', '2018-09-01', '0.1530', '0.1288'),
('70002017', 'A0118150101' ,'2018-10-01', '0.1363', '0.1542');


select * from fact_post_invoice_deductions;


/**  8. fact_pre_invoice_deductions  **/


create table fact_pre_invoice_deductions (
customer_code INT,
fiscal_year INT,
pre_invoice_discount_pct DECIMAL(5,4)
);

INSERT INTO fact_pre_invoice_deductions (customer_code, fiscal_year, pre_invoice_discount_pct)
values
('70002017', '2018', '0.0824'),
('70002017', '2019', '0.0777'),
('70002017', '2020', '0.0735'),
('70002017', '2021', '0.0703'),
('70002017', '2022', '0.1057'),
('70002018', '2018', '0.2956'),
('70002018', '2019', '0.2577'),
('70002018', '2020', '0.2255'),
('70002018', '2921', '0.2061'),
('70002018', '2022', '0.2931'),
('70003181', '2018', '0.0536');

select * from fact_pre_invoice_deductions;


/** 9. fact_sales_monthly  **/

create table fact_sales_monthly (
date DATE,
product_code VARCHAR(45),
customer_code INT,
sold_quantity INT,
dim_customer_customer_code INT,
fact_post_invoice_deductions_customer_code INT,
fact_post_invoice_deductions_product_code VARCHAR(45),
fact_post_invoice_deductions_date DATE,
fact_pre_invoice_deductions_customer_code INT,
fact_pre_invoice_deductions_fidcal_year INT,
);


INSERT INTO fact_sales_monthly (date, product_code, customer_code, sold_quantity)
values
('2017-09-01', 'A0118150101', '70002017', '51'),
('2017-09-01', 'A0118150101', '70002018', '77'),
('2017-09-01', 'A0118150101', '70003181', '17'),
('2017-09-01', 'A0118150101', '70003182', '6'),
('2017-09-01', 'A0118150101', '70006157', '5'),
('2017-09-01', 'A0118150101', '70006158', '7'),
('2017-09-01', 'A0118150101', '70007198', '29'),
('2017-09-01', 'A0118150101', '70007199', '34'),
('2017-09-01', 'A0118150101', '70008169', '22'),
('2017-09-01', 'A0118150101', '70008170', '5'),
('2017-09-01', 'A0118150101', '70011193', '10');


select * from fact_sales_monthly;


/**   Task  **/

/** Q1)  Define a user-defined function to calculate the total forecasted quantiy for a given product and fiscal year. **/


SELECT total_quantity = SUM(forecast_quantity)
FROM fact_forecast_monthly
WHERE product_code = product_code and fiscal_year = fiscal_year;


/**  Q2)  Write a query to find the customer who made purchses exceeding the average monthly sales
          quantity across all product. **/

WITH average_monthly_sales AS (
SELECT AVG(sold_quantity) AS average_quantity
FROM fact_sales_monthly
),
customer_purchases AS (
SELECT customer_code, SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
GROUP BY customer_code
)
SELECT customer_code, total_quantity
FROM customer_purchases
JOIN average_monthly_sales ON 1 = 1
WHERE total_quantity > average_quantity;


/**  Q3)  Create a stored procedure to update the gross price of a product 
          for a specific fiscal year. **/

CREATE PROCEDURE update_gross_price
@product_code VARCHAR(50),
@fiscal_year INT, 
@new_gross_price DECIMAL(10,2)
AS
BEGIN
UPDATE fact_gross_price
SET gross_price = @new_gross_price
WHERE product_code = @product_code AND fiscal_year = @fiscal_year;
END;


/**  Q4) Implement a trigger that automatically insert a record into the audit log table whenever 
         a new entry is added to the sales table. **/


CREATE TRIGGER trg_sales_insert
EXECUTE FUNCTION log_sales_insert();


CREATE FUNCTION log_new_sale()
RETURNS TRIGGER AS $$
BEGIN
INSERT INTO fact_sales_monthly (sold_quantity ,product_code)
VALUES (NEW.sold_quantity, 'INSERT');
RETURN NEW;
END;


/**  Q5)  Use a window function to rank products based on their monthly
           sales qunatity, partitioned by fiscal year. **/

SELECT @fiscal_year, @product_code
DATE_TRUNC('month', sale_date) AS sale_month,
SUM(sold_quantity) As fact_sales_momthly,
RANK() OVER (
PARTITION BY fiscal_year, DATE_TRUNC('month', sale_date)
ORDER BY SUM(quantity) DESC
) AS monthly_rank
FROM fact_sales_monthly
GROUP BY fiscal_year, product_id, DATE_TRUNC('month', sale_date)
ORDER BY fiscal_year, sale_month, monthly_rank;


/** Q6)  Utilize the SRTING_AGG function to concatenate the names of all 
         customer who purchased a specific product within a given timeframe. **/


SELECT @product_code,
STRING_AGG(customer_code, ', ') AS customers
FROM fect_forecast_monthly
WHERE sale_date BETWEEN '2025-01-01' AND '2025-03-31'
AND product-id = 101
GROUP BY product_id;


/**  Q7)  Develop a user-defined function that calcualtes the total manufacturing cost
          for a product over a specified range of years, using a subquery to retrieve 
		  the necessary data. **/

CREATE FUNCTION get_total_manufacturing_cost (
@product_id INT,
@start_year INT ,
@end_year int
)
RETURNS DECIMAL(12,2)
AS 
BEGIN
DECLARE @total_cost_DECIMAL(12,2);
SELECT @total_cost = SUM(cost)
FROM (
SELECT cost
FROM fact_manufacturing_cost
WHERE product_id = @product_id
AND year BETWEEN @start_year AND @end_year
) AS sub;
RETURN ISNULL(@total_cost, 0);
END;

/**  Q9)  Apply the LEAD or LAG function to compare monthly sales quantities 
          of a product with the previous month's sales. **/
SELECT
    product_code,
    DATE_TRUNC('month', sale_date) AS sale_month,
    SUM(sold_quantity) AS monthly_sales,
    LAG(SUM(sold_quantity)) OVER (
        PARTITION BY product_id
        ORDER BY DATE_TRUNC('month', sale_date)
    ) AS previous_month_sales,
    SUM(sold_quantity) - LAG(SUM(sold_quantity)) OVER (
        PARTITION BY product_id
        ORDER BY DATE_TRUNC('month', sale_date)
    ) AS sales_difference
FROM fact_sales_monthly
GROUP BY product_code, DATE_TRUNC('month', sale_date)
ORDER BY product_code, sale_month;


/** Q10)  Create a query to identify the top-selling products in 
          each market based on their total sales quantity, utilizing 
          subqueries and window functions. **/
SELECT
    market,
    product_code,
    sold_quantity,
    rank_in_market
FROM (
    SELECT
        market,
        product_code,
        SUM(sold_quantity) AS total_quantity,
        RANK() OVER (
            PARTITION BY market_id
            ORDER BY SUM(quantity_sold) DESC
        ) AS rank_in_market
    FROM fact_forecast_monthly
    GROUP BY market, product_code
) ranked_sales
WHERE rank_in_market = 1
ORDER BY market;


/** Q12)  Write a trigger that automatically updates the 
          inventory count in the product table whenever a new sale is 
          recorded, utilizing inbuilt functions to perform the 
          calculation. **/

CREATE TRIGGER trg_update_inventory
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION update_inventory_after_sale();

/** Q13)  Implement a trigger to enforce referential integrity, 
          ensuring that only products listed in the product table can be 
          added to the sales table, utilizing subqueries to validate the 
          data. **/

CREATE  FUNCTION enforce_product_exists()
RETURNS TRIGGER AS $$
DECLARE
    product_exists BOOLEAN;
BEGIN
   
    SELECT EXISTS (
        SELECT 1 FROM product WHERE product_id = NEW.product_id
    ) INTO product_exists;

   
    IF NOT product_exists THEN
        RAISE EXCEPTION 'Product ID % does not exist in the product table', NEW.product_id;
    END IF;

    RETURN NEW;
END;


/** Q15)  Develop a user-defined function to calculate the 
          average discount percentage given to customers for a 
          specific product, utilizing inbuilt functions to aggregate and 
          analyze the data. **/

CREATE OR REPLACE FUNCTION get_avg_discount(p_product_id INT)
RETURNS NUMERIC(5,2) AS $$
DECLARE
    avg_discount NUMERIC(5,2);
BEGIN
    SELECT ROUND(AVG(discount_percentage), 2)
    INTO avg_discount
    FROM fact_forecast_monthly
    WHERE product_id = p_product_id;

    RETURN COALESCE(avg_discount, 0);
END;


/**  Q16)  Write a query to identify the customers who made the 
           highest total purchases in each region, using subqueries and 
           window functions to perform the analysis. **/

SELECT
    region,
    customer_id,
    total_purchases
FROM (
    SELECT
        region,
        customer_id,
        SUM(purchase_amount) AS total_purchases,
        RANK() OVER (
            PARTITION BY region
            ORDER BY SUM(purchase_amount) DESC
        ) AS purchase_rank
    FROM fact_sales_monthly
    GROUP BY region, customer_id
) ranked_customers
WHERE purchase_rank = 1
ORDER BY region; 


/**  Q17)  Create a stored procedure to calculate the total revenue 
           generated from sales for a given period, using inbuilt 
           functions to handle date manipulation and aggregation. **/

CREATE  PROCEDURE calculate_total_revenue(
    p_start_date DATE,
    p_end_date DATE,
    OUT total_revenue NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COALESCE(SUM(revenue), 0)
    INTO total_revenue
    FROM fact_forecast_monthly
    WHERE sale_date BETWEEN p_start_date AND p_end_date;
END;


/**  Q19)  Develop a trigger to identify outliers in the monthly 
           sales data and flag them for further investigation, leveraging 
           window functions to detect deviations from the expected 
           sales patterns. **/

CREATE  FUNCTION trg_flag_outliers()
RETURNS TRIGGER AS $$
BEGIN
    PERFORM flag_monthly_outliers(NEW.product_id);
    RETURN NEW;
END;


/** Q 20)  Write a query to retrieve the products with the highest 
           average gross price across all fiscal years, using subqueries 
           and inbuilt functions to perform the analysis. **/

SELECT
    product_id,
    avg_gross_price
FROM (
    SELECT
        product_id,
        AVG(gross_price) AS avg_gross_price,
        RANK() OVER (ORDER BY AVG(gross_price) DESC) AS price_rank
    FROM sales
    GROUP BY product_id
) ranked_products
WHERE price_rank = 1;


