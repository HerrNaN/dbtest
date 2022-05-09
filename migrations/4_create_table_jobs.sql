-- +migrate Up
CREATE TABLE job
(
    job_id     SERIAL PRIMARY KEY,
    job_title  CHARACTER VARYING(35) NOT NULL,
    min_salary NUMERIC(8, 2),
    max_salary NUMERIC(8, 2)
);

-- +migrate Down
-- DROP TABLE IF EXISTS jobs;