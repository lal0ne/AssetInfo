package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetProtocolsTable(ctx *context.Context) table.Table {

	protocols := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := protocols.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Protocol", "protocol", db.Varchar)
	info.AddField("Created_at", "created_at", db.Timestamp)
	info.AddField("Updated_at", "updated_at", db.Timestamp)

	info.SetTable("protocols").SetTitle("Protocols").SetDescription("Protocols")

	formList := protocols.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Protocol", "protocol", db.Varchar, form.Text)
	formList.AddField("Created_at", "created_at", db.Timestamp, form.Datetime)
	formList.AddField("Updated_at", "updated_at", db.Timestamp, form.Datetime)

	formList.SetTable("protocols").SetTitle("Protocols").SetDescription("Protocols")

	return protocols
}
