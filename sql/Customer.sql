CREATE VIEW vw_Customer AS
SELECT 
    c.CustomerID,
    c.PersonID,
    c.StoreID,
    c.TerritoryID,
    c.AccountNumber,
    ISNULL(p.FirstName + ' ' + p.LastName, s.Name) AS CustomerName,
    CASE 
        WHEN c.StoreID IS NOT NULL THEN 'Store Contact'
        ELSE 'Individual Customer'
    END AS CustomerType
FROM Sales.Customer c
LEFT JOIN Person.Person p 
    ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.Store s 
    ON c.StoreID = s.BusinessEntityID;