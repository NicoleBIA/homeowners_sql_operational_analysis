# homeowners_sql_operational_analysis

SQL-based operational analysis project for a simulated Homeowners Association (HOA) system. This project models homeowner and property data using relational database principles, and applies structured queries to derive operational insights, identify maintenance trends, and support decision-making through data validation and join logic.

## Project Scope

This project demonstrates core SQL and relational modeling capabilities by analyzing property, homeowner, and maintenance request data across a small-scale simulated HOA system. Focus areas include:

- Database schema design
- Data import and validation
- Query development
- Maintenance trend analysis
- Vacancy detection
- Operational join logic

---

##  Use Case

This project serves as a practical reference for:

- SQL-focused technical interviews  
- Demonstrating operational insight generation with real-world structures  
- Analysts seeking to reinforce relational database fluency through scenario-based querying  

---

## Database Structure

| Table Name           | Description                                       | Key Columns                              |
|----------------------|---------------------------------------------------|-------------------------------------------|
| `homeowners`         | Homeowner contact records                         | `homeowner_id`, `first_name`, `email`     |
| `house_addresses`    | Property address and ownership linkage            | `address_id`, `street`, `homeowner_id`    |
| `maintenance_requests` | Tracks maintenance request details and status   | `request_id`, `maintenance_type`, `status`|

## 📊 Analysis Highlights (Phase 1)

- All 30 homeowner records were successfully imported and validated.
- 3 vacant properties were identified, enabling targeted outreach opportunities.
- Maintenance requests were categorized into Open, In Progress, and Closed, supporting workload tracking.
- Roof Repair and Lawn Care were the most reported issue types, informing preventive planning.
- Homeowner-property joins enabled integrated insights across household-level operations.

## 🛠️ Tools Used

- PostgreSQL (pgAdmin 4)
- SQL (Data modeling, validation, joins, aggregation)
- GitHub (Documentation and version control)

## 📂 Folder Structure (To Be Added)

