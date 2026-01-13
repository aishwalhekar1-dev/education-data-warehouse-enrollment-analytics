# Data Quality Rules & Source-to-Target Mapping

## Project Context
This document defines data quality rules and source-to-target mappings
for the Education Enrollment Data Warehouse. The goal is to ensure
accurate enrollment reporting and funding analysis.

---

## Source Systems
| Source Table | Description |
|-------------|-------------|
| raw.students | Student demographic and program data |
| raw.enrollments | Course enrollment transactions |
| raw.courses | Course catalog and credit information |
| raw.funding | Student-level funding allocations |

---

## Data Quality Rules

### Students
- student_id must not be NULL
- admission_year must be a valid year
- program must be populated

### Enrollments
- enrollment_status must be 'Active'
- student_id must exist in Students table
- term must be standardized to uppercase

### Courses
- credits must be greater than zero
- department must be populated

### Funding
- funding_amount must be >= 0
- fiscal_year must be valid

---

## Source-to-Target Mapping

### STG_STUDENTS
| Source Column | Target Column |
|--------------|---------------|
| student_id | student_id |
| first_name | first_name |
| last_name | last_name |
| program | program |
| admission_year | admission_year |

### STG_ENROLLMENTS
| Source Column | Target Column |
|--------------|---------------|
| enrollment_id | enrollment_id |
| student_id | student_id |
| course_id | course_id |
| term | academic_term |
| enrollment_status | enrollment_status |

### FACT_ENROLLMENT
| Source | Target Column | Logic |
|------|---------------|-------|
| STG_STUDENTS | student_id | direct |
| STG_ENROLLMENTS | academic_term | standardized |
| STG_COURSES | total_credits | SUM(credits) |
| STG_FUNDING | funding_amount | SUM(funding_amount) |
