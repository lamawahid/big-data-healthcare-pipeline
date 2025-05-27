
The ETL pipeline processes the MIMIC-III healthcare data from raw parquet files to analytical Hive tables.

Steps
Extract:

Data is stored as Parquet files in local storage.

Files are uploaded into Hadoop HDFS.

Transform:

Use Hive external tables pointing to HDFS data.

Perform cleaning and transformation via HiveQL queries.

Example transformations include:

Casting data types.

Calculating length of stay.

Aggregating diagnosis codes.

Load:

Transformed data stays in Hive tables for analysis.

Results can be exported or queried live.

Example Hive Query (Analysis):
sql
Copy
Edit
SELECT d.icd_code AS diagnosis_code,
       AVG(DATEDIFF(a.dischtime, a.admittime)) AS avg_length_of_stay
FROM admissions a
JOIN diagnoses d ON a.hadm_id = d.hadm_id
GROUP BY d.icd_code
ORDER BY avg_length_of_stay DESC
LIMIT 10;
Notes
Parquet format is used for efficient storage and query performance.

Hive external tables map directly to files in HDFS — no data duplication.

Docker containers encapsulate the Hadoop and Hive environment to avoid configuration conflicts.

Troubleshooting Tips
If Hive complains about missing classes for Parquet formats, verify that all required Hive and Hadoop libraries are included in the classpath.

Ensure correct permissions on HDFS directories.

Check Docker logs for container errors.

Summary
This document covers environment setup and the ETL pipeline workflow for the Big Data project using MIMIC-III dataset. Use this as a reference for running and maintaining your data processing pipeline