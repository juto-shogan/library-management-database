# SQL Project: Database Schema Creation, Seeding & Data Manipulation

## Overview

This project demonstrates fundamental SQL database operations, including schema creation, data seeding (insertion), and various forms of data manipulation. It is designed to help learners and developers understand the essential workflow of building and working with a relational database using SQL.

The SQL files are structured into three main phases:

1. **Schema Creation** – Defining tables, relationships, and constraints.
2. **Data Seeding** – Populating the database with sample data.
3. **Data Manipulation** – Performing CRUD operations and executing queries.

## Project Structure

| File Name               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `1_schema_creation.sql`  | Creates the database schema, including tables, data types, keys, and constraints. |
| `2_data_seeding.sql`     | Inserts sample records into the created tables for testing and demonstration.    |
| `3_data_manipulation.sql`| Demonstrates operations such as `SELECT`, `UPDATE`, `DELETE`, `JOIN`, and more.  |

## Requirements

- Database Engine: PostgreSQL (preferred) or any SQL-compatible RDBMS
- SQL Client: pgAdmin, DBeaver, DataGrip, or terminal-based `psql`

## Usage

1. **Clone the Repository**

   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name

2. **Create a Database**

   ```sql
   CREATE DATABASE your_database_name;
   ```

3. **Run SQL Scripts in Order**

   * Execute the schema creation file:

     ```bash
     psql -d your_database_name -f 1_schema_creation.sql
     ```

   * Insert sample data:

     ```bash
     psql -d your_database_name -f 2_data_seeding.sql
     ```

   * Run manipulation queries:

     ```bash
     psql -d your_database_name -f 3_data_manipulation.sql
     ```

## Key Features

* Normalised relational database schema
* Enforced data integrity with primary and foreign keys
* Sample dataset for testing and learning
* Advanced SQL queries including joins and aggregations

## Learning Objectives

* Understand how to design a relational database schema
* Learn to insert and manage data using SQL
* Practice writing SQL queries for real-world scenarios
* Gain experience with JOINs, GROUP BY, subqueries, and data updates

## Author

**Somto Mbonu**
Aspiring Penetration Tester & Machine Learning Engineer
[GitHub Profile](https://github.com/juto-shogan)

