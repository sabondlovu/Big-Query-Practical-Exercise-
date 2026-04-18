--This is to see if my data is accurate 

SELECT * FROM `sales-retail-493417.RetailSales.Retail Sales` LIMIT 1000;

--Question 1 to pull transactions occured in 2023

 SELECT *
FROM `sales-retail-493417.RetailSales.Retail Sales`
 WHERE EXTRACT(YEAR FROM Date) = 2023;

 ---Question 2 Display transactions where the Total_Amount is more than the average Total_Amount of the entire dataset.
 SELECT *
FROM `sales-retail-493417.RetailSales.Retail Sales`
WHERE `Total Amount` > (SELECT AVG(`Total Amount`)
FROM `sales-retail-493417.RetailSales.Retail Sales`);

-----
---Quetion 3 Display total Reevenue 

SELECT SUM(`Total Amount`) AS Total_Revenue
FROM`sales-retail-493417.RetailSales.Retail Sales`;

---Questio 4 : Display all distinct Product Categories in the dataset.

SELECT DISTINCT 'Product Category'
FROM`sales-retail-493417.RetailSales.Retail Sales`;

---Quetsion 5 : For each Product Category, calculate the total quantity sold.GROUP BY

SELECT `Product Category`, SUM(Quantity) AS Total_Quantity
FROM `sales-retail-493417.RetailSales.Retail Sales`
GROUP BY `Product Category`;

----Question 6 Create a column called Age_Group that classifies customers as:– 'Youth' (<30)– 'Adult' (30–59)– 'Senior' (60+)Expected Output: Customer_ID, Age, Age_Grou

SELECT 
    `Customer ID`, 
    Age, 
    CASE 
        WHEN Age < 30 THEN 'Youth'
        WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group
FROM `sales-retail-493417.RetailSales.Retail Sales`;


--- QUESTION 7: For each Gender, count how many high-value transactions occurred (where Total Amount > 500). Expected Output: Gender, High_Value_Transactions
SELECT 
    Gender, 
    COUNTIF(`Total Amount` > 500) AS High_Value_Transactions
FROM `sales-retail-493417.RetailSales.Retail Sales`
GROUP BY Gender;

--Quetsion 8 For each Product Category, show only those categories where the total revenue exceeds 5,000.

SELECT 
    `Product Category`, 
    SUM(`Total Amount`) AS `Total Revenue`
FROM `sales-retail-493417.RetailSales.Retail Sales`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;


--Question 9 Display a new column called Unit_Cost_Category that labels a transaction as: Cheap' if Price per Unit < 50
--'Moderate' if Price per Unit between 50 and 200
--'Expensive' if Price per Unit > 200
--Expected Output: Transaction_ID, Price_per_Unit, Unit_Cost_Categor
SELECT 
    `Transaction ID`, 
    `Price per Unit`,
    CASE 
        WHEN `Price per Unit` < 50 THEN 'Cheap'
        WHEN `Price per Unit` BETWEEN 50 AND 200 THEN 'Moderate'
        WHEN `Price per Unit` > 200 THEN 'Expensive'
    END AS Unit_Cost_Category
FROM `sales-retail-493417.RetailSales.Retail Sales`;


--QUESTION 10 Display all transactions from customers aged 40 or older and add a column Spending_Level showing: 'High' if Total Amount > 1000'Low' otherwise
 SELECT 
    `Customer ID`, 
    Age, 
    `Total Amount`,
    CASE 
        WHEN `Total Amount` > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM `sales-retail-493417.RetailSales.Retail Sales`
WHERE Age >= 40;