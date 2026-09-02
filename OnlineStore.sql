-- ============================================
-- ONLINE STORE DATABASE
-- Dummy Database for SQL Practice
-- ============================================

CREATE DATABASE OnlineStore;



-- ============================================
-- 1. Categories
-- ============================================

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);


-- ============================================
-- 2. Customers
-- ============================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    Country VARCHAR(50),
    SignupDate DATE
);


-- ============================================
-- 3. Products
-- ============================================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,

    FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);


-- ============================================
-- 4. Orders
-- ============================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Status VARCHAR(30),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);


-- ============================================
-- 5. OrderDetails
-- ============================================

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10,2),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)
);


-- ============================================
-- INSERT DATA
-- ============================================


-- Categories

INSERT INTO Categories VALUES
(1, 'Electronics'),
(2, 'Laptops'),
(3, 'Smartphones'),
(4, 'Accessories'),
(5, 'Gaming');


-- Customers

INSERT INTO Customers VALUES
(1, 'Ahmed', 'Walid', 'ahmed@gmail.com', 'Mansoura', 'Egypt', '2025-01-15'),
(2, 'Omar', 'Ali', 'omar@gmail.com', 'Cairo', 'Egypt', '2025-02-10'),
(3, 'Mariam', 'Hassan', 'mariam@gmail.com', 'Alexandria', 'Egypt', '2025-02-20'),
(4, 'Youssef', 'Mahmoud', 'youssef@gmail.com', 'Mansoura', 'Egypt', '2025-03-05'),
(5, 'Sara', 'Ahmed', 'sara@gmail.com', 'Giza', 'Egypt', '2025-03-18'),
(6, 'Mostafa', 'Khaled', 'mostafa@gmail.com', 'Cairo', 'Egypt', '2025-04-01'),
(7, 'Nour', 'Samir', 'nour@gmail.com', 'Tanta', 'Egypt', '2025-04-15'),
(8, 'Karim', 'Adel', 'karim@gmail.com', 'Mansoura', 'Egypt', '2025-05-01');


-- Products

INSERT INTO Products VALUES
(101, 'iPhone 15', 3, 45000, 20),
(102, 'Samsung Galaxy S24', 3, 38000, 15),
(103, 'Xiaomi Redmi Note 14', 3, 15000, 30),

(104, 'Dell Latitude 5520', 2, 32000, 10),
(105, 'HP Victus 15', 2, 42000, 8),
(106, 'Lenovo IdeaPad 5', 2, 28000, 12),

(107, 'AirPods Pro', 4, 12000, 25),
(108, 'Logitech Mouse', 4, 1500, 50),
(109, 'Mechanical Keyboard', 4, 2500, 35),

(110, 'PlayStation 5', 5, 30000, 7),
(111, 'Xbox Series X', 5, 28000, 6),
(112, 'Gaming Headset', 5, 3500, 20);


-- Orders

INSERT INTO Orders VALUES
(1001, 1, '2025-05-02', 'Completed'),
(1002, 2, '2025-05-03', 'Completed'),
(1003, 3, '2025-05-05', 'Completed'),
(1004, 1, '2025-05-10', 'Completed'),
(1005, 4, '2025-05-12', 'Pending'),
(1006, 5, '2025-05-15', 'Completed'),
(1007, 6, '2025-05-18', 'Cancelled'),
(1008, 7, '2025-05-20', 'Completed'),
(1009, 8, '2025-05-22', 'Completed'),
(1010, 2, '2025-05-25', 'Completed'),
(1011, 3, '2025-05-27', 'Pending'),
(1012, 5, '2025-05-30', 'Completed');


-- Order Details

INSERT INTO OrderDetails VALUES
(1, 1001, 101, 1, 45000),
(2, 1001, 107, 1, 12000),

(3, 1002, 104, 1, 32000),
(4, 1002, 108, 2, 1500),

(5, 1003, 102, 1, 38000),
(6, 1003, 109, 1, 2500),

(7, 1004, 103, 2, 15000),

(8, 1005, 105, 1, 42000),

(9, 1006, 110, 1, 30000),
(10, 1006, 112, 1, 3500),

(11, 1007, 111, 1, 28000),

(12, 1008, 106, 1, 28000),
(13, 1008, 108, 1, 1500),

(14, 1009, 101, 1, 45000),
(15, 1009, 109, 1, 2500),

(16, 1010, 102, 2, 38000),

(17, 1011, 107, 1, 12000),

(18, 1012, 103, 1, 15000),
(19, 1012, 112, 2, 3500);




--============================
--Basic Questions (level 1)
-- ===========================
select * from Customers

select * from Products

select * from Categories

select * from Products 
where Price > 20000

select * from Customers
where City like 'Mansoura'

select * from Products
order by Price DESC



--============================
-- Aggregation Questions (level 2)
-- ===========================

select AVG([Price]) from Products

select MAX([Price]) as [MaxPrice] from Products
select top 1 ProductName , Price from Products
order by Price DESC

