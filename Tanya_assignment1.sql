-- TASK 1
create database TechShop

create table Customers(CustomerID int primary key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(100),
Phone varchar(20),
Address varchar(120))

insert into Customers values
(1410,'Zeya','Linston','ZeyaL@gmail.com','9457128622','No.3,Lane 2,NYC'),
(1420,'Abu','Jay','abujay@gmail.com','9457018622','Arrondissement 4,NYC'),
(1411,'Anisha','S','anishas@gmail.com','9457188622','Arrondissement 3,NYC'),
(1412,'Swetha','S','swetha14@gmail.com','9457128452','Arrondissement 5,NYC'),
(1415,'Sowmiya','Subramanian','sowmi@gmail.com','9457128602','Arrondissement 2,NYC'),
(1422,'Sindu','J','sindu@gmail.com','9445128622','Arrondissement 14,NYC'),
(1414,'Jane','Josetta','janej@gmail.com','9457124522','Arrondissement 4,NYC'),
(1432,'Pooja ','Sree','spooja@gmail.com','9457088622','Arrondissement 11,NYC'),
(1419,'Jeffrin','Johnson','johnsonjeffrin@gmail.com','9457128633','Arrondissement 5,NYC'),
(1404,'Steffy','Rose','rsteffy@gmail.com','9451728622','Arrondissement 2,NYC'),
(1408,'Eliza','Mercy','meliza@gmail.com','9007128622','Arrondissement 14,NYC'),
(1413,'Foustina','Sharon','foustisharon@gmail.com','9457143622','Arrondissement 3,NYC')

create table Category (cid int primary key,
cname varchar(30))

insert into Category values
(250,'Stands'),
(251,'Wireless'),
(252,'Electronics'),
(253,'Office Essentials')

create table Products(ProductID int primary key,
ProductName varchar(50),
Description text,
Price decimal(10,2),
cid int,
foreign key (cid) references Category(cid))

insert into Products values
(2011,'Laptop Stand','White 5.4" DIY kit',799.99,250),
(2012,'Portable Night stand','Soft Light DIY kit',99.99,250),
(2013,'Coffee Maker','Programmable,2 cups, Stainless Steel',499.99,253),
(2014,'Wireless Mouse','Ergonomic, Black, LED Built-in',79.99,251),
(2015,'Wireless Keyboard','Customisable to liking',45.99,251),
(2016,'Keyboard Protcector','Transparent,Light weight',79.99,253),
(2017,'Sticky Notes','Transparent, Reusable',99.99,253),
(2018,'Smartphone','Snapdragon Processor',129.99,252),
(2019,'Fitness Tracker','Blue, Water Resitant, Step Counter',119.99,252),
(2020,'Power Bank','16000mAh',219.99,252),
(2021,'Wireless Stylus','White, with charging port',499.99,251),
(2022,'Charger Cable Protectors','Elastic, Easy fit, Set of 6',140.99,253),
(2023,'Laptop Sleeves','Customisable to print and size',599.99,253)

create table Orders(OrderID int primary key,
CustomerID int,
OrderDate date,
TotalAmount decimal(10,2),
foreign key (CustomerID) references Customers(CustomerID))

insert into Orders values
(301,1410,'2024-01-02',899.98), 
(303,1404,'2024-02-04',579.98), 
(304,1408,'2024-01-21',125.98), 
(308,1411,'2024-02-04',229.98), 
(302,1412,'2024-03-18',339.98), 
(307,1413,'2024-02-14',640.98), 
(309,1414,'2024-01-25',1399.98), 
(305,1415,'2024-03-19',599.98), 
(306,1419,'2024-01-28',125.98), 
(310,1420,'2024-02-28',179.98), 
(312,1422,'2024-03-08',249.98), 
(311,1432,'2024-02-12',719.98)

create table OrderDetails(OrderDetailID int primary key,
OrderID int,
ProductID int,
Quantity int,
foreign key (OrderID) references Orders(OrderID),
foreign key (ProductID) references Products(ProductID))

insert into OrderDetails values
(1,301,2011,1),
(2,302,2012,3),
(3,303,2023,1),
(4,304,2020,1),
(5,305,2014,13),
(6,306,2018,1),
(7,307,2019,6),
(8,308,2022,2),
(9,309,2023,3),
(10,310,2017,3),
(11,311,2016,2),
(12,312,2015,4)

create table Inventory(InventoryID int primary key,
ProductID int,
QuantityInStock int,
LastStockUpdate date,
foreign key (ProductID) references Products(ProductID))

insert into Inventory values
(801,2011,50,'2024-04-01'),
(802,2012,14,'2024-04-02'),
(803,2013,20,'2024-04-03'),
(804,2014,50,'2024-04-04'),
(805,2015,45,'2024-04-05'),
(806,2016,62,'2024-04-06'),
(807,2017,28,'2024-04-07'),
(808,2018,100,'2024-04-08'),
(809,2019,80,'2024-04-08'),
(810,2020,250,'2024-04-02'),
(811,2021,300,'2024-04-08'),
(812,2022,150,'2024-04-05'),
(813,2023,44,'2024-04-06')

