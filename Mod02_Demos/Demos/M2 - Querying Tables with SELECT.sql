--Retrieving Transportation Report Data
SELECT DISTINCT City,StateProvince
FROM SalesLT.Address;


--Retrieving Transportation Report Data (2)
SELECT TOP 10 PERCENT NAME, Weight
FROM SalesLT.Product
ORDER BY Weight DESC;


--Retrieving Transportation Report Data (3)
SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC
OFFSET 10 ROWS FETCH NEXT 0100 ROWS ONLY;


--Retrieving Product Data
SELECT Name, Color, Size
FROM SalesLT.Product
WHERE ProductModelID = 1;


--Retrieving Product Data (2)
SELECT Name, ProductNumber
FROM SalesLT.Product
WHERE Color IN ('Black', 'Red', 'White') AND Size  IN ('S', 'M');


--Retrieving Product Data (3)
SELECT Name, ProductNumber, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-%';


--Retrieving Product Data (4)
SELECT Name, ProductNumber, ListPrice
FROM SalesLT.Product
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';
