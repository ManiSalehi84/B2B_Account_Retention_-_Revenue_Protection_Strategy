CREATE VIEW vw_Territory AS
SELECT 
    TerritoryID,
    Name AS TerritoryName,
    CountryRegionCode,
    [Group] AS RegionGroup,
    SalesYTD,
    CostYTD
FROM Sales.SalesTerritory;