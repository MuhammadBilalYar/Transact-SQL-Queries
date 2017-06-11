--Logging Errors
DECLARE @OrderID int = 0
-- Declare a custom error if the specified order doesn't exist
DECLARE @error varchar(25) = 'Order #' + cast(@OrderID as varchar) + ' does not exist';
IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
BEGIN
-- Throw the custom error
THROW 50001, @error, 0;
END
ELSE
BEGIN
DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @OrderID;
DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID;
END

--Logging Errors (2)
DECLARE @OrderID int = 0
DECLARE @error varchar(25) = 'Order #' + cast(@OrderID as varchar) + ' does not exist';
BEGIN TRY
IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID)
BEGIN
THROW 50001, @error, 0
END
ELSE
BEGIN
DELETE FROM SalesLT.SalesOrderDetail WHERE SalesOrderID = @OrderID;
DELETE FROM SalesLT.SalesOrderHeader WHERE SalesOrderID = @OrderID;
END
END TRY
BEGIN CATCH
-- Catch and print the error
PRINT ERROR_MESSAGE();
END CATCH


--Ensuring Data Consistency
DECLARE @OrderID int = 0
DECLARE @error varchar(25) = 'Order #' + cast(@OrderID as varchar) + ' does not exist';
BEGIN TRY
IF NOT EXISTS (SELECT * FROM SalesLT.SalesOrderHeader
WHERE SalesOrderID = @OrderID)
BEGIN
THROW 50001, @error, 0
END
ELSE
BEGIN
-- Add code to treat as single transactional unit of work
BEGIN TRANSACTION
DELETE FROM SalesLT.SalesOrderDetail
WHERE SalesOrderID = @OrderID;
DELETE FROM SalesLT.SalesOrderHeader
WHERE SalesOrderID = @OrderID;
COMMIT TRANSACTION
END
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
-- Rollback the transaction
ROLLBACK TRANSACTION;
END
ELSE
BEGIN
-- Report the error
PRINT ERROR_MESSAGE();
END
END CATCH