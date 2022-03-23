package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetAssetsGroupTable(ctx *context.Context) table.Table {

	assetsGroup := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := assetsGroup.GetInfo().HideFilterArea()

	info.AddField("Id", "id", db.Int).
		FieldFilterable()
	info.AddField("Group", "group", db.Varchar)
	info.AddField("Created_at", "created_at", db.Timestamp)
	info.AddField("Updated_at", "updated_at", db.Timestamp)

	info.SetTable("assets_group").SetTitle("AssetsGroup").SetDescription("AssetsGroup")

	formList := assetsGroup.GetForm()
	formList.AddField("Id", "id", db.Int, form.Default)
	formList.AddField("Group", "group", db.Varchar, form.Text)
	formList.AddField("Created_at", "created_at", db.Timestamp, form.Datetime)
	formList.AddField("Updated_at", "updated_at", db.Timestamp, form.Datetime)

	formList.SetTable("assets_group").SetTitle("AssetsGroup").SetDescription("AssetsGroup")

	return assetsGroup
}
