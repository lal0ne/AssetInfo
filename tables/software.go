package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetSoftwareTable(ctx *context.Context) table.Table {

	software := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := software.GetInfo().HideFilterArea()

	info.SetSortAsc()

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("名称", "name", db.Varchar)
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("software").SetTitle("软件").SetDescription("软件名称")

	formList := software.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("名称", "name", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("software").SetTitle("软件").SetDescription("软件名称")

	return software
}
