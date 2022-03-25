package lib

import (
	"AssetInfo/models"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/template/types"
	"github.com/GoAdminGroup/themes/adminlte/components/smallbox"
	"html/template"
	"strconv"
)

/**************************
 * Small Box
/**************************/

// 获取Small Box情况
func getSmallBoxInfo(table, query string) string {
	var count int64
	var err error
	if query == "" {
		count, err = db.WithDriver(models.GlobalConn).Table(table).Count()
	} else {
		count, err = db.WithDriver(models.GlobalConn).Table(table).WhereRaw(query).Count()
	}

	if err != nil {
		return "0"
	}
	data := strconv.FormatInt(count, 10)
	return data
}

// 获取仪表盘信息
func GetSamllBox(colComp types.ColAttribute) (template.HTML, error) {
	// 获取smallbox表信息
	data, err := db.WithDriver(models.GlobalConn).Table("smallbox").Select("title", "icon", "url", "color", "table", "query").Where("status", "=", "1").All()
	if err != nil {
		return "", err
	}

	// 设置长宽
	var size = types.SizeMD(3).SM(6).XS(12)

	var col template.HTML
	// 设置面板
	for _, smallboxdata := range data {
		title := smallboxdata["title"].(string)
		icon := smallboxdata["icon"].(string)
		url := smallboxdata["url"].(string)
		color := smallboxdata["color"].(string)
		table := smallboxdata["table"].(string)
		query := smallboxdata["query"].(string)
		value := getSmallBoxInfo(table, query)
		smallboxinfo := smallbox.New().SetColor(template.HTML(color)).SetIcon(template.HTML(icon)).SetUrl(url).SetTitle(template.HTML(title)).SetValue(template.HTML(value)).GetContent()
		col += colComp.SetSize(size).SetContent(smallboxinfo).GetContent()
	}
	return col, nil
}
