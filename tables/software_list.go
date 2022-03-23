package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetSoftwareListTable(ctx *context.Context) table.Table {

	softwareList := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := softwareList.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Assets_id", "assets_id", db.Int)
	info.AddField("Software_id", "software_id", db.Int)
	info.AddField("Version", "version", db.Varchar)
	info.AddField("Created_at", "created_at", db.Timestamp)
	info.AddField("Updated_at", "updated_at", db.Timestamp)

	info.SetTable("software_list").SetTitle("SoftwareList").SetDescription("SoftwareList")

	formList := softwareList.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Assets_id", "assets_id", db.Int, form.Number)
	formList.AddField("Software_id", "software_id", db.Int, form.Number)
	formList.AddField("Version", "version", db.Varchar, form.Text)
	formList.AddField("Created_at", "created_at", db.Timestamp, form.Datetime)
	formList.AddField("Updated_at", "updated_at", db.Timestamp, form.Datetime)

	formList.SetTable("software_list").SetTitle("SoftwareList").SetDescription("SoftwareList")

	return softwareList
}
