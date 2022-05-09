-- +migrate Up
CREATE TABLE country
(
    country_id   CHARACTER(2) PRIMARY KEY,
    country_name CHARACTER VARYING(40),
    region_id    INTEGER NOT NULL,
    FOREIGN KEY (region_id) REFERENCES region (region_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- DROP TABLE IF EXISTS countries;