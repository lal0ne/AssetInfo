package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetLeakTable(ctx *context.Context) table.Table {

	leak := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := leak.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Assets_id", "assets_id", db.Int)
	info.AddField("Vul_id", "vul_id", db.Int)
	info.AddField("Result", "result", db.Int)
	info.AddField("Created_at", "created_at", db.Timestamp)
	info.AddField("Updated_at", "updated_at", db.Timestamp)

	info.SetTable("leak").SetTitle("Leak").SetDescription("Leak")

	formList := leak.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Assets_id", "assets_id", db.Int, form.Number)
	formList.AddField("Vul_id", "vul_id", db.Int, form.Number)
	formList.AddField("Result", "result", db.Int, form.Number)
	formList.AddField("Created_at", "created_at", db.Timestamp, form.Datetime)
	formList.AddField("Updated_at", "updated_at", db.Timestamp, form.Datetime)

	formList.SetTable("leak").SetTitle("Leak").SetDescription("Leak")

	return leak
}
