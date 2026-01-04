USE employee_payroll;


-- Departments
INSERT INTO departments (name) VALUES
('Engineering'), ('HR'), ('Sales'), ('Finance');


-- Employees (20 sample)
INSERT INTO employees (first_name, last_name, email, phone, dept_id, designation, base_salary, hire_date)
VALUES
('Palak','Gupta','palak.gupta@example.com','+911234567890',1,'Software Engineer',60000,'2023-07-01'),
('Sejal','Kureel','sejal.kureel@example.com','+911234567891',1,'Junior Developer',35000,'2024-01-15'),
('Amit','Kumar','amit.kumar@example.com','+911234567892',2,'HR Executive',30000,'2022-03-10'),
('Neha','Sharma','neha.sharma@example.com','+911234567893',3,'Sales Associate',32000,'2021-11-20'),
('Ravi','Singh','ravi.singh@example.com','+911234567894',4,'Accountant',40000,'2020-06-05');


-- Generate attendance sample for two months for first 5 employees (simple deterministic sample)
-- For brevity, insert a handful of records
INSERT INTO attendance (emp_id, attendance_date, clock_in, clock_out, status) VALUES
(1,'2025-09-01','09:05:00','18:00:00','Present'),
(1,'2025-09-02','09:03:00','17:52:00','Present'),
(1,'2025-09-03',NULL,NULL,'Absent'),
(2,'2025-09-01','09:10:00','18:05:00','Present'),
(2,'2025-09-02','09:20:00','17:30:00','Half Day'),
(3,'2025-09-01','09:00:00','18:00:00','Present');


-- Leaves
INSERT INTO leaves (emp_id, start_date, end_date, leave_type, status, reason) VALUES
(1,'2025-09-15','2025-09-16','Paid','Approved','Personal'),
(2,'2025-09-10','2025-09-12','Sick','Approved','Fever');


-- Note: payroll table will be filled by stored procedure
