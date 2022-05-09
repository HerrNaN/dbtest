-- +migrate Up
CREATE TABLE region
(
    region_id   SERIAL PRIMARY KEY,
    region_name CHARACTER VARYING(25)
);

-- +migrate Down
-- DROP TABLE IF EXISTS regions;
