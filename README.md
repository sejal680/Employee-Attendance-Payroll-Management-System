Employee Attendance & Payroll Management System

A SQL-based project that automates employee attendance tracking, leave management, and monthly payroll calculation.
This project demonstrates database design, complex SQL query writing, stored procedures, triggers, and analytics integration — all essential for software and data developer roles.

📘 Project Overview
This system manages employee data, attendance logs, and payroll generation in a relational database.
It automates monthly salary computation, handles unpaid leaves, and generates department-level salary reports using SQL views and queries.

🧠 Objectives
Design a normalized relational database in MySQL.
Implement stored procedures and triggers for automation.
Use views and aggregate queries for business reporting.
Perform optional Python-based analytics on payroll and attendance.
🛠️ Tech Stack
Component	Technology
Database	MySQL
Backend Logic	SQL (Stored Procedures, Triggers, Views)
Data Analysis (Optional)	Python, Pandas, Matplotlib, SQLAlchemy
Tools	MySQL Workbench, VS Code, Power BI (optional)
⚙️ Key Features
✅ Normalized Database Design (3NF) — Employees, Departments, Attendance, Leaves, Payroll
✅ Stored Procedures — Automates monthly payroll generation
✅ Triggers — Auto-update payroll when attendance changes
✅ Views & Reports — Department-wise and employee-level salary summaries
✅ Sample Data — Includes demo employees, departments, and attendance logs
✅ Python Analytics (Optional) — Generates charts for payroll cost and attendance rate

🚀 Quick Start
Setup Database

CREATE DATABASE employee_payroll;

USE employee_payroll;

Import SQL Files

mysql -u -p employee_payroll < sql/schema.sql

mysql -u -p employee_payroll < sql/sample_data.sql

mysql -u -p employee_payroll < sql/procedures_triggers.sql

mysql -u -p employee_payroll < sql/views_queries.sql

Generate Payroll Report

CALL calculate_monthly_payroll(2025, 9);

SELECT * FROM payroll;

SELECT * FROM dept_payroll_summary;
