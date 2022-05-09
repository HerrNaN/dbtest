-- +migrate Up
CREATE TABLE location
(
    location_id    SERIAL PRIMARY KEY,
    street_address CHARACTER VARYING(40),
    postal_code    CHARACTER VARYING(12),
    city           CHARACTER VARYING(30) NOT NULL,
    state_province CHARACTER VARYING(25),
    country_id     CHARACTER(2)          NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country (country_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- +migrate Down
-- DROP TABLE IF EXISTS locations;