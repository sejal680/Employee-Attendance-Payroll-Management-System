USE employee_payroll;


-- Stored procedure: calculate payroll for a given month
DELIMITER $$
DROP PROCEDURE IF EXISTS calculate_monthly_payroll$$
CREATE PROCEDURE calculate_monthly_payroll(IN p_year INT, IN p_month INT)
BEGIN
DECLARE done INT DEFAULT FALSE;
DECLARE v_emp_id INT;
DECLARE v_base_salary DECIMAL(12,2);
DECLARE cur CURSOR FOR SELECT emp_id, base_salary FROM employees WHERE is_active = TRUE;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;


OPEN cur;
read_loop: LOOP
FETCH cur INTO v_emp_id, v_base_salary;
IF done THEN
LEAVE read_loop;
END IF;


-- Calculate working days in month (exclude weekends simple approach: use DAYOFMONTH)
SET @total_days = DAY(LAST_DAY(CONCAT(p_year,'-',LPAD(p_month,2,'0'),'-01')));


-- For simplicity assume working days = total days - (weekends estimate 8). For production, use calendar table.
SET @working_days = @total_days - 8;


-- Count days present
SELECT COUNT(*) INTO @days_present FROM attendance
WHERE emp_id = v_emp_id AND YEAR(attendance_date)=p_year AND MONTH(attendance_date)=p_month AND status='Present';


-- Count unpaid leaves
SELECT COALESCE(SUM(DATEDIFF(LEAST(end_date, LAST_DAY(CONCAT(p_year,'-',LPAD(p_month,2,'0'),'-01'))),
GREATEST(start_date, CONCAT(p_year,'-',LPAD(p_month,2,'0'),'-01')) ) + 1),0)
INTO @unpaid_leaves
FROM leaves
WHERE emp_id = v_emp_id AND leave_type='Unpaid' AND NOT (end_date < CONCAT(p_year,'-',LPAD(p_month,2,'0'),'-01') OR start_date > LAST_DAY(CONCAT(p_year,'-',LPAD(p_month,2,'0'),'-01')));


-- Simple bonus rule: if days_present >= 0.9 * working_days give 5% bonus
IF @working_days > 0 AND @days_present >= 0.9 * @working_days THEN
SET @bonus = ROUND(v_base_salary * 0.05,2);
ELSE
SET @bonus = 0;
END IF;
