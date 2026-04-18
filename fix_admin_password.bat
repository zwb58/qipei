@echo off
d:\BtSoft\mysql\MySQL5.7\bin\mysql.exe -u root -psm771201 -e "USE haitang_erp; UPDATE sys_user SET password = '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne' WHERE user_id = 1;"
d:\BtSoft\mysql\MySQL5.7\bin\mysql.exe -u root -psm771201 -e "USE haitang_erp; SELECT user_id, user_name, password, status, tenant_id FROM sys_user WHERE user_id = 1;"
pause