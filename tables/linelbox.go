package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	editType "github.com/GoAdminGroup/go-admin/template/types/table"
	"strconv"
)

func GetLinelboxTable(ctx *context.Context) table.Table {

	linelbox := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := linelbox.GetInfo().HideFilterArea()

	// 隐藏导出按钮
	info.HideExportButton()
	// 顺序
	info.SetSortAsc()

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("名称", "title", db.Varchar)
	info.AddField("颜色", "color", db.Varchar)
	info.AddField("数据表", "table", db.Varchar)
	info.AddField("光滑度", "line_tension", db.Int)
	info.AddField("填充", "fill", db.Tinyint).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value == "0" {
			return "否"
		}
		if model.Value == "1" {
			return "是"
		}
		return "unknown"
	}).FieldEditAble(editType.Switch).FieldEditOptions(types.FieldOptions{
		{Value: "0", Text: "否"},
		{Value: "1", Text: "是"},
	})
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
	info.AddField("创建时间", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新时间", "updated_at", db.Timestamp)

	info.SetTable("linelbox").SetTitle("仪表盘").SetDescription("Linelbox")

	formList := linelbox.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("名称", "title", db.Varchar, form.Text)
	formList.AddField("颜色", "color", db.Varchar, form.Color)
	formList.AddField("数据表", "table", db.Varchar, form.Text)
	formList.AddField("光滑度", "line_tension", db.Int, form.Number).
		FieldPostFilterFn(func(value types.PostFieldModel) interface{} {
			v, err := strconv.Atoi(value.Value[0])
			if err != nil {
				return "1"
			}
			if v > 0 && v <= 10 {
				return value.Value[0]
			}
			return "1"
		}).FieldDefault("1").FieldHelpMsg("1-10，数字越大，曲线越光滑")
	formList.AddField("填充", "fill", db.Tinyint, form.Radio).
		FieldOptions(types.FieldOptions{
			{Text: "否", Value: "0"},
			{Text: "是", Value: "1"},
		}).FieldDefault("0").FieldHelpMsg("是：采用填充模式，否：采用折线模式")
	formList.AddField("状态", "status", db.Tinyint, form.Radio).
		FieldOptions(types.FieldOptions{
			{Text: "禁用", Value: "0"},
			{Text: "启用", Value: "1"},
		}).FieldDefault("1")
	formList.AddField("创建时间", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新时间", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("linelbox").SetTitle("仪表盘").SetDescription("Linelbox")

	return linelbox
}
