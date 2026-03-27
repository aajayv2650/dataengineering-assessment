# 🚀 Data Engineering Assessment – Cost-Efficient Backup & Data Lake Solution

## 👤 Author
Ajay (Data Engineer)

---

## 📌 Project Overview

This project demonstrates a **cost-efficient data engineering solution** using AWS, focusing on:

- Backup automation
- Data lake design
- Querying data for analytics
- Ensuring **zero or minimal AWS cost**

Only **low-cost AWS services** were used:
- Amazon S3
- Amazon Athena

No compute services (EC2, RDS, Glue, etc.) were used.

---

## 🧩 Problem Statement

We are given:
- PostgreSQL database (100 GB)
- Daily growth: 2 GB
- Retention requirement: 30–90 days
- Need for analytics and recovery

The challenge is to design a solution that is:
- Cost-efficient
- Scalable
- Easy to manage
- Safe (no unnecessary AWS charges)

---

# 🧠 Part 1 – Cost Analysis

## 🔹 Approaches Considered

### 1. Logical Backup (pg_dump + S3)
- Daily full backup
- Stored in S3
- Simple and low-cost

### 2. Incremental Backup (WAL Archiving)
- Base backup + continuous logs
- Supports point-in-time recovery
- More complex but efficient

---

## 🔹 Final Decision

**Chosen Approach: pg_dump + S3**

### ✔ Reason:
- Lowest cost
- Easy to implement
- Meets retention requirement
- Suitable for small to medium scale systems

---

# ⚙️ Part 2 – Backup Implementation

## 🔹 What I Did

- Created a **dummy PostgreSQL backup file (`backup.sql`)**
- Uploaded it to S3 using structured path:

--- path :-s3://deassessmentajay-backup-datalake/backups/postgres/2025/01/10/backup.sql

## 🔹 Backup Design

- Organized backups using **date-based partitioning**
- Simulates real-world backup storage strategy

---

## 🔹 Automation (Concept)

A Bash script (`backup.sh`) is included which:
- Takes database backup using `pg_dump`
- Compresses the file using gzip
- Uploads to S3
- Deletes backups older than 30 days

> Note: For this assignment, S3 upload was performed via AWS Console.

---

## 🔹 Retention Strategy

- Backups older than 30 days are deleted
- Can also be implemented using S3 Lifecycle Policies

---

## 🔹 Cost Consideration

- Only S3 storage used (very low cost)
- Compression reduces storage usage
- No compute services used

---

# 🏗️ Part 3 – Data Lake & Analytics

## 🔹 What I Did

- Created a sample dataset (`orders.csv`)
- Uploaded it to S3 in partitioned format:
-s3://deassessmentajaybackup-datalake/datalake/orders/year=2025/month=01/day=01/orders.csv


---

## 🔹 Data Lake Design

- Used **partitioned folder structure**
- Partition keys:
  - year
  - month
  - day

---

## 🔹 Athena Integration

- Created database: `de_assessment_db`
- Created external table on S3 data
- Queried data using SQL

### Sample Query:
```sql
SELECT * FROM de_assessment_db.orders;
``` id="2m6u2v"

---

## 🔹 Optimization

- Partitioning ensures:
  - Minimal data scan
  - Lower Athena cost

---

# 🧹 Cleanup (Critical Step)

To avoid AWS charges:

- Deleted all S3 data
- Deleted S3 bucket
- Verified billing = $0

---

# 📸 Screenshots

Included:
- S3 backup upload
- Data lake structure
- Athena query result
- AWS billing dashboard

---

# 🎥 Demo Video

A short video is included demonstrating:
- File upload
- Athena query
- Cleanup process
- Billing verification

---

# 💡 Key Learnings

- How to design cost-efficient data pipelines
- Importance of partitioning in data lakes
- Using serverless tools like Athena
- Managing AWS resources safely to avoid cost

---

# ✅ Conclusion

This project demonstrates a **simple, scalable, and cost-effective data engineering solution** using:

- Amazon S3 for storage
- Athena for analytics
- Structured data organization
- Zero infrastructure cost

---

