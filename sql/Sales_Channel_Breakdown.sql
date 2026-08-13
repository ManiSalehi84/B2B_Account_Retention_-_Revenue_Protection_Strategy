SELECT
    CASE
        WHEN f.SalesPersonID IS NULL OR f.SalesPersonID = -1 THEN 'Direct Web Order'
        ELSE 'Sales Representative'
    END AS SalesChannel,
    COUNT(DISTINCT f.SalesOrderID) AS TotalOrders,
    ROUND(SUM(f.LineTotal), 2) AS TotalRevenue,
    ROUND(AVG(f.LineTotal), 2) AS AvgOrderValue
FROM dbo.vw_FactSales f
LEFT JOIN dbo.vw_SalesPerson sp
    ON f.SalesPersonID = sp.SalesPersonID
GROUP BY
    CASE
        WHEN f.SalesPersonID IS NULL OR f.SalesPersonID = -1 THEN 'Direct Web Order'
        ELSE 'Sales Representative'
    END;