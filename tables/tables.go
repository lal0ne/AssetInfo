// This file is generated by GoAdmin CLI adm.
package tables

import "github.com/GoAdminGroup/go-admin/plugins/admin/modules/table"

// Generators is a map of table models.
//
// The key of Generators is the prefix of table info url.
// The corresponding value is the Form and Table data.
//
// http://{{config.Domain}}:{{Port}}/{{config.Prefix}}/info/{{key}}
//
// example:
//
// "assets" => http://localhost:9033/admin/info/assets
// "assets_group" => http://localhost:9033/admin/info/assets_group
// "leak" => http://localhost:9033/admin/info/leak
// "protocols" => http://localhost:9033/admin/info/protocols
// "software" => http://localhost:9033/admin/info/software
// "software_list" => http://localhost:9033/admin/info/software_list
// "vul" => http://localhost:9033/admin/info/vul
// "smallbox" => http://localhost:9033/admin/info/smallbox
// "linelbox" => http://localhost:9033/admin/info/linelbox
//
// example end
//
var Generators = map[string]table.Generator{

	"assets":        GetAssetsTable,
	"assets_group":  GetAssetsGroupTable,
	"leak":          GetLeakTable,
	"protocols":     GetProtocolsTable,
	"software":      GetSoftwareTable,
	"software_list": GetSoftwareListTable,
	"vul":           GetVulTable,
	"smallbox":      GetSmallboxTable,
	"linelbox":      GetLinelboxTable,

	// generators end
}
