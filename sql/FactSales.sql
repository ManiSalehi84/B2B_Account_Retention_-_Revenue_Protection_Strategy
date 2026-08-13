CREATE VIEW vw_FactSales AS
SELECT 
    soh.SalesOrderID,
    sod.SalesOrderDetailID,
    soh.OrderDate,
    soh.DueDate,
    soh.ShipDate,
    ISNULL(soh.CustomerID, -1) AS CustomerID,
    ISNULL(soh.SalesPersonID, -1) AS SalesPersonID,
    ISNULL(soh.TerritoryID, -1) AS TerritoryID,
    sod.ProductID,
    sod.OrderQty,
    sod.UnitPrice,
    sod.UnitPriceDiscount,
    sod.LineTotal
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesOrderDetail sod 
    ON soh.SalesOrderID = sod.SalesOrderID;