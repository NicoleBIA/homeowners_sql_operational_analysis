--Check new Homeowners Project database is connected 
Select current_database ();

--Create Homewoners table
Create Table homeowners (
	homeowner_id BIGINT PRIMARY KEY,
	first_name VARCHAR (50),
	last_name VARCHAR (50),
	phone_number VARCHAR (30),
	email VARCHAR (255)
);

--Create House Addresses table
Create Table house_addresses (
	address_id BIGINT PRIMARY KEY,
	street VARCHAR (255),
	city VARCHAR (255),
	state_abv CHAR (2),
	zip VARCHAR (10),
	house_built_date DATE,
	homeowner_id BIGINT
);

--Create Maintenance Requests table
Create Table maintenance_requests (
	request_id BIGINT PRIMARY KEY,
	homeowner_id BIGINT,
	request_date DATE, 
	maintenance_type VARCHAR (255),
	request_status VARCHAR (50)
);

--Validate Table Import of 30 records inserted correctly
Select *
From homeowners;

--Validate Table Import of 30 records inserted correctly
Select *
From house_addresses;

--Validate Table Import of 30 records inserted correctly
Select *
From maintenance_requests;

--Validate all Homeowners inserted 
--Purpose: Ensure 30 homeowner records were imported successfully
Select *
From homeowners;

--Identify Vancant Properties
--Purpose: Find addresses that are currently vanact (no homeowmer assigned)
Select *
From house_addresses
Where homeowner_id is NULL;

--Summarize Maintenance Request States
--Purpose: Understand workload status- open, in-progress, closed, etc.
Select
	request_status,
	COUNT(*) As total_requests
	From maintenance_requests
	Group By request_status
	Order By total_requests DESC;

--Analyze Maintenance Types Distribution
--Purpose: Identify the most common type of maintenance issues reported
Select
	maintenance_type,
	COUNT(*) As total_requests
	From maintenance_requests
	Group By maintenance_type
	Order By total_requests DESC;

--Join Homeowners with House Addresses 
--Purpose: Create operational visibility into homeowner address details
Select
	h.first_name,
	h.last_name,
	a.street,
	a.city,
	a.state_abv
From
	homeowners h
Join house_addresses a
	On h.homeowner_id = a.homeowner_id;

--Select all records in homeowners after lost connection
--Purpose: Ensure all tables are connected to correct database before starting queries 
Select * 
From homeowners;

--Select all records in house_addresses after lost connection
--Purpose: Ensure all tables are connected to correct database before starting queries
Select * 
From house_addresses;

--Select all records in maintenance_requests after lost connection
--Purpose: Ensure all tables are connected to correct database before starting queries
Select *
From maintenance_requests;



