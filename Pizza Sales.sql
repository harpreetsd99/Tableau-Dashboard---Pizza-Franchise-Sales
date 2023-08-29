Use [Pizza Sales];

Select * From pizza_sales;

-- Total Revenue  
Select Round(Sum(total_price),2) as  Total_Revenue from pizza_sales;

-- Avg Order Value
Select Round(sum(total_price)/Count(distinct order_id),2) as Avg_Order  from pizza_sales;

-- Total Quantity Sold
Select Sum(quantity) as Total_Qty From pizza_sales;

-- Total Orders Placed
Select Count(distinct order_id) as Total_Orders From pizza_sales;

-- Avg Pizza's Sold Per Order
Select CAST(CAST(SUM(quantity) as Decimal(10,2))/CAST(Count(Distinct order_id)  as Decimal(10,2)) AS Decimal(10,2)) As Avg_Pizza_Qty From pizza_sales;

-- Avg Pizza Per hour
Select DATEPART(Hour, order_time) as hour_time, Sum(quantity) as qty From pizza_sales group by DATEPART(Hour, order_time) order by hour_time;

-- Orders per week
Select DATEPART(ISO_WEEK, order_date) as Week_Number, YEAR(order_date) As YEAR_Number, Count(Distinct order_id) as number_of_orders From pizza_sales 
group by DATEPART(ISO_WEEK, order_date), YEAR(order_date) order by DATEPART(ISO_WEEK, order_date), YEAR(order_date);

-- % Of sales for different categories
Select pizza_category as Category, Round(Sum(total_price),2), Round(Sum(total_price)*100/(Select Sum(total_price) FROM pizza_sales),2) as Total_Sales 
From pizza_sales 
Group by pizza_category;

-- % Of sales for different sizes
Select pizza_size as Size, Round(Sum(total_price),2), Round(Sum(total_price)*100/(Select Sum(total_price) FROM pizza_sales),2) as Total_Sales 
From pizza_sales 
Group by pizza_size;

-- Top 5 pizza sold by revenue
Select Top 5 pizza_name as Pizza_Name, Round(Sum(total_price),2) as total_price From pizza_sales
group by pizza_name order by total_price DESC;

-- Bottom 5 pizza sold by revenue
Select Top 5 pizza_name as Pizza_Name, Round(Sum(total_price),2) as total_price From pizza_sales
group by pizza_name order by total_price ASC;

-- Top 5 pizza sold by qty
Select Top 5 pizza_name as Pizza_Name, Round(Sum(quantity),2) as total_qty From pizza_sales
group by pizza_name order by total_qty DESC;

-- Bottom 5 pizza sold by qty
Select Top 5 pizza_name as Pizza_Name, Round(Sum(quantity),2) as total_qty From pizza_sales
group by pizza_name order by total_qty ASC;

-- Top 5 pizza sold by orders
Select Top 5 pizza_name as Pizza_Name, Count(Distinct order_id) as total_orders From pizza_sales
group by pizza_name order by total_orders DESC;

-- Bottom 5 pizza sold by qty
Select Top 5 pizza_name as Pizza_Name, count(distinct order_id) as total_orders From pizza_sales
group by pizza_name order by total_orders ASC;