SELECT
    t.town_id,
    t.name,
    a.address_text as town_name
FROM towns as t join addresses as a ON t.town_id = a.town_id
WHERE t.name in ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.town_id, a.address_id



SELECT
    e.employee_id,
    concat(e.first_name, ' ', e.last_name) as full_name,
    d.department_id,
    d.name
FROM employees as e join departments as d
    ON e.employee_id = d.manager_id
ORDER BY e.employee_id
LIMIT 5



SELECT
    e.employee_id,
    concat(e.first_name, ' ', last_name) as full_name,
    p.project_id,
    p.name as project_name
FROM employees as e join employees_projects as ep USING (employee_id)
    JOIN projects as p USING (project_id)
WHERE p.project_id = 1



SELECT count(*) FROM employees
WHERE salary > (SELECT avg(salary) FROM employees)