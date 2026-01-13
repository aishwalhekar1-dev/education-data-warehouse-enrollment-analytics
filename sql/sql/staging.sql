-- Staging layer: clean and standardize raw data

-- Stage Students
CREATE OR REPLACE TABLE STG_STUDENTS AS
SELECT
  student_id,
  first_name,
  last_name,
  program,
  admission_year
FROM raw.students
WHERE student_id IS NOT NULL;

-- Stage Enrollments
CREATE OR REPLACE TABLE STG_ENROLLMENTS AS
SELECT
  enrollment_id,
  student_id,
  course_id,
  UPPER(term) AS academic_term,
  enrollment_status
FROM raw.enrollments
WHERE enrollment_status = 'Active';

-- Stage Courses
CREATE OR REPLACE TABLE STG_COURSES AS
SELECT
  course_id,
  course_name,
  department,
  credits
FROM raw.courses
WHERE credits > 0;

-- Stage Funding
CREATE OR REPLACE TABLE STG_FUNDING AS
SELECT
  student_id,
  fiscal_year,
  funding_amount
FROM raw.funding
WHERE funding_amount >= 0;
