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

	// 顺序
	info.SetSortAsc()

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("协议", "protocol", db.Varchar)
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("protocols").SetTitle("协议").SetDescription("登录协议类别")

	formList := protocols.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("协议", "protocol", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("protocols").SetTitle("协议").SetDescription("登录协议类别")

	return protocols
}
