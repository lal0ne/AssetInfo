package tables

import (
	"AssetInfo/handlers"
	"AssetInfo/models"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/go-admin/template/types/action"
	"github.com/GoAdminGroup/go-admin/template/types/form"
	"strings"
)

func GetVulTable(ctx *context.Context) table.Table {

	vul := table.NewDefaultTable(table.DefaultConfigWithDriver("mysql"))

	info := vul.GetInfo().HideFilterArea()

	info.AddField("ID", "id", db.Int).FieldSortable()
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
	info.AddField("名称", "name", db.Varchar)
	info.AddField("影响范围", "scope", db.Varchar)
	// TODO
	// 自动对比，信息插入数据库
	/* 在表单中创建字段按钮
	 * =========================================
	 * 吐槽
	 * 这种方式应该最符合预期
	 * 不过无法获取到当前行的id数据，除非你先选中再点击
	 * https://github.com/GoAdminGroup/go-admin/issues/323
	 * 2020年08月31日，就有人提交了，现在还没解决
	 * =========================================
	 */
	// url := "/admin/data"
	//	info.AddColumnButtons("自动检查", types.GetColumnButton("启动", icon.Android, action.Ajax(url,
	//		handlers.AutoCheck)))

	// 添加进操作列表中
	// 存在该漏洞或者待处理，没有做更精确的处理
	info.AddActionButton("自动检查", action.Ajax("/admin/data",
		handlers.AutoCheck))

	info.AddField("创建日期", "created_at", db.Timestamp).FieldHide()
	info.AddField("更新日期", "updated_at", db.Timestamp)

	info.SetTable("vul").SetTitle("漏洞").SetDescription("漏洞信息")

	formList := vul.GetForm()
	formList.AddField("ID", "id", db.Int, form.Default).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
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
	formList.AddField("名称", "name", db.Varchar, form.Text).FieldTrimSpace()
	formList.AddField("影响范围", "scope", db.Varchar, form.Text).
		FieldHelpMsg("以中文 、 做分割").
		FieldPostFilterFn(func(value types.PostFieldModel) interface{} {
			allValue := value.Value.Value()
			var flag bool
			if flag = strings.Contains(allValue, ","); flag {
				allValue = strings.ReplaceAll(allValue, ",", "、")
			}
			if flag = strings.Contains(allValue, "，"); flag {
				allValue = strings.ReplaceAll(allValue, "，", "、")
			}
			if flag = strings.Contains(allValue, "\r\n"); flag {
				allValue = strings.ReplaceAll(allValue, "\r\n", "、")
			}
			return allValue
		}).FieldTrimSpace()
	formList.AddField("创建日期", "created_at", db.Timestamp, form.Datetime).FieldDisplayButCanNotEditWhenUpdate().FieldNotAllowAdd()
	formList.AddField("更新日期", "updated_at", db.Timestamp, form.Datetime).FieldNotAllowAdd()

	formList.SetTable("vul").SetTitle("漏洞").SetDescription("漏洞信息")

	return vul
}
