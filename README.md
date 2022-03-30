# AssetInfo

资产信息统计平台

## 描述

统计管理的资产及其所使用的软件、版本信息，录入漏洞信息，确认所用软件是否受该漏洞影响。

## 仪表盘

![image-20220330174947756](./doc/images/image-20220330174947756.png)

## 设置

修改仪表盘上的信息

### SmallBox

![image-20220330175047835](./doc/images/image-20220330175047835.png)

### LineBox

![image-20220330175144993](./doc/images/image-20220330175144993.png)

## 资产信息

先创建 `资产组` 和 `协议` (资产系统登录方式)

![image-20220330175439076](./doc/images/image-20220330175439076.png)

## 软件信息

先创建 `软件` （可对应多个版本）

资产和使用软件关联起来

![image-20220330175609492](./doc/images/image-20220330175609492.png)

## 漏洞检测

![](./doc/images/image-20220330175810478.png)

## 吐槽

`自动检测` 显示在独立表格最符合预期，但是本人实在没找到获取当前行 `id` 的方法。有大佬知道怎么搞得，欢迎提出~

**特别感谢**

本项目基于GoAdmin开发，在此感谢 [GoAdminGroup](https://github.com/GoAdminGroup) 开发组。

[GoAdmin](https://github.com/GoAdminGroup/go-admin)

[GoAdmin论坛](http://discuss.go-admin.com)

[GoAdmin文档](https://book.go-admin.cn)
