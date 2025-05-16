# Phase 1 – Data Validation & Operational Insights

## 🧾 Overview

This initial analysis phase focused on validating data imports and running operational diagnostics across three key tables:  
- `homeowners`  
- `house_addresses`  
- `maintenance_requests`  

We verified record counts, identified vacant properties, summarized request statuses and types, and established foundational JOIN logic for operational visibility.

---

## ✅ Data Validation Results

| Table                 | Expected Records | Imported Records | Notes                           |
|----------------------|------------------|------------------|----------------------------------|
| homeowners           | 30               | 30               | Fully loaded                    |
| house_addresses      | 30               | 30               | Fully loaded                    |
| maintenance_requests | 20               | 20               | Loaded for mini-scale analysis  |

---

## Vacant Property Detection

**Query:**  
```sql
SELECT *  
FROM house_addresses  
WHERE homeowner_id IS NULL;
