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

	info.SetSortAsc()

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("资产组", "group", db.Varchar)
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("assets_group").SetTitle("资产组").SetDescription("资产组类别")

	formList := assetsGroup.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("资产组", "group", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("assets_group").SetTitle("资产组").SetDescription("资产组类别")

	return assetsGroup
}
