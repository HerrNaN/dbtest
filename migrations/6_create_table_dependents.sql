-- +migrate Up
CREATE TABLE dependent
(
    dependent_id SERIAL PRIMARY KEY,
    first_name   CHARACTER VARYING(50) NOT NULL,
    last_name    CHARACTER VARYING(50) NOT NULL,
    relationship CHARACTER VARYING(25) NOT NULL,
    employee_id  INTEGER               NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- +migrate Down
-- DROP TABLE IF EXISTS dependents;