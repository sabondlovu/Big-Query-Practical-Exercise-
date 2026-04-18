--This is to see if my data is accurate 

SELECT * FROM `sales-retail-493417.RetailSales.Retail Sales` LIMIT 1000;

--Question 1 to pull transactions occured in 2023

 SELECT *
FROM `sales-retail-493417.RetailSales.Retail Sales`
 WHERE EXTRACT(YEAR FROM Date) = 2023;

 ---Question 2 Display transactions where the Total_Amount is more than the average Total_Amount of the entire dataset.
 SELECT *
FROM `sales-retail-493417.RetailSales.Retail Sales`
WHERE 'Total Amount' > (SELECT AVG('Total Amount') 
FROM `sales-retail-493417.RetailSales.Retail Sales`);-----

---Quetion 3 

SELECT SUM('Total Amount') AS Total_Revenue
FROM `sales-retail-493417.RetailSales.Retail Sales`;