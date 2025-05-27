CREATE DATABASE IF NOT EXISTS mimic;

USE mimic;

-- admissions table
CREATE EXTERNAL TABLE IF NOT EXISTS admissions (
  subject_id BIGINT,
  hadm_id BIGINT,
  admittime TIMESTAMP,
  dischtime TIMESTAMP,
  admission_type STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/mimic/admissions';

-- patients table
CREATE EXTERNAL TABLE IF NOT EXISTS patients (
  subject_id BIGINT,
  gender STRING,
  dob TIMESTAMP,
  dod TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/mimic/patients';

-- diagnoses table
CREATE EXTERNAL TABLE IF NOT EXISTS diagnoses (
  row_id BIGINT,
  subject_id BIGINT,
  hadm_id BIGINT,
  seq_num BIGINT,
  icd_code STRING,
  icd_version BIGINT,
  long_title STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/mimic/diagnoses';

-- icustays table
CREATE EXTERNAL TABLE IF NOT EXISTS icustays (
  subject_id BIGINT,
  hadm_id BIGINT,
  icustay_id BIGINT,
  intime TIMESTAMP,
  outtime TIMESTAMP
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/mimic/icustays';

-- labevents_cleaned table
CREATE EXTERNAL TABLE IF NOT EXISTS labevents_cleaned (
  subject_id BIGINT,
  hadm_id BIGINT,
  itemid BIGINT,
  charttime TIMESTAMP,
  valuenum DOUBLE,
  valueuom STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/mimic/labevents_cleaned';
