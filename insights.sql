--  1. Show total revenue by country
SELECT 
    c.Country,
    SUM(p.AmountPaid) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments p ON o.OrderID = p.OrderID
GROUP BY c.Country
ORDER BY TotalRevenue DESC;

--  2. Top 5 customers by total amount spent
SELECT TOP 5
    c.CustomerName,
    SUM(p.AmountPaid) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments p ON o.OrderID = p.OrderID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC;

--  3. Most frequently ordered products
SELECT 
    pr.ProductName,
    COUNT(od.ProductID) AS TimesOrdered,
    SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products pr ON od.ProductID = pr.ProductID
GROUP BY pr.ProductName
ORDER BY TotalQuantity DESC;

-- 4. Most used payment methods
SELECT 
    PaymentMethod,
    COUNT(*) AS TotalPayments,
    SUM(AmountPaid) AS TotalAmount
FROM Payments
GROUP BY PaymentMethod
ORDER BY TotalPayments DESC;

-- 5. Monthly sales summary (Year 2024)
SELECT 
    FORMAT(PaymentDate, 'yyyy-MM') AS Month,
    COUNT(DISTINCT p.OrderID) AS Orders,
    SUM(p.AmountPaid) AS TotalRevenue
FROM Payments p
WHERE YEAR(PaymentDate) = 2024
GROUP BY FORMAT(PaymentDate, 'yyyy-MM')
ORDER BY Month;

-- 6. Orders and their status with customer name
SELECT 
    o.OrderID,
    o.OrderDate,
    o.Status,
    c.CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.OrderDate DESC;

--  7. Orders without payments (LEFT JOIN)
SELECT 
    o.OrderID,
    o.OrderDate,
    c.CustomerName,
    p.PaymentID
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;

--  8. Total sales per product category
SELECT 
    pr.Category,
    SUM(od.Quantity * od.UnitPrice) AS TotalSales
FROM OrderDetails od
JOIN Products pr ON od.ProductID = pr.ProductID
GROUP BY pr.Category
ORDER BY TotalSales DESC;
