package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetVulTable(ctx *context.Context) table.Table {

	vul := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := vul.GetInfo().HideFilterArea()

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("名称", "name", db.Varchar)
	info.AddField("影响范围", "scope", db.Varchar)
	// TODO
	// 自动对比，信息插入数据库
	/*
		info.AddColumnButtons("自动检查", types.GetColumnButton("启动", icon.Android, action.Ajax("/admin/ajax",
			func(ctx *context.Context) (success bool, msg string, data interface{}) {
				return true, "请求成功，奥利给", ""
			})))
	*/
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("vul").SetTitle("漏洞").SetDescription("漏洞信息")

	formList := vul.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("名称", "name", db.Varchar, form.Text)
	formList.AddField("影响范围", "scope", db.Varchar, form.Text)
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("vul").SetTitle("漏洞").SetDescription("漏洞信息")

	return vul
}
