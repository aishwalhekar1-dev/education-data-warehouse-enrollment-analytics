-- Enrollment trends by academic term
SELECT
  academic_term,
  COUNT(DISTINCT student_id) AS total_enrollment
FROM FACT_ENROLLMENT
GROUP BY academic_term
ORDER BY academic_term;

-- Funding per student
SELECT
  student_id,
  SUM(funding_amount) AS total_funding
FROM FACT_ENROLLMENT
GROUP BY student_id
ORDER BY total_funding DESC;

-- Program-level enrollment analysis
SELECT
  program,
  COUNT(DISTINCT student_id) AS enrollment_count
FROM FACT_ENROLLMENT
GROUP BY program
ORDER BY enrollment_count DESC;
