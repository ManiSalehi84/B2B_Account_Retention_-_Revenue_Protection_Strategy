WITH MaxDate AS (
    SELECT MAX(f.OrderDate) AS MaxOrderDate
    FROM dbo.vw_FactSales f
    INNER JOIN dbo.vw_Customer c ON f.CustomerID = c.CustomerID
    WHERE c.CustomerTypeDescription = 'Store Contact'
),
AccountRecency AS (
    SELECT
        f.CustomerID,
        ISNULL(c.AssociatedStoreName, c.FullName) AS AccountName,
        COUNT(DISTINCT f.SalesOrderID) AS TotalOrders,
        SUM(f.LineTotal) AS LifetimeRevenue,
        MAX(f.OrderDate) AS LastOrderDate,
        DATEDIFF(day, MAX(f.OrderDate), (SELECT MaxOrderDate FROM MaxDate)) AS DaysSinceLastOrder
    FROM dbo.vw_FactSales f
    INNER JOIN dbo.vw_Customer c ON f.CustomerID = c.CustomerID
    WHERE c.CustomerTypeDescription = 'Store Contact'
    GROUP BY f.CustomerID, c.AssociatedStoreName, c.FullName
)
SELECT
    CASE
        WHEN DaysSinceLastOrder <= 90 THEN '1. Active (0-90 Days)'
        WHEN DaysSinceLastOrder BETWEEN 91 AND 180 THEN '2. At Risk (91-180 Days)'
        WHEN DaysSinceLastOrder BETWEEN 181 AND 365 THEN '3. Lapsed (181-365 Days)'
        ELSE '4. Churned (>365 Days)'
    END AS ChurnStatus,
    COUNT(CustomerID) AS TotalAccounts,
    ROUND(SUM(LifetimeRevenue), 2) AS TotalLifetimeRevenue,
    ROUND(AVG(LifetimeRevenue), 2) AS AvgLifetimeRevenue,
    ROUND(AVG(TotalOrders * 1.0), 2) AS AvgOrdersPerAccount
FROM AccountRecency
GROUP BY
    CASE
        WHEN DaysSinceLastOrder <= 90 THEN '1. Active (0-90 Days)'
        WHEN DaysSinceLastOrder BETWEEN 91 AND 180 THEN '2. At Risk (91-180 Days)'
        WHEN DaysSinceLastOrder BETWEEN 181 AND 365 THEN '3. Lapsed (181-365 Days)'
        ELSE '4. Churned (>365 Days)'
    END
ORDER BY ChurnStatus ASC;