--Top Diagnoses by Average Length of Stay
SELECT d.icd_code AS diagnosis_code,
       AVG(DATEDIFF(a.dischtime, a.admittime)) AS avg_length_of_stay
FROM admissions a
JOIN diagnoses d ON a.hadm_id = d.hadm_id
GROUP BY d.icd_code
ORDER BY avg_length_of_stay DESC
LIMIT 10;

-- Patients with Multiple ICU Stays
SELECT subject_id,
       COUNT(*) AS icu_stay_count
FROM icustays
GROUP BY subject_id
HAVING COUNT(*) > 1
ORDER BY icu_stay_count DESC
LIMIT 10;

-- Mortality Rate by Gender
SELECT gender,
       AVG(expire_flag) AS mortality_rate
FROM patients
GROUP BY gender;

--Patient Count by Age Group
SELECT
  CASE
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 39 THEN '20-39'
    WHEN age BETWEEN 40 AND 59 THEN '40-59'
    WHEN age BETWEEN 60 AND 79 THEN '60-79'
    ELSE '80+'
  END AS age_group,
  COUNT(DISTINCT subject_id) AS patient_count
FROM (
  SELECT
    p.subject_id,
    FLOOR(DATEDIFF(a.admittime, p.dob)/365.25) AS age
  FROM patients p
  JOIN admissions a ON p.subject_id = a.subject_id
) sub
GROUP BY
  CASE
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 39 THEN '20-39'
    WHEN age BETWEEN 40 AND 59 THEN '40-59'
    WHEN age BETWEEN 60 AND 79 THEN '60-79'
    ELSE '80+'
  END
ORDER BY age_group;