--TASK 2
--1
select CONCAT(FirstName,' ',LastName),Email from Customers order by FirstName
--2
select OrderID, OrderDate, FirstName, LastName from Orders,Customers where Orders.CustomerID = Customers.CustomerID
--3
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (1446, 'Lizzy', 'Kingsley', 'kingsleyL@gmail.com', '8904156300', 'Arrondissement 13, NYC');
--4
update Products set Price = Price*1.1 
--5
DECLARE @OrderID INT = 123; 
DELETE FROM OrderDetails WHERE OrderID = @OrderID
DELETE FROM Orders WHERE OrderID = @OrderID
--6
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (313, 1422, '2024-03-02', 799.99)
--7
DECLARE @NewEmail NVARCHAR(100) = 'mercy.p@example.com'
DECLARE @NewAddress NVARCHAR(255) = '123 Main Street, City, Country'
DECLARE @CustomerID INT = 1408
UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID
--8
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.quantity * Products.Price)
    FROM OrderDetails od, Products
    WHERE od.OrderID = Orders.OrderID
)
select * from Orders
--9
DECLARE @Customer_ID INT; 
SET @Customer_ID = 1408; 
DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID
    FROM Orders
    WHERE CustomerID = @Customer_ID
)
DELETE FROM Orders
WHERE CustomerID = @Customer_ID;
--10
INSERT INTO Products (ProductID, ProductName, Description, Price, cid)
VALUES (2024, 'Laptop Cooler', 'White-Metal Stand, Adjustable', 79.99, 250);
--11
alter table orders 
add status varchar(20)

DECLARE @Order_ID INT; 
DECLARE @NewStatus VARCHAR(50); 
SET @Order_ID = 111;
SET @NewStatus = 'Shipped';
UPDATE Orders
SET status = 'Shipped'
WHERE OrderID =301
--12
alter table Customers add NumberOfOrders int
UPDATE Customers SET NumberOfOrders = 0
UPDATE Customers SET NumberOfOrders = NumberOfOrders + 1
WHERE CustomerID IN (SELECT CustomerID FROM Orders);
select*from Orders

--TASK 3
--1
SELECT OrderID, OrderDate, FirstName,LastName 
FROM Orders INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
--2
SELECT ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails, Products
WHERE OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;
--3
SELECT FirstName, LastName, Email, Phone FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);
--4
SELECT p.ProductName,sum(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od INNER JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName ORDER BY TotalQuantityOrdered DESC
--5
SELECT p.ProductName AS gadget_name, c.cname AS category
FROM Products p
JOIN Category c ON p.cid = c.cid
WHERE c.cname = 'Stands';
--6
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c INNER JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.FirstName, c.LastName;
--7
SELECT o.OrderID, c.FirstName, c.LastName, o.TotalAmount AS TotalRevenue
FROM Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC
--8
SELECT p.ProductName, COUNT(od.OrderID) AS NumberOfOrders
FROM Products p LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;
--9
DECLARE @ProductName VARCHAR(100) = 'Sticky Notes'; 
SELECT DISTINCT c.* FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = @ProductName;
--10
DECLARE @StartDate DATE = '2024-01-01'
DECLARE @EndDate DATE = '2024-03-31'
SELECT SUM(od.Quantity * p.Price) AS TotalRevenue FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN @StartDate AND @EndDate;

--Task 4
--1
SELECT CustomerID, FirstName, LastName FROM Customers
WHERE CustomerID NOT IN (
    SELECT DISTINCT CustomerID FROM Orders
)
--2
SELECT TotalProducts FROM (
    SELECT COUNT(*) AS TotalProducts FROM Products
) AS ProductCount;
--3
SELECT TotalRevenue FROM (
    SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders
) AS TechShopRevenue;
--4
DECLARE @category_name VARCHAR(50) = 'Wireless';
SELECT AVG(Quantity) AS AverageQuantityOrdered
FROM (
    SELECT od.Quantity
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Category c ON p.cid = c.cid
    WHERE c.cname = @category_name
) AS OrdersByCategory
--5
DECLARE @cust_id INT = 1410
SELECT SUM(TotalAmount) AS TotalRevenue
FROM (
    SELECT o.TotalAmount
    FROM Orders o
    WHERE o.CustomerID = @cust_id
) AS CustomerOrders
--6
SELECT FirstName, LastName, NumOrdersPlaced
FROM ( SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS NumOrdersPlaced
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.FirstName, c.LastName
) AS CustomerOrders
ORDER BY NumOrdersPlaced DESC
--7
SELECT cname AS MostPopularCategory, TotalQuantityOrdered
FROM (
    SELECT c.cname, SUM(od.Quantity) AS TotalQuantityOrdered
    FROM Category c
    JOIN Products p ON c.cid = p.cid
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY c.cname
) AS CategoryTotalQuantities
ORDER BY TotalQuantityOrdered DESC
--8
SELECT c.FirstName, c.LastName, TotalSpending
FROM Customers c
JOIN (
    SELECT o.CustomerID, SUM(od.Quantity * p.Price) AS TotalSpending
    FROM Orders o
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Category cat ON p.cid = cat.cid
    WHERE cat.cname = 'Electronics'
    GROUP BY o.CustomerID
) AS CustomerSpending ON c.CustomerID = CustomerSpending.CustomerID
ORDER BY TotalSpending DESC
--9
SELECT AVG(OrderValue) AS AverageOrderValue
FROM (
    SELECT SUM(TotalAmount) AS OrderValue
    FROM Orders
    GROUP BY CustomerID
) AS CustomerOrders;
--10
SELECT c.FirstName, c.LastName, OrderCount
FROM Customers c
JOIN (
    SELECT CustomerID, COUNT(*) AS OrderCount
    FROM Orders
    GROUP BY CustomerID
) AS CustomerOrderCount ON c.CustomerID = CustomerOrderCount.CustomerID;