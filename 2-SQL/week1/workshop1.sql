-- kill other connections
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'week1_workshop' AND pid <> pg_backend_pid();
-- (re)create the database
DROP DATABASE IF EXISTS week1_workshop;
CREATE DATABASE week1_workshop;
-- connect via psql
\c week1_workshop

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


---
--- CREATE tables
---

-- Create the customers table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT
);

-- Create the employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT,
    phone TEXT,
    hire_date DATE,
    job_title TEXT
);

-- Create the territories table
CREATE TABLE territories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    order_date DATE,
    customer_id INTEGER,
    employee_id INTEGER
);

-- Create the products table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    supplier_id INTEGER NOT NULL,
    price NUMERIC(10, 2) NOT NULL
);

-- Create the suppliers table
CREATE TABLE suppliers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Create the orders_products table
CREATE TABLE orders_products (
    product_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    quantity INTEGER,
    discount NUMERIC NOT NULL,
    PRIMARY KEY (product_id, order_id)
);

-- Create the employees_territories table
CREATE TABLE employees_territories (
    employee_id INTEGER NOT NULL,
    territory_id INTEGER NOT NULL,
    PRIMARY KEY (employee_id, territory_id)
);

-- Create the us_states table
CREATE TABLE us_states (
    id SERIAL PRIMARY KEY,
    abbreviation CHARACTER(2) NOT NULL
);

-- Add foreign key constraints for orders to customers and employees
ALTER TABLE orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id)
REFERENCES customers(id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_employees
FOREIGN KEY (employee_id)
REFERENCES employees(id);

-- Add foreign key constraint for products to suppliers
ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id)
REFERENCES suppliers(id);

-- Add foreign key constraints for orders_products to products and orders
ALTER TABLE orders_products
ADD CONSTRAINT fk_orders_products_products
FOREIGN KEY (product_id)
REFERENCES products(id);

ALTER TABLE orders_products
ADD CONSTRAINT fk_orders_products_orders
FOREIGN KEY (order_id)
REFERENCES orders(id);

-- Add foreign key constraints for employees_territories to employees and territories
ALTER TABLE employees_territories
ADD CONSTRAINT fk_employees_territories_employees
FOREIGN KEY (employee_id)
REFERENCES employees(id);

ALTER TABLE employees_territories
ADD CONSTRAINT fk_employees_territories_territories
FOREIGN KEY (territory_id)
REFERENCES territories(id);

-- Add foreign key constraint for offices to territories
ALTER TABLE offices
ADD CONSTRAINT fk_offices_territories
FOREIGN KEY (territory_id)
REFERENCES territories(id);
