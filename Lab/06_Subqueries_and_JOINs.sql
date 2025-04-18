CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name varchar(20))
RETURNS int AS
$$
    DECLARE
        town_count int;
    BEGIN
        SELECT
            count(*)
        from employees as e JOIN addresses as a USING (address_id)
            join towns as t USING (town_id)
        WHERE t.name = town_name INTO town_count;
        RETURN town_count;
    END
$$
LANGUAGE plpgsql
;



CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name varchar)
AS
$$
    BEGIN
        UPDATE employees
        SET salary = salary * 1.05
        WHERE department_id =
        (SELECT  department_id FROM departments WHERE name = department_name)
        ;
    END
$$
LANGUAGE plpgsql;



CREATE or REPLACE PROCEDURE sp_increase_salary_by_id(id int)
AS
$$
    BEGIN
        IF (SELECT employee_id from employees WHERE employee_id = id) IS NULL THEN
            RETURN;
        END IF;
        UPDATE employees set salary = salary * 1.05 WHERE employee_id = id;
        COMMIT;
    END;
$$
LANGUAGE plpgsql



CREATE TABLE  deleted_employees(
    employee_id SERIAL PRIMARY KEY,
    first_name varchar(20),
    last_name varchar(20),
    middle_name varchar(20),
    job_title varchar(50),
    department_id int,
    salary numeric(19, 4)
);

CREATE or REPLACE FUNCTION backup_fired_employees()
RETURNS TRIGGER
AS
$$
    BEGIN
        INSERT INTO deleted_employees (
        first_name, last_name, middle_name, job_title, department_id, salary
        )
        VALUES (
            old.first_name,
            old.last_name,
            old.middle_name,
            old.job_title,
            old.department_id,
            old.salary
        );
        RETURN old;
    END
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER  backup_employees_trigger
AFTER DELETE on employees
FOR EACH ROW EXECUTE PROCEDURE backup_fired_employees()
;