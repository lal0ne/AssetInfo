package tables

import (
	"AssetInfo/models"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	editType "github.com/GoAdminGroup/go-admin/template/types/table"
)

func GetLeakTable(ctx *context.Context) table.Table {

	leak := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := leak.GetInfo().SetFilterFormLayout(form.LayoutThreeCol)

	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("资产", "assets_id", db.Int).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("assets").Select("name").Where("id", "=", model.Value).First()
			if err != nil {
				return ""
			}
			return data["name"]
		}
		return ""
	})
	info.AddField("版本", "version", db.Varchar).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("assets").Select("version").Where("id", "=", model.Row["assets_id"]).First()
			if err != nil {
				return ""
			}
			return data["version"]
		}
		return ""
	})
	info.AddField("IP", "ip", db.Varchar).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("assets").Select("ip").Where("id", "=", model.Row["assets_id"]).First()
			if err != nil {
				return ""
			}
			return data["ip"]
		}
		return ""
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(GatAllAssetsIP())
	info.AddField("漏洞", "vul_id", db.Int).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("vul").Select("name").Where("id", "=", model.Value).First()
			if err != nil {
				return ""
			}
			return data["name"]
		}
		return ""
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(GatAllVul())
	info.AddField("结果", "result", db.Int).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value == "1" {
			return "存在"
		}
		if model.Value == "2" {
			return "不存在"
		}
		return "待确认"
	}).FieldEditAble(editType.Select).FieldEditOptions(types.FieldOptions{
		{Value: "1", Text: "存在"},
		{Value: "2", Text: "不存在"},
		{Value: "3", Text: "待确认"},
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(types.FieldOptions{
		{Value: "1", Text: "存在"},
		{Value: "2", Text: "不存在"},
		{Value: "3", Text: "待确认"},
	})
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("leak").SetTitle("漏洞检测").SetDescription("漏洞检测")

	formList := leak.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("资产", "assets_id", db.Int, form.SelectSingle).
		FieldOptionInitFn(func(val types.FieldModel) types.FieldOptions {

			if val.Value == "" {
				return GatAllAssetsIP()
			}

			data, err := db.WithDriver(models.GlobalConn).Table("assets").Select("ip").Where("id", "=", val.Value).First()
			if err != nil {
				return types.FieldOptions{}
			}
			return types.FieldOptions{
				{Value: val.Value, Text: data["ip"].(string), Selected: true},
			}
		})
	formList.AddField("漏洞", "vul_id", db.Int, form.SelectSingle).
		FieldOptionInitFn(func(val types.FieldModel) types.FieldOptions {

			if val.Value == "" {
				return GatAllVul()
			}

			data, err := db.WithDriver(models.GlobalConn).Table("vul").Select("name").Where("id", "=", val.Value).First()
			if err != nil {
				return types.FieldOptions{}
			}
			return types.FieldOptions{
				{Value: val.Value, Text: data["name"].(string), Selected: true},
			}
		})
	formList.AddField("结果", "result", db.Int, form.SelectSingle).
		FieldOptionInitFn(func(val types.FieldModel) types.FieldOptions {
			if val.Value == "" {
				return types.FieldOptions{
					{Text: "存在", Value: "1"},
					{Text: "不存在", Value: "2"},
					{Text: "待确认", Value: "3"},
				}
			}
			return types.FieldOptions{
				{Value: val.Value, Text: val.Value, Selected: true},
			}
		})
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("leak").SetTitle("漏洞检测").SetDescription("漏洞检测")

	return leak
}
