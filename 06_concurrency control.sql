-- Issues: Without proper locking, lost updates can occur if isolation is READ COMMITTED. 
 
-- Solutions: Use REPEATABLE READ or SERIALIZABLE isolation level. 
 
-- Set isolation level 
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE; 
 
-- For rollback on failure 
START TRANSACTION; 
-- Check if enough stock 
IF (SELECT Quantity FROM Inventory WHERE ProductID = 1 AND WarehouseID = 1) >= 50 THEN 
    UPDATE Inventory SET Quantity = Quantity - 50 WHERE ProductID = 1 AND WarehouseID = 1; 
    COMMIT; 
ELSE 
    ROLLBACK; 
END IF;
