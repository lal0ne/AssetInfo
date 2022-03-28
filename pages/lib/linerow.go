package lib

import (
	"AssetInfo/models"
	"github.com/GoAdminGroup/go-admin/modules/db"
	tmpl "github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/chartjs"
	"github.com/GoAdminGroup/go-admin/template/types"
	"html/template"
	"time"
)

/**************************
 * Box
/**************************/

func GetLineBox(colComp types.ColAttribute) (template.HTML, error) {
	// 获取linelbox表信息
	data, err := db.WithDriver(models.GlobalConn).Table("linelbox").Select("title", "color", "table", "line_tension", "fill").Where("status", "=", "1").All()
	if err != nil {
		return "", err
	}

	recentlyTimeList := getRecentlyTime()
	components := tmpl.Default()

	line := chartjs.Line()
	line.SetID("line-box").
		SetHeight(400).
		SetTitle("最近七天数据").
		SetLabels(recentlyTimeList)

	for _, lineData := range data {
		title := lineData["title"].(string)
		color := chartjs.Color(lineData["color"].(string))
		// chart_color := chartjs.Color(color)
		table := lineData["table"].(string)
		lineTension := float64(lineData["line_tension"].(int64)) / 10
		fill := true
		if lineData["fill"].(int64) == 0 {
			fill = false
		}
		dsData := getRecentlyData(table, recentlyTimeList)
		line.AddDataSet(title).
			DSData(dsData).
			DSFill(fill).
			DSBorderColor(color).
			DSLineTension(lineTension)
	}

	lineChart := line.GetContent()
	boxInternalCol := colComp.SetContent(lineChart).SetSize(types.SizeMD(12)).GetContent()

	boxInternalRow := components.Row().SetContent(boxInternalCol).GetContent()

	boxt := components.Box().WithHeadBorder().
		SetBody(boxInternalRow).
		GetContent()

	boxcol := colComp.SetContent(boxt).SetSize(types.SizeMD(12)).GetContent()

	return boxcol, nil
}

// 查询数据库
func getRecentlyData(table string, recentlyTimeList []string) []float64 {
	var result []float64
	for _, recentlyTime := range recentlyTimeList {
		ptime := recentlyTime + " 00:00:00"
		ntime := recentlyTime + " 23:59:59"
		query := "updated_at >= \"" + ptime + "\" and updated_at <= \"" + ntime + "\""
		data, err := db.WithDriver(models.GlobalConn).Table(table).WhereRaw(query).Count()
		if err != nil {
			result = append(result, 0)
		} else {
			result = append(result, float64(data))
		}
	}
	return result
}

// 获取最近七天日期
func getRecentlyTime() []string {
	nowTime := time.Now()
	var recentlyTimeList []string

	for i := -6; i < 1; i++ {
		getTime := nowTime.AddDate(0, 0, i)
		resTime := getTime.Format("2006-01-02")
		recentlyTimeList = append(recentlyTimeList, resTime)
	}

	return recentlyTimeList
}
