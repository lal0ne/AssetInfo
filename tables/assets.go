package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetAssetsTable(ctx *context.Context) table.Table {

	assets := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := assets.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Name", "name", db.Varchar)
	info.AddField("Version", "version", db.Varchar)
	info.AddField("Ip", "ip", db.Varchar)
	info.AddField("Uname", "uname", db.Varchar)
	info.AddField("Passwd", "passwd", db.Varchar)
	info.AddField("Protocol_id", "protocol_id", db.Int)
	info.AddField("Group_id", "group_id", db.Int)
	info.AddField("Created_at", "created_at", db.Timestamp)
	info.AddField("Updated_at", "updated_at", db.Timestamp)

	info.SetTable("assets").SetTitle("Assets").SetDescription("Assets")

	formList := assets.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Name", "name", db.Varchar, form.Text)
	formList.AddField("Version", "version", db.Varchar, form.Text)
	formList.AddField("Ip", "ip", db.Varchar, form.Ip)
	formList.AddField("Uname", "uname", db.Varchar, form.Text)
	formList.AddField("Passwd", "passwd", db.Varchar, form.Text)
	formList.AddField("Protocol_id", "protocol_id", db.Int, form.Number)
	formList.AddField("Group_id", "group_id", db.Int, form.Number)
	formList.AddField("Created_at", "created_at", db.Timestamp, form.Datetime)
	formList.AddField("Updated_at", "updated_at", db.Timestamp, form.Datetime)

	formList.SetTable("assets").SetTitle("Assets").SetDescription("Assets")

	return assets
}
