SELECT
    ISNULL(sp.TerritoryGroup, 'Unassigned/Web') AS TerritoryGroup,
    ISNULL(sp.CountryRegionCode, 'N/A') AS CountryRegionCode,
    YEAR(f.OrderDate) AS SalesYear,
    COUNT(DISTINCT f.SalesOrderID) AS TotalOrders,
    ROUND(SUM(f.LineTotal), 2) AS TotalRevenue
FROM dbo.vw_FactSales f
LEFT JOIN dbo.vw_SalesPerson sp
    ON f.SalesPersonID = sp.SalesPersonID
GROUP BY
    ISNULL(sp.TerritoryGroup, 'Unassigned/Web'),
    ISNULL(sp.CountryRegionCode, 'N/A'),
    YEAR(f.OrderDate)
ORDER BY
    CountryRegionCode,
    SalesYear;