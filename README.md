# LinkedIn Database Schema Design
### Built with MySQL + Relational Database Design Principles

## Project Overview
This project focuses on the architectural design of a professional networking database, similar to LinkedIn. It demonstrates the ability to map complex real-world interactions—such as networking connections, professional history, and content engagement—into a structured, normalized relational schema.

<img width="808" height="899" alt="LinkedINDatabase_ERD" src="https://github.com/user-attachments/assets/4deb33c1-ba95-43b3-9fa9-1238ad941bf1" />

## Key Objectives
* **Normalize** professional data into Third Normal Form (3NF) to minimize redundancy and ensure data integrity.
* **Implement** self-referencing relationships to handle peer-to-peer networking and messaging.
* **Manage** many-to-many relationships between users and professional competencies using junction tables.
* **Enforce** data consistency through strict primary and foreign key constraints.
* **Track** social engagement metrics including posts, threaded comments, and user reactions.

---

## Database Architecture Logic

The schema is organized into four logical segments to handle different aspects of a professional social graph:

### 1. Identity and Professional History
The core of the system is the **Users** table, which stores unique profile information. This is supported by:
* **EducationRecords:** Detailed academic history linked to specific users.
* **ExperienceRecords:** Historical work roles, company names, and professional titles.

### 2. Networking and Skills Mapping
The system facilitates professional growth through:
* **Connections:** A self-referencing table that tracks relationship statuses (Pending/Accepted) between two user IDs.
* **Skills/UserSkills:** A many-to-many structure allowing users to associate with multiple skills and vice versa.

### 3. Content and Engagement
Platform activity is handled through three primary interaction layers:

| Interaction | Table | Logic |
| :--- | :--- | :--- |
| **Creation** | Posts | Stores text content with visibility controls (Public/Connections). |
| **Discussion** | Comments | Links user feedback directly to specific posts. |
| **Reaction** | Likes | Tracks user engagement and interest in specific content. |

### 4. Communication
Direct interaction is managed by the **Messages** table, which records private data flow, timestamps, and read-status between a sender and a receiver.

---

## Tech Stack

| Technology | Purpose |
| :--- | :--- |
| **MySQL** | Relational Database Management System (RDBMS) |
| **SQL (DDL)** | Data Definition Language for schema generation |
| **ERD Modeling** | Logical and Physical database visualization |

---



## Key Features
* **Referential Integrity:** All engagement data (Likes, Comments, Posts) is bound by foreign keys to prevent orphaned records.
* **Self-Referential Links:** Used in the `Connections` and `Messages` tables to allow users to interact with other users within the same table.
* **Optimized Data Types:** Usage of `ENUM` for status/visibility and `TINYINT` for boolean flags to ensure storage efficiency.
* **Data Uniqueness:** Unique constraints on email addresses to prevent duplicate account creation.

## Setup Instructions
1. Initialize the database environment:
```sql
CREATE DATABASE linkedin_db_new;
USE linkedin_db_new;

### Author
###### Saptarshi Bandyopadhyay Data Analyst
