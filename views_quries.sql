USE employee_payroll;


-- Views
DROP VIEW IF EXISTS dept_payroll_summary;
CREATE VIEW dept_payroll_summary AS
SELECT d.dept_id, d.name AS department, COUNT(p.payroll_id) AS employees_count, SUM(p.net_salary) AS total_net_payroll
FROM payroll p
JOIN employees e ON p.emp_id = e.emp_id
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.name;


DROP VIEW IF EXISTS employee_payroll_summary;
CREATE VIEW employee_payroll_summary AS
SELECT p.emp_id, CONCAT(e.first_name,' ',e.last_name) AS employee_name, p.year, p.month, p.base_salary, p.bonus, p.deductions, p.net_salary
FROM payroll p
JOIN employees e ON p.emp_id = e.emp_id;


-- Useful queries (examples)
-- 1. Top 5 employees by attendance rate in a month
SELECT e.emp_id, CONCAT(e.first_name,' ',e.last_name) AS name,
(p.days_present / NULLIF(p.total_working_days,0)) AS attendance_rate
FROM payroll p
JOIN employees e ON p.emp_id = e.emp_id
WHERE p.year=2025 AND p.month=9
ORDER BY attendance_rate DESC
LIMIT 5;


-- 2. Department-wise payroll cost for a month
SELE
