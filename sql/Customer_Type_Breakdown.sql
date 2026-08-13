SELECT
    c.CustomerTypeDescription,
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    COUNT(DISTINCT f.SalesOrderID) AS TotalOrders,
    ROUND(SUM(f.LineTotal), 2) AS TotalRevenue,
    ROUND(SUM(f.LineTotal) / NULLIF(COUNT(DISTINCT c.CustomerID), 0), 2) AS AvgRevenuePerCustomer
FROM dbo.vw_Customer c
LEFT JOIN dbo.vw_FactSales f
    ON c.CustomerID = f.CustomerID
GROUP BY
    c.CustomerTypeDescription;