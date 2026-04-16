-- Análisis Financiero AdventureWorks
-- Consultas SQL para análisis de ventas

-- 1. Ventas totales por año
SELECT 
    YEAR(OrderDate) AS Año,
    SUM(TotalDue) AS Ventas_Totales
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY Año;

-- 2. Top 5 productos más vendidos
SELECT TOP 5
    p.Name AS Producto,
    SUM(sod.OrderQty) AS Cantidad_Vendida
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY Cantidad_Vendida DESC;
