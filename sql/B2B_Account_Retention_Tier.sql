SELECT
    CASE
        WHEN TotalOrders = 1 THEN '1. One-off (1 Order)'
        WHEN TotalOrders = 2 THEN '2. Repeat (2 Orders)'
        WHEN TotalOrders BETWEEN 3 AND 5 THEN '3. Developing (3-5 Orders)'
        WHEN TotalOrders BETWEEN 6 AND 10 THEN '4. Core (6-10 Orders)'
        ELSE '5. Key Account (10+ Orders)'
    END AS RetentionTier,
    COUNT(CustomerID) AS TotalAccounts,
    ROUND(SUM(LifetimeRevenue), 2) AS GroupRevenue,
    ROUND(AVG(LifetimeRevenue), 2) AS AvgRevenuePerAccount,
    ROUND(AVG(AccountLifespanDays * 1.0), 1) AS AvgLifespanDays
FROM B2B_Account_Summary
GROUP BY
    CASE
        WHEN TotalOrders = 1 THEN '1. One-off (1 Order)'
        WHEN TotalOrders = 2 THEN '2. Repeat (2 Orders)'
        WHEN TotalOrders BETWEEN 3 AND 5 THEN '3. Developing (3-5 Orders)'
        WHEN TotalOrders BETWEEN 6 AND 10 THEN '4. Core (6-10 Orders)'
        ELSE '5. Key Account (10+ Orders)'
    END
ORDER BY RetentionTier ASC;