# Phase 1 – Data Validation & Operational Insights

## 🧾 Overview

This initial analysis phase focused on validating data imports and running operational diagnostics across three key tables:  
- `homeowners`  
- `house_addresses`  
- `maintenance_requests`  

I verified record counts, identified vacant properties, summarized request statuses and types, and established foundational JOINS for operational visibility.

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
WHERE homeowner_id IS NULL;```
```

---

![Vacant Property Results](/Images/House_Addresses_HomeownerID_Null.png)

### Insight

**3 properties** were found with no associated `homeowner_id`.  
These likely represent **vacant, transitional, or unassigned properties**.

> *Strategic Opportunity:* Flag these addresses for **resale preparation, rental onboarding, or inspection cycle planning**. This early diagnostic supports proactive asset utilization in HOA operations.