select count(*) as CountOfCustomers from Customers

-- 9. Count products in each category
select CategoryName, p.CategoryID,count(*) as NumOfProducts
from Products as p
join Categories as C on p.CategoryID = C.CategoryID
group by p.CategoryID, CategoryName

-- 10. Find total quantity sold for each product
select ProductID, sum(Quantity) as QuantitySold
from OrderDetails 
group by ProductID


-- =======================================
-- joins Questions (level 3)
-- =======================================

-- 11. Display each order with the customer's name
select c.FirstName, c.LastName, O.* from Customers as c
join Orders as O on O.CustomerID = c.CustomerID

-- 12. Display:-- Customer Name,-- Order ID,-- Order Date,-- Order Status
select CONCAT(C.FirstName,' ',C.LastName) as CustomerName, O.OrderID, O.OrderDate, O.Status
from Customers as C 
join Orders as O on O.CustomerID = C.CustomerID

-- 13. Display:-- Product Name,-- Category Name,-- Price
select P.ProductName, c.CategoryName, p.Price
from Products as P
join Categories as c on c.CategoryID = P.CategoryID


-- 14. Display all order details with:-- Customer Name,-- Product Name,-- Quantity,-- Unit Price
--select CONCAT(C.FirstName,' ',C.LastName) as CustomerName, p.ProductName, 
--OD.* from OrderDetails as OD
--join Products as p on p.ProductID = OD.ProductID
--join Orders as o on o.OrderID = OD.OrderID
--join Customers as c on c.CustomerID = o.CustomerID
SELECT
    o.OrderID,
    o.OrderDate,
    CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName,
    p.ProductName,
    od.Quantity,
    od.UnitPrice,
    od.Quantity * od.UnitPrice AS TotalPrice
FROM OrderDetails AS od
JOIN Products AS p
    ON p.ProductID = od.ProductID
JOIN Orders AS o
    ON o.OrderID = od.OrderID
JOIN Customers AS c
    ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;



-- =======================================
-- Business Analysis (level 4)
-- =======================================

-- 15. Calculate total revenue
select SUM(TotalPrice) as [Total Revenue]
from(
    select (OD.Quantity * OD.UnitPrice) as TotalPrice
    from OrderDetails as OD
) as T
--SELECT SUM(OD.Quantity * OD.UnitPrice) AS [Total Revenue]
--FROM OrderDetails AS OD;

-- 16. Calculate revenue for each product
select p.ProductName ,  sum(od.Quantity * od.UnitPrice) AS Revenue
from Products as p
join OrderDetails as od
on od.ProductID = p.ProductID
group by p.ProductName
order by Revenue DESC

-- 17. Find the best-selling product
select top 1 p.ProductName , sum(od.Quantity) as [Quantity Sold],sum(od.Quantity * od.UnitPrice) AS Revenue
from Products as p
join OrderDetails as od
on od.ProductID = p.ProductID
group by ProductName
order by [Revenue] desc

-- 18. Find the top 3 customers by spending
select top 3 CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, 
SUM(OD.Quantity * OD.UnitPrice) AS [Total Revenue]
from Customers as c
join Orders as o on o.CustomerID = c.CustomerID
join OrderDetails as od on od.OrderID = o.OrderID
group by CONCAT(c.FirstName, ' ', c.LastName) 
order by [Total Revenue] desc

-- 19. Find total revenue for each category
select c.CategoryName, SUM(OD.Quantity * OD.UnitPrice) AS [Total Revenue]
from Categories as c 
join Products as p on p.CategoryID = c.CategoryID
join OrderDetails as od on od.ProductID = p.ProductID
group by CategoryName  
order by [Total Revenue] desc

-- 20. Find the number of orders for each customer
select CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, count(distinct(od.OrderID)) 
from OrderDetails as od
join Orders as o on o.OrderID = od.OrderID
join Customers as c on c.CustomerID = o.CustomerID
group by CONCAT(c.FirstName, ' ', c.LastName)

-- 21. Find customers who never placed an order
SELECT c.FirstName, c.LastName
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

-- 22. Find the most popular product category
select top 1 c.CategoryName, count(p.CategoryID) 
from Categories as c 
join Products as p on p.CategoryID = c.CategoryID
join OrderDetails as od on od.ProductID = p.ProductID
group by c.CategoryName

-- 23. Find the average order value
select o.OrderID,AVG(OD.Quantity * OD.UnitPrice) as [Avg Value]
from OrderDetails as od
join Orders as o on o.OrderID = od.OrderID
group by o.OrderID

-- 24. Find the highest-value order
--select o.OrderID,max(OD.Quantity * OD.UnitPrice) as [max Value]
--from OrderDetails as od
--join Orders as o on o.OrderID = od.OrderID
--group by o.OrderID

select top 1 o.OrderID , sum(OD.Quantity * OD.UnitPrice) 
from OrderDetails as od
join Orders as o on o.OrderID = od.OrderID
group by o.OrderID
order by sum(OD.Quantity * OD.UnitPrice)  desc

