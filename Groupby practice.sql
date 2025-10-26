USE AdventureWorksDW;

CREATE VIEW PRODUCT 
AS
SELECT DISTINCT 
DIM.EnglishProductName AS NAME_PRODUCT,
CAT.EnglishProductCategoryName AS CATEGORY_PRODUCT,
SUB.EnglishProductSubcategoryName AS SUBCATE_PRODUCT
FROM dimproduct AS DIM JOIN dimproductsubcategory AS SUB 
ON DIM.ProductSubcategoryKey=SUB.ProductSubcategoryKey
JOIN dimproductcategory AS CAT ON SUB.ProductCategoryKey=CAT.ProductCategoryKey
GROUP BY NAME_PRODUCT
ORDER BY NAME_PRODUCT DESC
;

CREATE VIEW RESELLER  
AS
SELECT RS.ResellerName,
RST.SalesTerritoryRegion AS REGION,
DIMG.City
FROM dimsalesterritory AS RST JOIN dimgeography AS DIMG ON RST.SalesTerritoryKey= DIMG.SalesTerritoryKey
JOIN dimreseller AS RS ON DIMG.GeographyKey= RS.GeographyKey
GROUP BY ResellerName
ORDER BY ResellerName DESC;




