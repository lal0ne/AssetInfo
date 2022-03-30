package tables

import (
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/GoAdminGroup/go-admin/template/types"
	"strconv"

	"AssetInfo/models"
)

// 获取协议选项
func GetAllProtocols() types.FieldOptions {
	data := types.FieldOptions{}
	protocols, err := db.WithDriver(models.GlobalConn).Table("protocols").Select("id", "protocol").All()
	if err != nil {
		return data
	}
	for _, protocol := range protocols {
		data = append(data, types.FieldOption{Text: protocol["protocol"].(string), Value: strconv.FormatInt(protocol["id"].(int64), 10)})
	}
	return data
}

// 获取资产组信息
func GetAllAssetsGroup() types.FieldOptions {
	data := types.FieldOptions{}
	assetsGroups, err := db.WithDriver(models.GlobalConn).Table("assets_group").Select("id", "group").All()
	if err != nil {
		return data
	}
	for _, assetsGroup := range assetsGroups {
		data = append(data, types.FieldOption{Text: assetsGroup["group"].(string), Value: strconv.FormatInt(assetsGroup["id"].(int64), 10)})
	}
	return data
}

// 获取软件信息
func GatAllSoftware() types.FieldOptions {
	data := types.FieldOptions{}
	softwares, err := db.WithDriver(models.GlobalConn).Table("software").Select("id", "name").All()
	if err != nil {
		return data
	}
	for _, software := range softwares {
		data = append(data, types.FieldOption{Text: software["name"].(string), Value: strconv.FormatInt(software["id"].(int64), 10)})
	}
	return data
}

// 获取资产信息IP
func GatAllAssetsIP() types.FieldOptions {
	data := types.FieldOptions{}
	softwares, err := db.WithDriver(models.GlobalConn).Table("assets").Select("id", "ip").All()
	if err != nil {
		return data
	}
	for _, software := range softwares {
		data = append(data, types.FieldOption{Text: software["ip"].(string), Value: strconv.FormatInt(software["id"].(int64), 10)})
	}
	return data
}

/*
// 获取资产信息Name
func GatAllAssetsName() types.FieldOptions {
	data := types.FieldOptions{}
	softwares, err := db.WithDriver(models.GlobalConn).Table("assets").Select("id", "name").All()
	if err != nil {
		return data
	}
	for _, software := range softwares {
		data = append(data, types.FieldOption{Text: software["name"].(string), Value: strconv.FormatInt(software["id"].(int64), 10)})
	}
	return data
}
*/

// 获取漏洞信息
func GatAllVul() types.FieldOptions {
	data := types.FieldOptions{}
	vuls, err := db.WithDriver(models.GlobalConn).Table("vul").Select("id", "name").All()
	if err != nil {
		return data
	}
	for _, vul := range vuls {
		data = append(data, types.FieldOption{Text: vul["name"].(string), Value: strconv.FormatInt(vul["id"].(int64), 10)})
	}
	return data
}
