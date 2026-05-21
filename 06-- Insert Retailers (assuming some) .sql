-- Insert Retailers (assuming some) 
INSERT INTO Retailers (RetailerID, Name, Location) VALUES 
(1, 'Retailer A', 'Jimma'), 
(2, 'Retailer B', 'Addis Ababa'); 
 
-- Insert Inventory 
INSERT INTO Inventory (InventoryID, ProductID, WarehouseID, Quantity) VALUES 
(1, 1, 1, 500), 
(2, 2, 2, 300); 
 
-- Insert Orders 
INSERT INTO Orders (OrderID, RetailerID, ProductID, Quantity, Status) VALUES 
(1, 1, 1, 50, 'Shipped'), 
(2, 2, 2, 30, 'Pending'); 
 
-- Insert Shipments 
INSERT INTO Shipments (ShipmentID, OrderID, FromWarehouseID, ToLocation, Status) VALUES 
(1, 1, 1, 'Jimma', 'In Transit'), 
(2, 2, 2, 'Addis Ababa', 'Pending');
