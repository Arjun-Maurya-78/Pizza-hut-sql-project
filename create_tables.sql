-- ============================================================
-- Pizza Hut Sales Analysis — Database Schema
-- ============================================================
-- Creates the database and all 4 tables needed for this project.
-- Run this file first, then load the CSV data (see schema/load_data.sql).
-- ============================================================

CREATE DATABASE IF NOT EXISTS pizza_hut;
USE pizza_hut;

-- ------------------------------------------------------------
-- pizza_types: master list of pizza names, categories & ingredients
-- ------------------------------------------------------------
DROP TABLE IF EXISTS pizza_types;
CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    category      VARCHAR(50) NOT NULL,
    ingredients   TEXT
);

-- ------------------------------------------------------------
-- pizzas: each pizza_type in each available size, with price
-- ------------------------------------------------------------
DROP TABLE IF EXISTS pizzas;
CREATE TABLE pizzas (
    pizza_id      VARCHAR(50) PRIMARY KEY,
    pizza_type_id VARCHAR(50) NOT NULL,
    size          VARCHAR(5) NOT NULL,
    price         DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id)
);

-- ------------------------------------------------------------
-- orders: one row per customer order (date + time)
-- ------------------------------------------------------------
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id  INT PRIMARY KEY,
    order_date DATE NOT NULL,
    order_time TIME NOT NULL
);

-- ------------------------------------------------------------
-- order_details: line items — which pizza(s) & how many per order
-- ------------------------------------------------------------
DROP TABLE IF EXISTS order_details;
CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id         INT NOT NULL,
    pizza_id         VARCHAR(50) NOT NULL,
    quantity         INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);
