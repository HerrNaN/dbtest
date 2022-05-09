-- +migrate Up
CREATE TABLE department
(
    department_id   SERIAL PRIMARY KEY,
    department_name CHARACTER VARYING(30) NOT NULL,
    location_id     INTEGER,
    FOREIGN KEY (location_id) REFERENCES location (location_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- DROP TABLE IF EXISTS departments;