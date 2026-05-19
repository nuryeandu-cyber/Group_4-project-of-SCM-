Query Optimization 
 
-- Query 1: Checking product availability across warehouses 
-- Optimized with index on ProductID in Inventory 
SELECT p.Name, SUM(i.Quantity) AS TotalQuantity 
FROM Products p 
JOIN Inventory i ON p.ProductID = i.ProductID 
WHERE p.ProductID = 1 
GROUP BY p.ProductID, p.Name; 
 
-- Explanation: Uses index idx_inventory_product for fast lookup. Execution plan: Index scan on Inventory.ProductID, then aggregate. 
 
-- Query 2: Tracking shipment status 
SELECT s.ShipmentID, o.OrderID, r.Name AS Retailer, p.Name AS Product, s.Status, s.ShipmentDate 
FROM Shipments s 
JOIN Orders o ON s.OrderID = o.OrderID 
JOIN Retailers r ON o.RetailerID = r.RetailerID 
JOIN Products p ON o.ProductID = p.ProductID 
WHERE o.OrderID = 1; 
 
-- Explanation: Indexes on Shipments.OrderID, Orders.RetailerID, etc., for joins. Plan: Nested loop joins with index seeks. 
 
-- Query 3: Identifying low-stock products (threshold 100) 
SELECT p.Name, i.WarehouseID, i.Quantity 
FROM Inventory i 
JOIN Products p ON i.ProductID = p.ProductID 
WHERE i.Quantity < 100;
