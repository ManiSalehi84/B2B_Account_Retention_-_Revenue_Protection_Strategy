CREATE VIEW vw_SalesPerson AS
SELECT 
    sp.BusinessEntityID AS SalesPersonID,
    p.FirstName + ' ' + p.LastName AS SalesPersonName,
    sp.TerritoryID,
    sp.SalesQuota,
    sp.Bonus,
    sp.CommissionPct,
    sp.SalesYTD
FROM Sales.SalesPerson sp
INNER JOIN Person.Person p 
    ON sp.BusinessEntityID = p.BusinessEntityID;