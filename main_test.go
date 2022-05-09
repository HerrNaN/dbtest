package main

import (
	"database/sql"
	"testing"

	"dbtest/postgrestest"

	"dbtest/.gen/postgres/public/model"
	"dbtest/.gen/postgres/public/table"
	"github.com/go-jet/jet/v2/postgres"
	"github.com/stretchr/testify/assert"
)

var db *sql.DB

func TestMain(m *testing.M) {
	var purgeFunc func(int)
	db, purgeFunc = postgrestest.Db()

	//Run tests
	code := m.Run()

	purgeFunc(code)
}

func TestGetCountry(t *testing.T) {
	var (
		region = model.Region{
			RegionID:   12,
			RegionName: Ptr("Sweden"),
		}
		expectedCountry = model.Country{
			CountryID:   "SE",
			CountryName: Ptr("Sweden"),
			RegionID:    region.RegionID,
		}
	)

	_, err := table.Region.INSERT(table.Region.AllColumns).
		MODEL(region).Exec(db)
	assert.NoError(t, err)

	_, err = table.Country.INSERT(table.Country.AllColumns).
		MODEL(expectedCountry).Exec(db)

	res, err := GetCountry(db, "SE")
	assert.NoError(t, err)
	assert.Equal(t, model.Country{
		CountryID:   "SE",
		CountryName: Ptr("Sweden"),
		RegionID:    12,
	}, res)

	_, err = table.Country.DELETE().WHERE(table.Country.CountryID.EQ(postgres.String(expectedCountry.CountryID))).Exec(db)
	assert.NoError(t, err)

	_, err = table.Region.DELETE().WHERE(table.Region.RegionID.EQ(postgres.Int(int64(region.RegionID)))).Exec(db)
	assert.NoError(t, err)
}

func Ptr[T any](t T) *T {
	return &t
}

func SetupSelectTest(stmts ...postgres.InsertStatement) ([]postgres.DeleteStatement, error) {
	panic("implement me")
}
