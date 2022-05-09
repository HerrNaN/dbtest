-- +migrate Up
CREATE TABLE employee
(
    employee_id   SERIAL PRIMARY KEY,
    first_name    CHARACTER VARYING(20),
    last_name     CHARACTER VARYING(25)  NOT NULL,
    email         CHARACTER VARYING(100) NOT NULL,
    phone_number  CHARACTER VARYING(20),
    hire_date     DATE                   NOT NULL,
    job_id        INTEGER                NOT NULL,
    salary        NUMERIC(8, 2)          NOT NULL,
    manager_id    INTEGER,
    department_id INTEGER,
    FOREIGN KEY (job_id) REFERENCES job (job_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (department_id) REFERENCES department (department_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES employee (employee_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- DROP TABLE IF EXISTS employees;