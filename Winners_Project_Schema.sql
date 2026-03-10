CREATE DATABASE sql_project;

USE sql_project;

-- Create table Stores
-- 
CREATE TABLE stores(
	StoreID	INT PRIMARY KEY,
	StoreName VARCHAR(50) UNIQUE,
	City VARCHAR(20) NOT NULL,
	ManagerName	VARCHAR(50),
	OpenDate DATE DEFAULT(CURDATE())
);


-- Create table Customers
-- Phone is Varchar here because it contains "-" as a seperator.
-- CreatedDate has default vaule of curdate, if not provided it will automatically assus today's date as CreatedDate.
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    City VARCHAR(50),
    CreatedDate DATE DEFAULT (CURDATE())
);



-- Create table Employees
-- Phone is Varchar here because it contains "-" as a seperator.
-- HireDate has default vaule of curdate, if not provided it will automatically assus today's date as CreatedDate.
CREATE TABLE employees(
	EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(15) UNIQUE,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE DEFAULT(CURDATE()),
    StoreID INT,
    FOREIGN KEY(StoreID) REFERENCES stores(StoreID)
    );
    
-- Create table Categories
--   
 CREATE TABLE categories(
	CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) UNIQUE NOT NULL,
    Descriptions VARCHAR(100),
    CreatedDate DATE DEFAULT(CURDATE()),	
    IsActive TINYINT(1) DEFAULT 1
    );

-- Create table Products
-- 
    CREATE TABLE products(
		ProductID INT PRIMARY KEY,
        ProductName	VARCHAR (50) NOT NULL,
        CategoryID INT,
        Price DECIMAL(7,2),
        StockQuantity INT DEFAULT 0,	
        CreatedDate DATE DEFAULT (CURDATE()),
        FOREIGN KEY(CategoryID) REFERENCES categories(CategoryID)
        );


-- Create table Orders
-- 
CREATE TABLE orders(
	OrderID	INT PRIMARY KEY,
    CustomerID INT NOT NULL,	
    EmployeeID INT NOT NULL,
    StoreID	INT NOT NULL,
    OrderDate DATE DEFAULT(CURDATE()),	
    TotalAmount DECIMAL(7,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID),
    FOREIGN KEY (StoreID) REFERENCES stores(StoreID)
    );
    
-- Create table order_details
-- 
CREATE TABLE order_details(
	OrderDetailID INT PRIMARY KEY,
    OrderID	INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT,	
    UnitPrice DECIMAL(7,2),	
    Discount DECIMAL(7,2),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
    );