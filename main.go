package main

import (
	"gorm.io/driver/sqlite"
	"gorm.io/gen"
	"gorm.io/gorm"
)

func main() {
	g := gen.NewGenerator(gen.Config{
		OutPath:           "./query",
		Mode:              gen.WithoutContext | gen.WithDefaultQuery | gen.WithQueryInterface,
		FieldWithIndexTag: true,
		FieldWithTypeTag:  true,
		FieldNullable:     true,
	})

	db, _ := gorm.Open(sqlite.Open("gorm.db"))
	g.UseDB(db)
	all := g.GenerateAllTable()

	g.ApplyBasic(all...)
	g.Execute()
}
