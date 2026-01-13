-- Fact table for enrollment analytics

CREATE OR REPLACE TABLE FACT_ENROLLMENT AS
SELECT
  s.student_id,
  s.program,
  e.academic_term,
  COUNT(e.course_id) AS total_courses,
  SUM(c.credits) AS total_credits,
  COALESCE(SUM(f.funding_amount), 0) AS funding_amount
FROM STG_STUDENTS s
JOIN STG_ENROLLMENTS e
  ON s.student_id = e.student_id
JOIN STG_COURSES c
  ON e.course_id = c.course_id
LEFT JOIN STG_FUNDING f
  ON s.student_id = f.student_id
GROUP BY
  s.student_id,
  s.program,
  e.academic_term;
