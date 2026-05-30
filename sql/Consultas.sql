CREATE DATABASE supply_chain;
USE supply_chain;

-- Seleccionamos toda la información de la tabla, para observar los datos con los que trabajaremos --
SELECT *
FROM supply_chain_data;

-- Los productos más vendidos --
SELECT Product_type,
       SUM(Number_of_products_sold) AS Total_vendidos,
       SUM(Revenue_generated) AS Ingresos_totales
FROM supply_chain_data
GROUP BY Product_type
ORDER BY total_vendidos DESC;

-- Transportistas con mayor costo de envió --
SELECT Shipping_carriers,
       AVG(Shipping_costs) AS Costo_promedio_envio,
       AVG(Shipping_times) AS Tiempo_promedio_envio
FROM supply_chain_data
GROUP BY Shipping_carriers
ORDER BY Costo_promedio_envio DESC;

-- Proveedor con mayor tasa de defectos --
SELECT Supplier_name,
       AVG(Defect_rates) AS Tasa_defectos_promedio,
       AVG(Lead_time) AS Lead_time_promedio
FROM supply_chain_data
GROUP BY Supplier_name
ORDER BY Tasa_defectos_promedio DESC;

-- Rutas de envió --
SELECT Routes,
       Transportation_modes,
       AVG(Costs) AS Costo_promedio,
       AVG(Shipping_times) AS tiempo_promedio
FROM supply_chain_data
GROUP BY Routes, Transportation_modes
ORDER BY Costo_promedio DESC;

-- Stock vs Ventas por producto --
SELECT Product_type,
       AVG(Stock_levels) AS Stock_promedio,
       AVG(Order_quantities) AS Pedidos_promedio,
       AVG(Stock_levels) - AVG(Order_quantities) AS Diferencia
FROM supply_chain_data
GROUP BY Product_type
ORDER BY Diferencia ASC;
