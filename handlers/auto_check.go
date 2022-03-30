package handlers

import (
	"AssetInfo/models"
	"github.com/GoAdminGroup/go-admin/context"
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/modules/db/dialect"
	"strconv"
	"strings"
)

// 自动比对下软件版本
func AutoCheck(ctx *context.Context) (success bool, msg string, data interface{}) {
	// 获取并处理参数
	id := ctx.FormValue("id")
	if id == "" {
		return false, "参数为空", ""
	}
	queryId, err := strconv.ParseInt(id, 10, 64)
	if err != nil {
		return false, "参数格式不正确", ""
	}

	// 获取漏洞情况
	vulDate, vulErr := db.WithDriver(models.GlobalConn).Table("vul").Select("software_id", "scope").Where("id", "=", queryId).First()
	if vulErr != nil {
		return false, "未查询到漏洞相关信息", ""
	}
	softwareId := vulDate["software_id"].(int64)
	scope := strings.Split(vulDate["scope"].(string), "、")

	// 获取软件情况
	softwareDatas, softwareErr := db.WithDriver(models.GlobalConn).Table("software_list").Select("assets_id", "version").Where("software_id", "=", softwareId).All()
	if softwareErr != nil || len(softwareDatas) < 1 {
		return true, "未查询到所用软件含有该漏洞", ""
	}

	// 对比处理数据
	for _, softwareData := range softwareDatas {
		assetsId := softwareData["assets_id"].(int64)
		version := softwareData["version"].(string)
		if ArrContionsString(version, scope) {
			db.WithDriver(models.GlobalConn).Table("leak").
				Insert(dialect.H{
					"assets_id": assetsId,
					"vul_id":    queryId,
					"result":    1,
				})
			continue
		}
		db.WithDriver(models.GlobalConn).Table("leak").
			Insert(dialect.H{
				"assets_id": assetsId,
				"vul_id":    queryId,
				"result":    3,
			})
	}

	return true, "已处理", ""
}

// 数组是否包含特定字符串
func ArrContionsString(value string, arr []string) bool {
	for _, index := range arr {
		if value == strings.TrimSpace(index) {
			return true
		}
	}
	return false
}
