package tables

import (
	"AssetInfo/models"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
)

func GetSoftwareListTable(ctx *context.Context) table.Table {

	softwareList := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := softwareList.GetInfo().SetFilterFormLayout(form.LayoutThreeCol).HideFilterArea()

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
	info.AddField("IP", "ip", db.Varchar).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("assets").Select("ip").Where("id", "=", model.Row["assets_id"].(string)).First()
			if err != nil {
				return ""
			}
			return data["ip"]
		}
		return ""
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(GatAllAssetsIP())
	info.AddField("软件", "software_id", db.Int).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("software").Select("name").Where("id", "=", model.Value).First()
			if err != nil {
				return ""
			}
			return data["name"]
		}
		return ""
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(GetAllAssetsGroup())
	info.AddField("版本", "version", db.Varchar)
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("software_list").SetTitle("软件").SetDescription("资产的软件列表")

	formList := softwareList.GetForm()
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
	formList.AddField("软件", "software_id", db.Int, form.SelectSingle).
		FieldOptionInitFn(func(val types.FieldModel) types.FieldOptions {

			if val.Value == "" {
				return GatAllSoftware()
			}

			data, err := db.WithDriver(models.GlobalConn).Table("software").Select("name").Where("id", "=", val.Value).First()
			if err != nil {
				return types.FieldOptions{}
			}
			return types.FieldOptions{
				{Value: val.Value, Text: data["name"].(string), Selected: true},
			}
		})
	formList.AddField("版本", "version", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("software_list").SetTitle("软件").SetDescription("资产的软件列表")

	return softwareList
}
