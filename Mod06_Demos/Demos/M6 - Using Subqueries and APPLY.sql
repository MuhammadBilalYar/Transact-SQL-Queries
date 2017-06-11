-------------------------------------------
--Retrieving Product Price Information
-------------------------------------------
SELECT p.ProductID,p.Name,p.ListPrice
FROM SalesLT.Product AS p
WHERE p.ListPrice >
(SELECT AVG(UnitPrice) FROM SalesLT.SalesOrderDetail)
ORDER BY ProductID;

-------------------------------------------
--Retrieving Product Price Information (2)
-------------------------------------------
SELECT ProductID, Name, ListPrice
FROM SalesLT.Product
WHERE ProductID IN
  (SELECT ProductID from SalesLT.SalesOrderDetail WHERE UnitPrice < 100)
AND ListPrice >= 100
ORDER BY ProductID;

-------------------------------------------
--Retrieving Product Price Information (3)
-------------------------------------------
SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(sod.UnitPrice)
 FROM SalesLT.SalesOrderDetail AS sod
 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
ORDER BY P.ProductID;

-------------------------------------------
--Retrieving Product Price Information (4)
-------------------------------------------
SELECT ProductID, Name, StandardCost, ListPrice,
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID) AS AvgSellingPrice
FROM SalesLT.Product AS P
WHERE StandardCost  >
(SELECT AVG(UnitPrice)
 FROM SalesLT.SalesOrderDetail AS SOD
 WHERE P.ProductID = SOD.ProductID)
ORDER BY P.ProductID;

-------------------------------------------
--Retrieving Customer Information
-------------------------------------------
SELECT SalesOrderID,FirstName,LastName,CI.CustomerID,TotalDue
FROM SalesLT.SalesOrderHeader AS SOH
CROSS APPLY dbo.ufnGetCustomerInformation(CustomerID) AS CI
ORDER BY SOH.SalesOrderID;

-------------------------------------------
--Retrieving Customer Information (2)
-------------------------------------------
SELECT CA.CustomerID, CI.FirstName, CI.LastName, A.AddressLine1, A.City
FROM SalesLT.Address AS A
JOIN SalesLT.CustomerAddress AS CA
ON A.AddressID = CA.AddressID
CROSS APPLY dbo.ufnGetCustomerInformation (CA.CustomerID) AS CI
ORDER BY CA.CustomerID;