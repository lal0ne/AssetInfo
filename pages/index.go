package pages

import (
	"github.com/GoAdminGroup/go-admin/context"
	tmpl "github.com/GoAdminGroup/go-admin/template"
	"github.com/GoAdminGroup/go-admin/template/types"
	"html/template"

	"AssetInfo/pages/lib"
)

func GetDashBoard(ctx *context.Context) (types.Panel, error) {

	components := tmpl.Default()
	colComp := components.Col()
	var row template.HTML

	col, err := lib.GetSamllBox(colComp)
	if err == nil {
		row += components.Row().SetContent(col).GetContent()
	}

	col, err = lib.GetLineBox(colComp)
	if err == nil {
		row += components.Row().SetContent(col).GetContent()
	}

	// 面板
	return types.Panel{
		Content:     row,
		Title:       "Dashboard",
		AutoRefresh: true,
		Description: "",
	}, nil
}
