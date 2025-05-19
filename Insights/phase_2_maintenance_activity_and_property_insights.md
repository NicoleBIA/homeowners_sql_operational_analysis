# Phase 2: Maintenance Request Analysis & Property Segmentation

This analysis phase focused on operational workload patterns, homeowner activity, and aging infrastructure by:

- Joining `homeowners` and `maintenance_requests` tables
- Calculating active request durations (days open)
- Segmenting properties by age using build year
- Summarizing maintenance types by status
- Identifying vacant addresses with no activity

---

## Count of Maintenance Requests per Homeowner

This query joined the `homeowners` and `maintenance_requests` tables to count the total number of maintenance requests each homeowner submitted.

```sql
Select
  h.homeowner_id,
  h.first_name,
  h.last_name,
  Count(request_id) As total_requests
From homeowners h
Join maintenance_requests m
  On h.homeowner_id = m.homeowner_id
Group by h.homeowner_id, h.first_name, h.last_name
Order by total_requests DESC;
```

**Result:**

- 16 homeowners submitted at least one request.

- Homeowner ID 8 submitted the most requests (8 total).

---

## Days Since Maintenance Request Submission (Aging)

This query calculates how long each unresolved maintenance request has remained open or in progress.

```sql
Select
  request_id,
  homeowner_id,
  maintenance_type,
  request_status,
  request_date,
  Current_Date - request_date As days_open
From maintenance_requests
Where request_status IN ('Open', 'In Progress')
Order by days_open DESC;
```

**Insight**

- The oldest open request is 725 days old (from May 2023).

- This highlights urgent backlog concerns in Electrical and Roof Repair types.

---

## Vacant Properties with No Linked Requests

```sql
Select
  a.address_id,
  a.street,
  a.city,
  a.state_abv,
  a.house_built_date
From house_addresses a
Left Join maintenance_requests m
  On a.homeowner_id = m.homeowner_id
Where a.homeowner_id IS NULL
  And m.request_id IS NULL;
```

**Result**

- 3 properties met this condition.
  
- May represent risk or neglected addresses.

---

## Maintenance Type Distribution (by Volume)

This query summarizes which maintenance types are most commonly reported.

```sql
Select
  maintenance_type,
  COUNT(*) As total_requests
From maintenance_requests
Group by maintenance_type
Order By total_requests DESC;
```

**Top Issues:**

- Roof Repair (6), Lawn Care (6), Plumbing (4)

**Insight:** 

> Roof Repair is the most reported issue, with 6 total requests across statuses — suggesting priority for preventive inspection.


---

## Maintenance Request Count by Status

This breakdown summarizes overall request status.

```sql
Select
  request_status,
  COUNT(*) As request_count
From maintenance_requests
Group by request_status
Order by request_status;
```

**Result:**

10 In Progress, 7 Open, 3 Closed; signaling possible backlog or processing delays.

---

## Maintenance Summary by Type and Status

This cross-tab view shows how many requests per type are still unresolved.

```sql
Select
  maintenance_type,
  request_status,
  COUNT(*) As request_count
From maintenance_requests
Group by maintenance_type, request_status
Order By maintenance_type, request_status;
```

**Insight:**

Lawn Care and Roof Repair dominate unresolved workload.

---

## Property Age Segmentation

This analysis segments all 30 properties by construction age using `house_built_date`. This provides operational and risk management visibility for property condition and potential capital improvement needs.

**Defined Age Groups:**

- `0–20 years (Newer)` → Built after 2005
- `21–40 years (Mid-Age)` → Built between 1985–2004
- `41–60 years (Older)` → Built between 1965–1984
- `60+ years (Very Old)` → Built in 1964 or earlier

```sql
Select
  a.address_id,
  a.street,
  a.city,
  a.state_abv,
  a.house_built_date,
  Date_Part('year', current_date) - Date_Part('year', a.house_built_date) As property_age,
  CASE
    WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', a.house_built_date) <= 20 THEN '0-20 years (Newer)'
    WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', a.house_built_date) BETWEEN 21 AND 40 THEN '21-40 years (Mid-Age)'
    WHEN DATE_PART('year', CURRENT_DATE) - DATE_PART('year', a.house_built_date) BETWEEN 41 AND 60 THEN '41-60 years (Older)'
    ELSE '60+ years (Very Old)'
  END AS property_age_group
From house_addresses a
Where a.house_built_date IS NOT NULL;
```

### Property Age Segment Distribution


| Property Age Group        | Age Range        | Count | % of Total |
|---------------------------|------------------|-------|------------|
| `0–20 years (Newer)`      | 2005 – 2024      | 13    | 43.3%      |
| `21–40 years (Mid-Age)`   | 1985 – 2004      | 7     | 23.3%      |
| `41–60 years (Older)`     | 1965 – 1984      | 8     | 26.7%      |
| `60+ years (Very Old)`    | ≤ 1964           | 4     | 13.3%      |
| **Total Properties**      | —                | **30**| **100%**   |


**Operational Insight** 

- Over 40% of the properties are newer builds (≤ 20 years), suggesting reduced maintenance pressure.

- 8 properties (27%) fall into the Older (41–60 years) category, potentially nearing key structural lifecycle thresholds.

- 4 homes are classified as Very Old (60+ years); these may warrant proactive inspections or capital forecasting.

---

## Key Takeaways

- High Request Volume: Certain homeowners and request types (Roof, Lawn) dominate service load.

- Aging Inventory: A third of homes are 41+ years old;  potential for proactive maintenance planning.

- Backlog Risk: Many requests remain unresolved 400+ days.

- Vacant Properties: 3 idle homes with no requests; candidates for inspection or resale strategy.

---

### Key Observations

- 65% of open/in-progress requests have been unresolved for over 600 days.
- 13 properties are less than 20 years old; 4 are over 60 years old.
- Lawn Care and Roof Repair dominate active requests.

View Phase 1 Insights Here:
[Phase 1 Insights:](/Insights/phase_1_data_validation_and_operational_insights.md)

View Phase 1 and Phase 2 Strategic Recommendations Here:
[Strategic Recommendations:](Strategic_Recommendations/phase_2_operational_strategy_hoamaintenance.md)











