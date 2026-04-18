USE haitang_erp;
UPDATE sys_user SET password = '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2' WHERE user_id = 1;
SELECT user_id, user_name, password, status, tenant_id FROM sys_user WHERE user_id = 1;