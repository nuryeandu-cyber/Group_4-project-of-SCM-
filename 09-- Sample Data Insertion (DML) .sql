-- Sample Data Insertion (DML) 
 
-- Insert Suppliers 
INSERT INTO Suppliers (SupplierID, Name, Location) VALUES 
(1, 'EthioAgri', 'Addis Ababa'), 
(2, 'IfaJimmaFarm', 'Jimma'), 
(3, 'TanaFlora', 'Bahir Dar'); 
 
-- Insert Products 
INSERT INTO Products (ProductID, Name, Category, SupplierID) VALUES 
(1, 'Coffee Beans', 'Agriculture', 1), 
(2, 'Wheat', 'Agriculture', 2), 
(3, 'Cooking Oil', 'Food', 3); 
 
-- Insert Warehouses 
INSERT INTO Warehouses (WarehouseID, Name, Location) VALUES 
(1, 'Addis Warehouse', 'Addis Ababa'), 
(2, 'Jimma Warehouse', 'Jimma');
