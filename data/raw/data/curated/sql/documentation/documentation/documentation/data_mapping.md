# Source-to-Target Data Mapping
## Education Data Warehouse & Enrollment Analytics

---

## 1. Overview
This document defines the source-to-target mappings used to populate the Enrollment Fact table in the education data warehouse. The mappings ensure data consistency, traceability, and alignment with business and reporting requirements.

---

## 2. Source Systems
- Student Information System (SIS)
- Enrollment Management System
- Course Catalog System
- Funding & Finance System

---

## 3. Target Data Model
- Fact Table: FACT_ENROLLMENT
- Grain: One record per student per academic term

---

## 4. Source-to-Target Mapping Table

| Source System | Source Table | Source Field | Target Table | Target Field | Transformation Logic |
|--------------|--------------|--------------|--------------|--------------|----------------------|
| SIS | students | student_id | FACT_ENROLLMENT | student_key | Direct mapping |
| SIS | students | date_of_birth | DIM_STUDENT | birth_date | Format standardization |
| Enrollment | enrollments | term | FACT_ENROLLMENT | academic_term | Standardized term format |
| Enrollment | enrollments | enrollment_status | FACT_ENROLLMENT | enrollment_status | Active records only |
| Courses | courses | course_id | FACT_ENROLLMENT | course_key | Direct mapping |
| Courses | courses | credits | FACT_ENROLLMENT | credit_units | Numeric validation |
| Finance | funding | funding_amount | FACT_ENROLLMENT | funding_amount | Aggregated by term |
| Finance | funding | funding_year | FACT_ENROLLMENT | fiscal_year | Fiscal year alignment |

---

## 5. Transformation Rules
- Standardize academic term values (e.g., Fall 2024 → 2024-FALL)
- Exclude withdrawn or cancelled enrollments
- Aggregate funding amounts at the student-term level
- Validate numeric fields for null or negative values

---

## 6. Data Validation & Reconciliation
- Record count reconciliation between source and target
- Null value checks on key identifiers
- Referential integrity between student and enrollment data
- Funding totals validated against finance source system

---

## 7. Assumptions
- Source systems provide consistent student identifiers
- Funding data is available at the student or program level
- Sample data is used for demonstration purposes
