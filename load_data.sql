-- ============================================================
-- Pizza Hut Sales Analysis — Load CSV Data
-- ============================================================
-- Run schema/create_tables.sql first.
-- Update the file paths below to match where you've placed the
-- /data CSVs on your own machine, then run this in MySQL.
--
-- NOTE: local_infile must be enabled:
--   SET GLOBAL local_infile = 1;
-- and your MySQL client must be started with --local-infile=1
-- ============================================================

USE pizza_hut;

LOAD DATA LOCAL INFILE 'data/pizza_types.csv'
INTO TABLE pizza_types
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/pizzas.csv'
INTO TABLE pizzas
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE 'data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, order_date, order_time);

LOAD DATA LOCAL INFILE 'data/order_details.csv'
INTO TABLE order_details
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Quick sanity check after loading
SELECT
    (SELECT COUNT(*) FROM pizza_types)   AS pizza_types_rows,
    (SELECT COUNT(*) FROM pizzas)        AS pizzas_rows,
    (SELECT COUNT(*) FROM orders)        AS orders_rows,
    (SELECT COUNT(*) FROM order_details) AS order_details_rows;
