--Retrieving Customer Data
SELECT *
FROM SalesLT.Customer


--Create List of Customer Contacts
SELECT Title, FirstName, MiddleName, LastName , Suffix 
FROM SalesLT.Customer;


--Create List of Customer Contacts (2)
SELECT Salesperson , Title + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer;


--Retrieving Customer and Sales Data
SELECT CAST(CustomerID AS VARCHAR(10)) + ': ' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;


--Retrieving Customer and Sales Data (2)
SELECT SalesOrderNumber + ' (' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
	   CONVERT(nvarchar(30), OrderDate, 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;


--Retrieving Customer Contact Names
SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName
AS CustomerName
FROM SalesLT.Customer;


--Retrieving Primary Contact Details
SELECT CustomerID, COALESCE(EmailAddress,Phone) AS PrimaryContact
FROM SalesLT.Customer;


--Retrieving Shipping Status
SELECT SalesOrderID, OrderDate,
  CASE
    WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
    ELSE 'Shipped'
  END AS ShippingStatus 
FROM SalesLT.SalesOrderHeader;
