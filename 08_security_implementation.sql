-- Task 4: Security & Access Control

-- Create roles
CREATE ROLE admin_role;
GRANT ALL PRIVILEGES ON *.* TO admin_role;

CREATE ROLE supplier_role;
GRANT SELECT, INSERT, UPDATE ON Products TO supplier_role;

CREATE ROLE warehouse_manager_role;
GRANT SELECT, INSERT, UPDATE ON Inventory TO warehouse_manager_role;

CREATE ROLE retailer_role;
GRANT SELECT, INSERT ON Orders TO retailer_role;

-- Create users
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
GRANT admin_role TO 'admin'@'localhost';

CREATE USER 'supplier1'@'localhost' IDENTIFIED BY 'password';
GRANT supplier_role TO 'supplier1'@'localhost';

-- For encryption: Use AES_ENCRYPT for sensitive data, e.g., in a separate table for financial data.

-- Audit logging: Triggers for updates
CREATE TRIGGER audit_inventory_update AFTER UPDATE ON Inventory
FOR EACH ROW
INSERT INTO AuditLog (TableName, Operation, RecordID, Details)
VALUES ('Inventory', 'UPDATE', NEW.InventoryID, CONCAT('Old Qty: ', OLD.Quantity, ' New Qty: ', NEW.Quantity));

-- Similarly for other tables.
