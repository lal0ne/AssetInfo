package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	editType "github.com/GoAdminGroup/go-admin/template/types/table"
)

func GetSmallboxTable(ctx *context.Context) table.Table {

	smallbox := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := smallbox.GetInfo().HideFilterArea()

	// 隐藏导出按钮
	info.HideExportButton()
	// 顺序
	info.SetSortAsc()

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("标题", "title", db.Varchar)
	info.AddField("ICON", "icon", db.Varchar)
	info.AddField("URL", "url", db.Varchar)
	info.AddField("颜色", "color", db.Varchar)
	info.AddField("数据表", "table", db.Varchar)
	info.AddField("查询", "query", db.Varchar)
	info.AddField("状态", "status", db.Tinyint).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value == "0" {
			return "禁用"
		}
		if model.Value == "1" {
			return "启用"
		}
		return "unknown"
	}).FieldEditAble(editType.Switch).FieldEditOptions(types.FieldOptions{
		{Value: "0", Text: "禁用"},
		{Value: "1", Text: "启用"},
	})
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("smallbox").SetTitle("仪表盘").SetDescription("SmallBox")

	formList := smallbox.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("标题", "title", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("ICON", "icon", db.Varchar, form.Text).FieldHelpMsg("SmallBox中Icon属性").FieldTrimSpace()
	formList.AddField("URL", "url", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("颜色", "color", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("数据表", "table", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("查询", "query", db.Varchar, form.Text).FieldHelpMsg("针对以上数据库的查询语句，默认为空").FieldTrimSpace()
	formList.AddField("状态", "status", db.Tinyint, form.Radio).
		FieldOptions(types.FieldOptions{
			{Text: "禁用", Value: "0"},
			{Text: "启用", Value: "1"},
		}).FieldDefault("1")
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("smallbox").SetTitle("仪表盘").SetDescription("SmallBox")

	return smallbox
}
