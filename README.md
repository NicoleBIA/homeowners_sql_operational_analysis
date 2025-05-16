# homeowners_sql_operational_analysis

SQL-based operational analysis project for a simulated Homeowners Association (HOA) system.  
Focuses on relational database modeling, data validation, and strategic insights using PostgreSQL.

---

## Project Overview

This project simulates the operations of a Homeowners Association (HOA) responsible for managing homeowner information, property addresses, and maintenance request activity. It was designed to demonstrate applied SQL skills including database creation, data import, validation, exploratory analysis, and operational insight development.

---

## Tools & Technologies

- **PostgreSQL** (via pgAdmin 4)
- SQL (DDL, DML, SELECT, JOINs, GROUP BY)
- Data modeling (3-table schema)
- Manual data inspection & validation
- Commentary for code clarity and reuse

---

## 📊 Project Structure

| Component               | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `homeowners`           | Contains homeowner personal records (name, contact info)                    |
| `house_addresses`      | Stores residential property details including state, ZIP, and build date    |
| `maintenance_requests` | Logs requests submitted by homeowners with status and issue type tracking   |

---

## ✅ Key Features Demonstrated

- Creation of normalized relational tables with appropriate datatypes and primary keys
- Data import verification with `SELECT *` queries to ensure row counts match expectations
- Identification of vacant properties (no assigned homeowner)
- Aggregation of maintenance request status types (`Open`, `In Progress`, `Closed`)
- Distribution analysis of most common maintenance types
- Inner Join across homeowner and address tables to create operational visibility

---

## Insights Summary

- **30 homeowner records** were successfully imported and validated.
- **3 vacant properties** were identified with no homeowner assigned—useful for future outreach or asset tracking.
- Maintenance requests are distributed as follows:
  - `In Progress` (10)
  - `Open` (7)
  - `Closed` (3)
- **Roof Repair** and **Lawn Care** are the most frequent maintenance issues, signaling potential service prioritization areas.
- Joined records provide full visibility into homeowners and their property addresses, enabling planning for outreach, maintenance, and compliance enforcement.

---

## Use Case

This project simulates a mini-scale operations system for a Homeowners Association (HOA). It demonstrates how SQL can be used to:
- Validate that imported records match operational expectations
- Identify vacant or unassigned assets (e.g., homes without registered owners)
- Track maintenance request flow and backlog
- Segment types of requests for contractor scheduling or budget forecasting
- Join homeowners with addresses to ensure full operational visibility

The project structure and insights model how operational analysts and data teams might work within property management, real estate, or municipal data systems.

---

## 📁 Next Steps

Planned future extensions include:
- Adding foreign key constraints
- Creating calculated fields (e.g., house age)
- Integrating advanced queries using CTEs, CASE, and Window Functions
- Dashboarding via Power BI or Tableau for visual insights

---


