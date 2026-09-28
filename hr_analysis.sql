-- HR Analytics & Employee Attrition Analysis
USE hr_analytics;

-- Overall summary
SELECT COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate,
       ROUND(AVG(Monthly_Income),2) AS Avg_Monthly_Income,
       ROUND(AVG(Years_At_Company),2) AS Avg_Years_At_Company
FROM employees;

-- Department
SELECT Department, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Department ORDER BY Attrition_Rate DESC;

-- Job role
SELECT Job_Role, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Job_Role ORDER BY Attrition_Rate DESC;

-- Overtime
SELECT Overtime, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Overtime ORDER BY Attrition_Rate DESC;

-- Age group
SELECT CASE
         WHEN Age < 25 THEN 'Under 25'
         WHEN Age BETWEEN 25 AND 34 THEN '25-34'
         WHEN Age BETWEEN 35 AND 44 THEN '35-44'
         WHEN Age BETWEEN 45 AND 54 THEN '45-54'
         ELSE '55+'
       END AS Age_Group,
       COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees
GROUP BY Age_Group;

-- Average income by department
SELECT Department, ROUND(AVG(Monthly_Income),2) AS Avg_Monthly_Income
FROM employees GROUP BY Department ORDER BY Avg_Monthly_Income DESC;

-- Job satisfaction
SELECT Job_Satisfaction, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Job_Satisfaction ORDER BY Job_Satisfaction;

-- Work-life balance
SELECT Work_Life_Balance, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Work_Life_Balance ORDER BY Work_Life_Balance;

-- Tenure
SELECT CASE
         WHEN Years_At_Company <= 2 THEN '0-2 Years'
         WHEN Years_At_Company BETWEEN 3 AND 5 THEN '3-5 Years'
         WHEN Years_At_Company BETWEEN 6 AND 10 THEN '6-10 Years'
         ELSE '10+ Years'
       END AS Tenure_Group,
       COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Tenure_Group;

-- Data quality: missing values
SELECT COUNT(*) AS Total_Rows,
       SUM(Employee_ID IS NULL) AS Missing_Employee_ID,
       SUM(Department IS NULL) AS Missing_Department,
       SUM(Job_Role IS NULL) AS Missing_Job_Role,
       SUM(Monthly_Income IS NULL) AS Missing_Income,
       SUM(Attrition IS NULL) AS Missing_Attrition
FROM employees;

-- Duplicate Employee IDs
SELECT Employee_ID, COUNT(*) AS Duplicate_Count
FROM employees GROUP BY Employee_ID HAVING COUNT(*) > 1;

-- Attrition values
SELECT Attrition, COUNT(*) AS Employee_Count
FROM employees GROUP BY Attrition;

-- Gender
SELECT Gender, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Gender ORDER BY Attrition_Rate DESC;

-- Education
SELECT Education, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Education ORDER BY Attrition_Rate DESC;

-- Distance from home
SELECT CASE
         WHEN Distance_From_Home_KM <= 5 THEN '0-5 KM'
         WHEN Distance_From_Home_KM BETWEEN 6 AND 10 THEN '6-10 KM'
         WHEN Distance_From_Home_KM BETWEEN 11 AND 20 THEN '11-20 KM'
         ELSE '20+ KM'
       END AS Distance_Group,
       COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Distance_Group;

-- Performance rating
SELECT Performance_Rating, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Performance_Rating ORDER BY Performance_Rating;

-- Training
SELECT Training_Times_Last_Year, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Training_Times_Last_Year
ORDER BY Training_Times_Last_Year;

-- Environment satisfaction
SELECT Environment_Satisfaction, COUNT(*) AS Total_Employees,
       SUM(Attrition='Yes') AS Employees_Left,
       ROUND(SUM(Attrition='Yes')/COUNT(*)*100,2) AS Attrition_Rate
FROM employees GROUP BY Environment_Satisfaction
ORDER BY Environment_Satisfaction;
