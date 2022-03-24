package models

import (
	"github.com/GoAdminGroup/go-admin/modules/db"
	"github.com/jinzhu/gorm"
)

var (
	orm *gorm.DB
	err error
	// 数据库全局连接
	GlobalConn db.Connection
)

func Init(c db.Connection) {
	orm, err = gorm.Open("mysql", c.GetDB("default"))

	if err != nil {
		panic("initialize orm failed")
	}

	GlobalConn = c
}
