# AssetInfo

## 下载项目至本地

```shell
git clone git@github.com:lal0ne/AssetInfo.git
```

## 导入数据库

```shell
mysql -h 127.0.0.1 -P 3306 -u root -p root assets < ./assets.sql
```

## 修改配置

```shell
mv config.example.yml config.yml
mv adm.example.ini adm.ini
# 修改相应配置
```

## 运行项目

```
go run .
```

