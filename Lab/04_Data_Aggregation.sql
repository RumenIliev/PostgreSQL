SELECT
    department_id,
    count(department_id)
FROM employees
GROUP BY department_id
ORDER BY department_id



SELECT
    department_id,
    count(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id



SELECT
    department_id,
    sum(salary) as total_salaries
FROM employees
GROUP BY department_id
ORDER BY department_id



SELECT
    department_id,
    max(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id



SELECT
    department_id,
    min(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id




SELECT
    department_id,
    avg(salary)
FROM employees
GROUP BY department_id
ORDER BY department_id



SELECT
    department_id,
    sum(salary)
FROM employees
GROUP BY department_id
HAVING sum(salary) < 4200
ORDER BY department_id



SELECT
    id,
    first_name,
    last_name,
    round(salary, 2),
    department_id,
    CASE
        WHEN department_id = 1 THEN 'Management'
        WHEN department_id = 2 THEN 'Kitchen Staff'
        WHEN department_id = 3 THEN 'Service Staff'
        ELSE 'Other'
    END as department_name
FROM employees
ORDER BY id