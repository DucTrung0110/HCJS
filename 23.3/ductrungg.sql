CREATE DATABASE ductrungg;
USE ductrungg;
CREATE TABLE employees(
employeeNumber INT(10),
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL ,
extension VARCHAR (10) NOT NULL ,
email VARCHAR(100) NOT NULL ,
officeCode VARCHAR(10) NOT NULL ,
reportsTo INT(10) NULL ,
jobTitle VARCHAR(50) NOT NULL,
CONSTRAINT PK_employeesEMPLOYEENUMBER PRIMARY KEY (employeeNumber),
CONSTRAINT PK_employeesOFFICECODE_employeeEMPLOYEENUMBER FOREIGN KEY (officeCode) REFERENCES offices (officeCode),
CONSTRAINT PK_employeesNUMBER_employeeEMPLOYELASTNAME FOREIGN KEY (lastName) REFERENCES employees (officeCode),
CONSTRAINT PK_employeeEMPLOYEENUMBER_employeesREPORTSTO FOREIGN KEY (reportsTo) REFERENCES customers (customerNumber)
);
DROP TABLE employees;


CREATE TABLE products(
productCode VARCHAR(15) PRIMARY KEY,
productName VARCHAR(70) NOT NULL ,
productLine VARCHAR(50) NOT NULL ,
productScale VARCHAR(10) NOT NULL ,
productVendor VARCHAR(50) NOT NULL ,
productDescription TEXT NOT NULL ,
quantityInStock SMALLINT(6) NOT NULL ,
buyPrice DECIMAL(8,2) NOT NULL ,
MSRP DECIMAL(8,2) NOT NULL, 
cate_id  INT NOT NULL,
CONSTRAINT PK_productID PRIMARY KEY (id),
CONSTRAINT PK_productCATEIDcategory_id PRIMARY KEY (id) REFERENCES (cate_id) 
);

CREATE TABLE customers(
customerNumber INT(10),
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL ,
contactFirstName VARCHAR (10) NOT NULL ,
phone VARCHAR(50) NOT NULL ,
addressLine1 VARCHAR(50) NOT NULL ,
addressLine2 VARCHAR(50) NULL ,
city VARCHAR(50) NOT NULL ,
state VARCHAR(50) NULL ,
postalCode VARCHAR(15) ,
country VARCHAR(50) NOT NULL ,
salesRepEmployeeNumber INT(11) NULL ,
creditLimit INT(10) NULL,
CONSTRAINT PK_customersCUSTOMERNUMBER PRIMARY KEY (customerNumber),
CONSTRAINT PK_customersSALESREPEMPLOYEENUMBER_employeesOFFICECODE FOREIGN KEY (salesRepEmployeeNumber) REFERENCES customers (customerNumber)
);
Drop table customers;
CREATE TABLE offices(
officeCode VARCHAR(10) PRIMARY KEY ,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL ,
addressLine1 VARCHAR(50) NOT NULL ,
addressLine2 VARCHAR(50) NULL ,
state VARCHAR(50) NULL ,
country VARCHAR(50) NOT NULL ,
postalCode VARCHAR(15) NOT NULL,
territory VARCHAR(10) NOT NULL
);

CREATE TABLE orders(
orderNumber INT(10) PRIMARY KEY,
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATE NULL ,
status VARCHAR(15) NOT NULL,
comments TEXT NULL ,
customerNumber INT(10) NOT NULL
);

CREATE TABLE payments(
customerNumber INT(10) ,
checkNumber VARCHAR(50) ,
paymentDATE DATE NOT NULL,
amount DECIMAL (8,2) NOT NULL,
PRIMARY KEY (customerNumber,checkNumber)
); 

CREATE TABLE orderdetails(
orderNumber INT(10),
productCode VARCHAR(15) ,
quantityOrdered SMALLINT(5) NOT NULL,
priceEach DECIMAL(7,2) NOT NULL,
orderLineNumber TINYINT(3) NOT NULL,
PRIMARY KEY(ordernumber,productCode)
);

CREATE TABLE productlines(
productLine VARCHAR(50) PRIMARY KEY,
textDescription VARCHAR(4000) NULL,   
htmlDescription MEDIUMTEXT NULL,
image BLOB NULL 
);

ALTER TABLE employees
ADD CONSTRAINT UQ_categoryID UNIQUE (id); 