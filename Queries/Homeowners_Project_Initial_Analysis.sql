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

--View Homeowners for Join with maintenace requests
Select *
From homeowners;

--Count of maintenance requests submitted by each homeowener
Select
	h.homeowner_id,
	h.first_name,
	h.last_name,
Count(request_id) As total_requests
From homeowners h
Join maintenance_requests m
	On h.homeowner_id = m.homeowner_id
Group by h.homeowner_id, h.first_name, h.last_name
Order By total_requests DESC;

--Calculate days since maitenance requests was submitted
Select 
	request_id,
	homeowner_id,
	maintenance_type,
	request_status,
	request_date,
	Current_Date - request_date As days_open
From maintenance_requests
Where request_status IN ('Open', 'In Progress')
Order By days_open DESC;

--Preview House addresses table for join with maitenance requests
Select * 
From house_addresses;

--Vacant properties with no linked maintenance requests
--Purpose: Identify vacant properties with no maintenance activity
Select
	a.address_id,
	a.street,
	a.city,
	a.state_abv,
	a.house_built_date
From house_addresses a
Left Join maintenance_requests m
	On a.homeowner_id = m.homeowner_id
Where a.homeowner_id IS Null 
	And m.request_id IS Null;

--Summary of maintenance types by requests status
--Purpose: To show count of maintenance types and status
Select 
	maintenance_type,
	request_status,
	COUNT(*) As request_count
From maintenance_requests
Group by maintenance_type, request_status
Order By maintenance_type, request_status;

--Maintenance type by request status
Select
	request_status,
	COUNT(*) As request_count
From maintenance_requests
Group by request_status
Order by request_status;

-- Segment properties by age groupings for strategic analysis
--Age brackets:
-- -0-20 years --> Newer
-- - 21-40 years --> Mid-Age
-- - 41-60 years --> Older
-- - 61+ years -- Very Old
Select 
	a.address_id,
	a.street,
	a.city,
	a.state_abv,
	a.house_built_date,
Date_Part('year', current_date) - Date_Part('year',a.house_built_date) As property_age,
	CASE 
	    WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', a.house_built_date) <= 20 THEN '0-20 years (Newer)'
	    WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', a.house_built_date) BETWEEN 21 AND 40 THEN '21-40 years (Mid-Age)'
	    WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', a.house_built_date) BETWEEN 41 AND 60 THEN '41-60 years (Older)'
	    ELSE '60+ years (Very Old)'
	END AS property_age_group
From house_addresses a
Where a.house_built_date IS NOT NULL
Order By property_age Desc;

--This concludes the SQL analysis portion of the Homeowers Project
--Further analysis and visualization to be performed in PowerBI



	
	


