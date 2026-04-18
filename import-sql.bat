@echo off
chcp 65001
echo 正在导入SQL...
"d:\BtSoft\mysql\MySQL5.7\bin\mysql.exe" -u root -psm771201 haitang_erp < "d:\erp\qixiu-erp\sql\haitang-erp.sql"
echo 导入完成
pause
