-- Schema for Employee Attendance & Payroll Management System (MySQL)


DROP TABLE IF EXISTS payroll;
DROP TABLE IF EXISTS leaves;
DROP TABLE IF EXISTS attendance;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;


CREATE TABLE departments (
dept_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE employees (
emp_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone VARCHAR(20),
dept_id INT,
designation VARCHAR(100),
base_salary DECIMAL(12,2) NOT NULL CHECK (base_salary >= 0),
hire_date DATE NOT NULL,
is_active BOOLEAN DEFAULT TRUE,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id) ON DELETE SET NULL
);


CREATE TABLE attendance (
attendance_id INT AUTO_INCREMENT PRIMARY KEY,
emp_id INT NOT NULL,
attendance_date DATE NOT NULL,
clock_in TIME,
clock_out TIME,
status ENUM('Present','Absent','Half Day','Holiday') DEFAULT 'Present',
UNIQUE (emp_id, attendance_date),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);


CREATE TABLE leaves (
leave_id INT AUTO_INCREMENT PRIMARY KEY,
emp_id INT NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
leave_type ENUM('Paid','Unpaid','Sick','Casual') DEFAULT 'Paid',
status ENUM('Pending','Approved','Rejected') DEFAULT 'Pending',
reason VARCHAR(255),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);


CREATE TABLE payroll (
payroll_id INT AUTO_INCREMENT PRIMARY KEY,
emp_id INT NOT NULL,
year INT NOT NULL,
month INT NOT NULL,
base_salary DECIMAL(12,2) NOT NULL,
total_working_days INT NOT NULL,
days_present INT NOT NULL,
unpaid_leave_days INT NOT NULL,
bonus DECIMAL(12,2) DEFAULT 0,
deductions DECIMAL(12,2) DEFAULT 0,
net_salary DECIMAL(12,2) NOT NULL,
generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
UNIQUE (emp_id, year, month),
FOREIGN KEY (emp_id) REFERENCES employees(emp_id) ON DELETE CASCADE
);
