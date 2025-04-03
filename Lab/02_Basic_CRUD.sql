SELECT
    id,
    concat(first_name, ' ', last_name) AS "Full Name",
    job_title AS "Job Title"
FROM employees



SELECT
    id,
    concat(first_name, ' ', last_name) AS full_name,
    job_title,
    salary
FROM employees
WHERE salary >= 1000
ORDER BY id
;



SELECT
    id,
    first_name,
    last_name,
    job_title,
    department_id,
    salary
FROM employees
WHERE department_id = 4 and salary >= 1000
ORDER BY id
;



INSERT INTO employees (first_name, last_name, job_title, department_id, salary)
VALUES
    ('Samantha', 'Young', 'Housekeeping', 4, 900),
    ('Roger', 'Palmer', 'Waiter', 3, 928.33)
;
SELECT * FROM employees
;



UPDATE employees
SET salary = salary + 100
WHERE job_title = 'Manager'
;
SELECT * FROM employees
WHERE job_title = 'Manager'
;




DELETE FROM employees
WHERE department_id IN (1, 2)
;
SELECT * FROM employees
ORDER BY id
;



CREATE VIEW top_paid_employee_set AS
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1
;
SELECT * FROM top_paid_employee_set;

SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE datname = 'tes_db'
and pid <> pg_backend_pid()
;