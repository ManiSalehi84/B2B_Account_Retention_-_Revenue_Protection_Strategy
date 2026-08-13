WITH FirstOrders AS (
    SELECT
        f.CustomerID,
        MIN(f.OrderDate) AS FirstOrderDate
    FROM dbo.vw_FactSales f
    INNER JOIN dbo.vw_Customer c ON f.CustomerID = c.CustomerID
    WHERE c.CustomerTypeDescription = 'Store Contact'
    GROUP BY f.CustomerID
),
FirstOrderMetrics AS (
    SELECT
        f.CustomerID,
        SUM(f.LineTotal) AS InitialOrderRevenue
    FROM dbo.vw_FactSales f
    INNER JOIN dbo.vw_Customer c ON f.CustomerID = c.CustomerID
    INNER JOIN FirstOrders fo 
        ON f.CustomerID = fo.CustomerID 
       AND f.OrderDate = fo.FirstOrderDate
    WHERE c.CustomerTypeDescription = 'Store Contact'
    GROUP BY f.CustomerID
),
AccountTotals AS (
    SELECT
        f.CustomerID,
        COUNT(DISTINCT f.SalesOrderID) AS LifetimeOrders,
        SUM(f.LineTotal) AS LifetimeRevenue
    FROM dbo.vw_FactSales f
    INNER JOIN dbo.vw_Customer c ON f.CustomerID = c.CustomerID
    WHERE c.CustomerTypeDescription = 'Store Contact'
    GROUP BY f.CustomerID
)
SELECT
    CASE
        WHEN fom.InitialOrderRevenue < 1000 THEN '1. Small (<$1k)'
        WHEN fom.InitialOrderRevenue BETWEEN 1000 AND 5000 THEN '2. Medium ($1k-$5k)'
        WHEN fom.InitialOrderRevenue BETWEEN 5001 AND 20000 THEN '3. Large ($5k-$20k)'
        ELSE '4. Enterprise (>$20k)'
    END AS InitialOrderTier,
    COUNT(fom.CustomerID) AS AccountCount,
    ROUND(AVG(at.LifetimeOrders * 1.0), 2) AS AvgLifetimeOrders,
    ROUND(AVG(at.LifetimeRevenue), 2) AS AvgLifetimeRevenue
FROM FirstOrderMetrics fom
INNER JOIN AccountTotals at 
    ON fom.CustomerID = at.CustomerID
GROUP BY 
    CASE
        WHEN fom.InitialOrderRevenue < 1000 THEN '1. Small (<$1k)'
        WHEN fom.InitialOrderRevenue BETWEEN 1000 AND 5000 THEN '2. Medium ($1k-$5k)'
        WHEN fom.InitialOrderRevenue BETWEEN 5001 AND 20000 THEN '3. Large ($5k-$20k)'
        ELSE '4. Enterprise (>$20k)'
    END
ORDER BY InitialOrderTier ASC;