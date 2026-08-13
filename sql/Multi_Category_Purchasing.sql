WITH CustomerCategoryMetrics AS (
    SELECT
        f.CustomerID,
        COUNT(DISTINCT p.CategoryName) AS CategoriesPurchased,
        COUNT(DISTINCT f.SalesOrderID) AS TotalOrders,
        SUM(f.LineTotal) AS LifetimeRevenue,
        DATEDIFF(day, MIN(f.OrderDate), MAX(f.OrderDate)) AS AccountLifespanDays
    FROM dbo.vw_FactSales f
    INNER JOIN dbo.vw_Customer c ON f.CustomerID = c.CustomerID
    INNER JOIN dbo.vw_Product p ON f.ProductID = p.ProductID
    WHERE c.CustomerTypeDescription = 'Store Contact'
    GROUP BY f.CustomerID
)
SELECT
    CategoriesPurchased,
    COUNT(CustomerID) AS TotalB2BAccounts,
    ROUND(AVG(TotalOrders * 1.0), 2) AS AvgOrdersPerAccount,
    ROUND(AVG(AccountLifespanDays * 1.0), 1) AS AvgActiveLifespanDays,
    ROUND(AVG(LifetimeRevenue), 2) AS AvgAccountLifetimeValue,
    ROUND(SUM(LifetimeRevenue), 2) AS GroupTotalRevenue
FROM CustomerCategoryMetrics
GROUP BY CategoriesPurchased
ORDER BY CategoriesPurchased ASC;