

## Setup Guide

This guide explains how to set up the environment to run the Big Data Pipeline project using the MIMIC-III dataset.

### 1. Prerequisites

- Docker and Docker Compose installed
- Basic knowledge of terminal commands
- At least 8GB RAM recommended

### 2. Clone the Project Repository

```bash
git clone <your-repo-url>
cd <project-folder>
3. Start the Docker Environment
Run:

bash
Copy
Edit
docker-compose up -d
This starts all required containers (Hadoop, Hive, etc.) in the background.

4. Verify Running Containers
bash
Copy
Edit
docker ps
Look for containers like:

hadoop-namenode

hadoop-datanode

hive-server

hive-metastore

5. Access Hive CLI
bash
Copy
Edit
docker exec -it hive-server bash
hive
6. Load Data into HDFS
Upload your data files to HDFS:

bash
Copy
Edit
hdfs dfs -mkdir /mimic
hdfs dfs -put /local/path/to/parquet_files /mimic/parquet/
7. Create Hive Tables
Run HiveQL scripts to create external tables pointing to data in HDFS. Example:

sql
Copy
Edit
CREATE EXTERNAL TABLE labevents (
  row_id BIGINT,
  subject_id BIGINT,
  hadm_id BIGINT,
  specimen_id BIGINT,
  itemid INT,
  charttime STRING,
  value STRING,
  valuenum DOUBLE,
  valueuom STRING,
  flag STRING
)
STORED AS PARQUET
LOCATION '/mimic/parquet/labevents_dir/';
8. Run Hive Queries
You can now run analysis queries on the data.

9. Stop Docker Containers
bash
Copy
Edit
docker-compose down