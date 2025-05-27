# Data Model Overview

This project uses a subset of the MIMIC-III dataset for healthcare analytics. The data model includes the following key tables:

---

## 🧍 patients

| Column     | Type      | Description                      |
|------------|-----------|----------------------------------|
| subject_id | BIGINT    | Unique patient identifier        |
| gender     | STRING    | Gender of the patient            |
| dob        | TIMESTAMP | Date of birth                    |
| dod        | TIMESTAMP | Date of death (if applicable)    |

---

## 🏥 admissions

| Column        | Type      | Description                            |
|---------------|-----------|----------------------------------------|
| subject_id    | BIGINT    | Foreign key to patients                |
| hadm_id       | BIGINT    | Unique hospital admission ID           |
| admittime     | TIMESTAMP | Time of admission                      |
| dischtime     | TIMESTAMP | Time of discharge                      |
| admission_type| STRING    | Type of admission (e.g., emergency)    |

🔗 **Relation:** `admissions.subject_id` → `patients.subject_id`

---

## 🧾 diagnoses

| Column       | Type    | Description                           |
|--------------|---------|---------------------------------------|
| subject_id   | BIGINT  | Foreign key to patients               |
| hadm_id      | BIGINT  | Foreign key to admissions             |
| icd_code     | STRING  | Diagnosis ICD-9 code                 |
| long_title   | STRING  | Description of diagnosis              |

🔗 **Relations:**  
- `diagnoses.subject_id` → `patients.subject_id`  
- `diagnoses.hadm_id` → `admissions.hadm_id`

---

## 🛏️ icustays

| Column     | Type      | Description                        |
|------------|-----------|------------------------------------|
| icustay_id | BIGINT    | Unique ICU stay ID                 |
| subject_id | BIGINT    | Foreign key to patients            |
| hadm_id    | BIGINT    | Foreign key to admissions          |
| intime     | TIMESTAMP | ICU admission time                 |
| outtime    | TIMESTAMP | ICU discharge time                 |

---

## 🔬 labevents_cleaned

| Column     | Type      | Description                        |
|------------|-----------|------------------------------------|
| subject_id | BIGINT    | Foreign key to patients            |
| hadm_id    | BIGINT    | Foreign key to admissions          |
| itemid     | BIGINT    | Lab test identifier                |
| charttime  | TIMESTAMP | Time of the test                   |
| valuenum   | DOUBLE    | Numeric result of the test         |
| valueuom   | STRING    | Unit of measurement                |