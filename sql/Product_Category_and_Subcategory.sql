SELECT
    p.CategoryName,
    p.SubcategoryName,
    SUM(f.OrderQty) AS TotalUnitsSold,
    ROUND(SUM(f.LineTotal), 2) AS TotalRevenue,
    ROUND(AVG(f.UnitPriceDiscount) * 100, 2) AS AvgDiscountPct
FROM dbo.vw_FactSales f
JOIN dbo.vw_Product p
    ON f.ProductID = p.ProductID
GROUP BY
    p.CategoryName,
    p.SubcategoryName
ORDER BY
    TotalRevenue DESC;