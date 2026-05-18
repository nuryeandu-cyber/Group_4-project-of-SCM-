-- Task 1: Advanced Schema Design 
 
-- Suppliers Table 
CREATE TABLE Suppliers ( 
    SupplierID INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL, 
    Location VARCHAR(100) NOT NULL 
); 
 
-- Products Table 
CREATE TABLE Products ( 
    ProductID INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL, 
    Category VARCHAR(50) NOT NULL, 
    SupplierID INT NOT NULL, 
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) 
); 
 
-- Warehouses Table 
CREATE TABLE Warehouses ( 
    WarehouseID INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL, 
    Location VARCHAR(100) NOT NULL 
); 
 
-- Retailers Table (added for normalization) 
CREATE TABLE Retailers ( 
    RetailerID INT PRIMARY KEY, 
    Name VARCHAR(100) NOT NULL, 
    Location VARCHAR(100) NOT NULL 
); 
 
-- Inventory Table 
CREATE TABLE Inventory ( 
    InventoryID INT PRIMARY KEY, 
    ProductID INT NOT NULL, 
    WarehouseID INT NOT NULL, 
    Quantity INT NOT NULL CHECK (Quantity >= 0), 
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID), 
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID), 
    UNIQUE (ProductID, WarehouseID) -- Ensure one entry per product-warehouse 
);
