package main

import (
	"database/sql"

	. "dbtest/.gen/postgres/public/table"
	. "github.com/go-jet/jet/v2/postgres"

	"dbtest/.gen/postgres/public/model"
)

func main() {}

func GetCountry(db *sql.DB, countryID string) (model.Country, error) {
	stmt := SELECT(Country.AllColumns).
		FROM(Country).
		WHERE(Country.CountryID.EQ(String(countryID)))

	var country model.Country

	err := stmt.Query(db, &country)
	if err != nil {
		return model.Country{}, err
	}

	return country, nil
}
