CREATE DATABASE huytruongd03k14;
USE huytruongd03k14;

CREATE TABLE region ( 
    RegionID TINYINT(3) PRIMARY KEY,
    RegionDescription VARCHAR(50) NOT NULL
);
INSERT INTO region (RegionID,RegionDescription)

VALUES
('1','but'),
('2','vo'),
('3','cap'),
('4','maytinh'),
('5','laptop');

CREATE TABLE territories (
    TerritoryID VARCHAR(20) PRIMARY KEY,
    TerritoryDescription VARCHAR(50) NOT NULL,
    RegionID TINYINT(3) NOT NULL
);

INSERT INTO territories (TerritoryID,TerritoryDescription,RegionID )

VALUES
('1','banchai','4'),
('2','but','5'),
('3','maytinh','7'),
('4','laptop','9'),
('5','vo','10');

CREATE TABLE employeeterritories (
    EmployeeID MEDIUMINT(8),
    TerritoryID VARCHAR(20),
    RegionID TINYINT(3) NOT NULL,
    PRIMARY KEY(EmployeeID,TerritoryID)
);

INSERT INTO employeeterritories (EmployeeID,TerritoryID,RegionID )

VALUES
('1','vo','2'),
('2','but','3'),
('3','maytinh','4'),
('4','sach','5'),
('5','laptop','6');

CREATE TABLE employees (
    EmployeeID MEDIUMINT(8) PRIMARY KEY,
    LastName VARCHAR(20) NOT NULL,
    FristName VARCHAR(10) NOT NULL,
    Title VARCHAR(30),
    TitleOfCourteey VARCHAR(25),
    BirthDate DATE,
    Hire DATE,
    Address VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    County VARCHAR(15),
    HomePhone VARCHAR(24),
    Extension VARCHAR(4),
    Photo BLOB,
    Notes TEXT NOT NULL,
    ReportsTo MEDIUMINT(8) NOT NULL,
    PhotoPath VARCHAR(25),
    Salary INT(11)
);

CREATE TABLE shippers (
    ShipperID TINYINT(3) PRIMARY KEY,
    CompanyName VARCHAR(40),
    Phone VARCHAR(24)
);

INSERT INTO shippers (ShipperID,CompanyName,Phone )

VALUES
('1','dienthoai','2'),
('2','maytinh','3'),
('3','tivi','4'),
('4','maygiat','5'),
('5','dieuhoa','6');

CREATE TABLE orders (
    OrderID INT(10) PRIMARY KEY,
    CustomerID VARCHAR(5) NULL,
    EmployeeID MEDIUMINT(8) NOT NULL,
    OrderDate DATE,
    RequiredDATE DATE,
    ShippedDATE DATE,
    ShipVia TINYINT(3) NULL,
    Freight DECIMAL(10,2),
    ShipName VARCHAR(40),
    ShipAddress VARCHAR(10),
    ShipCountry VARCHAR(15)
);

INSERT INTO orders (OrderID,CustomerID,EmployeeID,OrderDate,RequiredDATE,ShippedDATE,ShipVia,Freight,ShipName,ShipAddress,ShipCountry )

VALUES
('1','but','cap','sach','vo','maytinh','tivi','dieuhoa','maygiat','2','3'),
('2','mary','but','banchai','lo','ban','tu','hoa','quanao','3','4'),
('3','tozo','luoc','xaphong','thuoc','conchuot','ghe','cua','banphim','4','5'),
('4','hina','banphim','kinh','dienthoai','tay','banve','quat','coc','5','6'),
('5','sacma','noi','bat','dua','chau','ro','thia','banla','6','7');

CREATE TABLE customers (
    CustomerID VARCHAR(5) PRIMARY KEY,
    CompanyName VARCHAR(40) NOT NULL,
    ContactTitle VARCHAR(30),
    Adress VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24)
);

CREATE TABLE order_details (
    OrderID INT(10),
    ProductID SMALLINT(5),
    Unitprice DECIMAL(8,2) NOT NULL,
    Qantitly SMALLINT(2) NOT NULL,
    PRIMARY KEY(OrderID,ProductID )
);

INSERT INTO order_details (OrderID,ProductID,Unitprice,Qantitly )

VALUES
('1','but','thuoc','2'),
('2','sach','cap','3'),
('3','laptop','maytinh','4'),
('4','vo','tivi','5'),
('5','luoc','tay','6');

CREATE TABLE products (
    ProductsID SMALLINT(5) PRIMARY KEY,
    ProductName VARCHAR(40) NOT NULL,
    SupplierID SMALLINT(5) NOT NULL,
    CategoryID TINYINT(3) NOT NULL,
    QuantityPerUnit VARCHAR(20),
    UnitPrice DECIMAL(10,2),
    UnitsInStock SMALLINT(6),
    UnitsOnOrder SMALLINT(5),
    Reorderlevel SMALLINT(5),
    Discontinued TINYINT(1) NOT NULL
);

CREATE TABLE customerdemographics (
    CustomerTypeID VARCHAR(10) PRIMARY KEY,
    CustomerDesc TEXT
);

INSERT INTO customerdemographics (CustomerTypeID,CustomerDesc )

VALUES
('1','but'),
('2','cap');

CREATE TABLE Customercustomerdemo (
    CustomerID VARCHAR(5),
    CustomerTypeID VARCHAR(10),
    PRIMARY KEY(CustomerID,CustomerTypeID )
);

INSERT INTO Customercustomerdemo (CustomerID,CustomerTypeID )

VALUES
('1','dieuhoa'),
('2','maygiat');

CREATE TABLE Suppliers (
    SupplierID SMALLINT(5) PRIMARY KEY,
    CompanyName VARCHAR(40) NOT NULL,
    ContactName VARCHAR(30),
    ContactTitle VARCHAR(30),
    Adress VARCHAR(60),
    City VARCHAR(15),
    Region VARCHAR(15),
    PostalCode VARCHAR(10),
    Country VARCHAR(15),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    HomePage TEXT
);

CREATE TABLE categories (
    CategoryID TINYINT(3) PRIMARY KEY,
    CategoryName VARCHAR(30) NOT NULL,
    Description TEXT,
    Picture BLOB
);

INSERT INTO categories (CategoryID, CategoryName,Description,Picture )
 
VALUES
('1','but','vo','2'),
('2','giay','laptop','3'),
('3','maytinh','thuoc','4'),
('4','tivi','tay','5'),
('5','balo','giay','6');
