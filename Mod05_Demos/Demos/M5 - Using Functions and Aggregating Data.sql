--Retrieving Product Information
SELECT p.ProductID, UPPER(p.Name) AS ProductName, ROUND(p.Weight, 0) AS ApproxWeight
FROM SalesLT.Product AS p;


--Retrieving Product Information (2)
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
       YEAR(p.SellStartDate) AS SellStartYear, DATENAME(m, p.SellStartDate) AS SellStartMonth
FROM SalesLT.Product AS p;


--Retrieving Product Information (3)
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
       YEAR(SellStartDate) AS SellStartYear, DATENAME(m, SellStartDate) AS SellStartMonth,
       LEFT(p.ProductNumber,2) AS ProductType
FROM SalesLT.Product AS p;


--Retrieving Product Information (4)
SELECT ProductID, UPPER(Name) AS ProductName, ROUND(Weight, 0) AS ApproxWeight,
       YEAR(SellStartDate) AS SellStartYear, DATENAME(m, SellStartDate) AS SellStartMonth,
       LEFT(ProductNumber, 2) AS ProductType
FROM SalesLT.Product AS p
WHERE ISNUMERIC (p.Size) = 1;


--Ranking Customers By Revenue
SELECT C.CompanyName, SOH.TotalDue AS Revenue,
       RANK() OVER (ORDER BY SOH.TotalDue DESC) AS RankByRevenue
FROM SalesLT.SalesOrderHeader AS SOH
JOIN SalesLT.Customer AS C
ON SOH.CustomerID = C.CustomerID;


--Aggregating Product Sales
SELECT p.Name, SUM(sod.LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS sod
JOIN SalesLT.Product AS p 
ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY TotalRevenue DESC;


--Aggregating Product Sales (2)
SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SOD
JOIN SalesLT.Product AS P ON SOD.ProductID = P.ProductID
WHERE p.ListPrice > 1000
GROUP BY P.Name
ORDER BY TotalRevenue DESC;


--Aggregating Product Sales (3)
SELECT Name, SUM(LineTotal) AS TotalRevenue
FROM SalesLT.SalesOrderDetail AS SOD
JOIN SalesLT.Product AS P 
ON SOD.ProductID = P.ProductID
WHERE p.ListPrice > 1000
GROUP BY P.Name
HAVING SUM(LineTotal) > 20000
ORDER BY TotalRevenue DESC
