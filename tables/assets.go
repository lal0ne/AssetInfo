package tables

import (
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	editType "github.com/GoAdminGroup/go-admin/template/types/table"

	"AssetInfo/models"
)

func GetAssetsTable(ctx *context.Context) table.Table {

	assets := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := assets.GetInfo().SetFilterFormLayout(form.LayoutThreeCol)

	// 倒序
	info.SetSortDesc()

	// 可排序列
	info.AddField("ID", "id", db.Int).FieldSortable()
	info.AddField("名称", "name", db.Varchar).
		FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	info.AddField("版本", "version", db.Varchar)
	// 模糊搜索
	info.AddField("IP", "ip", db.Varchar).
		FieldFilterable(types.FilterType{Operator: types.FilterOperatorLike})
	// 添加复制按钮
	info.AddField("用户名", "uname", db.Varchar).FieldCopyable()
	info.AddField("密码", "passwd", db.Varchar).FieldCopyable()

	// 后台登陆协议
	// 修改协议显示信息
	// 设置晒选
	info.AddField("协议", "protocol_id", db.Int).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != "" {
			data, err := db.WithDriver(models.GlobalConn).Table("protocols").Select("protocol").Where("id", "=", model.Value).First()
			if err != nil {
				return ""
			}
			return data["protocol"]
		}
		return ""
	}).FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(GetAllProtocols())

	// 修改资产组显示信息
	info.AddField("资产组", "group_id", db.Int).FieldDisplay(func(model types.FieldModel) interface{} {
		if model.Value != "0" || model.Value != " " {
			data, err := db.WithDriver(models.GlobalConn).Table("assets_group").Select("group").Where("id", "=", model.Value).First()
			if err != nil {
				return ""
			}
			return data["group"]
		}
		return ""
	}).FieldEditAble(editType.Select).FieldEditOptions(GetAllAssetsGroup()).
		FieldFilterable(types.FilterType{FormType: form.SelectSingle}).FieldFilterOptions(GetAllAssetsGroup())
	// 隐藏创建日期
	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	// 设置时间范围查询
	info.AddField("更新日期", "updated_at", db.Timestamp).FieldFilterable(types.FilterType{FormType: form.DatetimeRange})

	info.SetTable("assets").SetTitle("资产").SetDescription("资产信息")

	formList := assets.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("名称", "name", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("版本", "version", db.Varchar, form.Text).FieldTrimSpace()
	// 设置必须输入
	formList.AddField("IP", "ip", db.Varchar, form.Ip).FieldMust()
	formList.AddField("用户名", "uname", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("密码", "passwd", db.Varchar, form.Text)
	formList.AddField("协议", "protocol_id", db.Int, form.SelectSingle).
		FieldOptionInitFn(func(val types.FieldModel) types.FieldOptions {

			if val.Value == "" {
				return GetAllProtocols()
			}
			data, err := db.WithDriver(models.GlobalConn).Table("protocols").Select("protocol").Where("id", "=", val.Value).First()
			if err != nil {
				return types.FieldOptions{}
			}
			return types.FieldOptions{
				{Value: val.Value, Text: data["protocol"].(string), Selected: true},
			}
		})

	formList.AddField("资产组", "group_id", db.Int, form.SelectSingle).
		FieldOptionInitFn(func(val types.FieldModel) types.FieldOptions {

			if val.Value == "" {
				return GetAllAssetsGroup()
			}

			data, err := db.WithDriver(models.GlobalConn).Table("assets_group").Select("group").Where("id", "=", val.Value).First()
			if err != nil {
				return types.FieldOptions{}
			}
			return types.FieldOptions{
				{Value: val.Value, Text: data["group"].(string), Selected: true},
			}
		})

	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("assets").SetTitle("资产").SetDescription("资产信息")

	return assets
}
