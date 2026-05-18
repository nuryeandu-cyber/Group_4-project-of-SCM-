: Transactions & Concurrency 
 
-- Simulate concurrent operations: Multiple orders reducing inventory 
 
-- Example: Two transactions trying to update inventory for Product 1 in Warehouse 1 
 
-- Transaction 1: Order for 50 units 
START TRANSACTION; 
SELECT Quantity FROM Inventory WHERE ProductID = 1 AND WarehouseID = 1 FOR UPDATE; -- Lock row 
UPDATE Inventory SET Quantity = Quantity - 50 WHERE ProductID = 1 AND WarehouseID = 1; 
COMMIT; 
 
-- Transaction 2: Simultaneous order for 30 units 
START TRANSACTION; 
SELECT Quantity FROM Inventory WHERE ProductID = 1 AND WarehouseID = 1 FOR UPDATE; -- Waits for lock 
UPDATE Inventory SET Quantity = Quantity - 30 WHERE ProductID = 1 AND WarehouseID = 1; 
COMMIT;
