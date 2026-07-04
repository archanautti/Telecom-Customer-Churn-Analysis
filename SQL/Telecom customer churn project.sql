CREATE DATABASE Telechom_Customer_Churn;

USE Telechom_Customer_Churn;

DESCRIBE fact_customer_churn;

DESCRIBE dim_customer;

SELECT * FROM fact_customer_churn LIMIT 5;

SELECT * FROM dim_customer LIMIT 5;

SELECT *
FROM fact_customer_churn f
JOIN dim_customer d
ON f.Customer_ID = d.Customer_ID;

DESCRIBE fact_customer_churn;

DESCRIBE dim_customer;

SELECT * FROM fact_customer_churn LIMIT 5;

SELECT * FROM dim_customer LIMIT 5;

DESCRIBE fact_customer_churn;

SHOW COLUMNS FROM fact_customer_churn;

SELECT DISTINCT Churn_Flag
FROM fact_customer_churn;

SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM fact_customer_churn;

DESCRIBE dim_customer;

SELECT DISTINCT Churn_Flag
FROM fact_customer_churn;

DESCRIBE dim_customer;

SELECT DISTINCT Churn_Flag
FROM fact_customer_churn;

SELECT
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate_Percentage
FROM fact_customer_churn;

DESCRIBE dim_customer;

SELECT
    d.Gender,
    COUNT(*) AS Total_Customers,
    SUM(f.Churn_Flag) AS Churned_Customers,
    ROUND(
        SUM(f.Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM fact_customer_churn f
JOIN dim_customer d
    ON f.Customer_ID = d.Customer_ID
GROUP BY d.Gender;

SELECT
    d.Senior_Citizen,
    COUNT(*) AS Total_Customers,
    SUM(f.Churn_Flag) AS Churned_Customers,
    ROUND(
        SUM(f.Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM fact_customer_churn f
JOIN dim_customer d
    ON f.Customer_ID = d.Customer_ID
GROUP BY d.Senior_Citizen;

SELECT
    d.Gender,
    d.Senior_Citizen,
    COUNT(*) AS Total_Customers,
    SUM(f.Churn_Flag) AS Churned_Customers,
    ROUND(
        SUM(f.Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM fact_customer_churn f
JOIN dim_customer d
    ON f.Customer_ID = d.Customer_ID
GROUP BY
    d.Gender,
    d.Senior_Citizen
ORDER BY Churn_Rate DESC;



/* Day 5 */ 

SELECT
    SUM(Monthly_Charges_INR) AS Total_Revenue_Leakage
FROM fact_customer_churn
WHERE Churn_Flag = 1;

DESCRIBE dim_date;

DESCRIBE dim_date;

SELECT
    d.Month,
    COUNT(*) AS Churned_Customers
FROM fact_customer_churn f
JOIN dim_date d
    ON f.Date_ID = d.Date_ID
WHERE f.Churn_Flag = 1
GROUP BY d.Month
ORDER BY d.Month DESC;

SELECT
    d.Gender,
    d.Customer_Segment,
    COUNT(*) AS Churned_Customers,
    SUM(f.Monthly_Charges_INR) AS Revenue_Leakage
FROM fact_customer_churn f
JOIN dim_customer d
    ON f.Customer_ID = d.Customer_ID
WHERE f.Churn_Flag = 1
GROUP BY
    d.Gender,
    d.Customer_Segment
ORDER BY Revenue_Leakage DESC;


/* Day 6 */

DESCRIBE fact_customer_churn;

SELECT
    Customer_ID,
    Tenure_Months,
    CASE
        WHEN Tenure_Months <= 12 THEN 'New'
        WHEN Tenure_Months BETWEEN 13 AND 36 THEN 'Established'
        ELSE 'Loyal'
    END AS Customer_Tier
FROM fact_customer_churn;


SELECT
    CASE
        WHEN Tenure_Months <= 12 THEN 'New'
        WHEN Tenure_Months BETWEEN 13 AND 36 THEN 'Established'
        ELSE 'Loyal'
    END AS Customer_Tier,
    COUNT(*) AS Customer_Count
FROM fact_customer_churn
GROUP BY Customer_Tier
ORDER BY Customer_Count DESC;


SELECT COUNT(*) AS Total_Customers
FROM fact_customer_churn;


/* Day 7 */

SELECT
    CASE
        WHEN Tenure_Months <= 12 THEN 'New'
        WHEN Tenure_Months BETWEEN 13 AND 36 THEN 'Established'
        ELSE 'Loyal'
    END AS Customer_Tier,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(
        SUM(Churn_Flag) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM fact_customer_churn
GROUP BY Customer_Tier
ORDER BY Churn_Rate DESC;

SELECT
    CASE
        WHEN Tenure_Months <= 12 THEN 'New'
        WHEN Tenure_Months BETWEEN 13 AND 36 THEN 'Established'
        ELSE 'Loyal'
    END AS Customer_Tier,
    COUNT(*) AS Total_Customers,
    ROUND(AVG(Monthly_Charges_INR), 2) AS ARPU
FROM fact_customer_churn
GROUP BY Customer_Tier
ORDER BY ARPU DESC;

CREATE OR REPLACE VIEW vw_churn_analysis AS
SELECT
    CASE
        WHEN Tenure_Months <= 12 THEN 'New'
        WHEN Tenure_Months BETWEEN 13 AND 36 THEN 'Established'
        ELSE 'Loyal'
    END AS Customer_Tier,
    COUNT(*) AS Total_Customers,
    SUM(Churn_Flag) AS Churned_Customers,
    ROUND(SUM(Churn_Flag)*100.0/COUNT(*),2) AS Churn_Rate,
    ROUND(AVG(Monthly_Charges_INR),2) AS ARPU
FROM fact_customer_churn
GROUP BY Customer_Tier;


SELECT *
FROM vw_churn_analysis;

/* Day8 */

SELECT
    dc.Contract_Type,
    COUNT(*) AS Customer_Count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS Distribution_Percentage
FROM Fact_Customer_Churn f
JOIN Dim_Contract dc
    ON f.Contract_ID = dc.Contract_ID
GROUP BY dc.Contract_Type
ORDER BY Customer_Count DESC;

DESCRIBE Fact_Customer_Churn;

DESCRIBE Dim_Internet_Service;

SELECT
    di.Internet_Type,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN f.Churn_Flag = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    ROUND(
        SUM(CASE WHEN f.Churn_Flag = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM Fact_Customer_Churn f
JOIN Dim_Internet_Service di
    ON f.Internet_Service_ID = di.Internet_Service_ID
WHERE di.Internet_Type IN ('Fiber optic', 'DSL')
GROUP BY di.Internet_Type;

CREATE INDEX idx_fact_customer
ON Fact_Customer_Churn(Customer_ID);

CREATE INDEX idx_fact_contract
ON Fact_Customer_Churn(Contract_ID);

CREATE INDEX idx_fact_internet
ON Fact_Customer_Churn(Internet_Service_ID);

CREATE INDEX idx_fact_churn
ON Fact_Customer_Churn(Churn_Flag);

SHOW INDEX FROM Fact_Customer_Churn;


/* Day 9 */

SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM Fact_Customer_Churn;

SELECT COUNT(*) AS Churned_Customers
FROM Fact_Customer_Churn
WHERE Churn_Flag = 'Yes';

SELECT ROUND(
    COUNT(CASE WHEN Churn_Flag = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
    2
) AS Churn_Rate
FROM Fact_Customer_Churn;

DESCRIBE Fact_Customer_Churn;

SELECT SUM(Monthly_Charges_INR) AS Revenue_Loss
FROM Fact_Customer_Churn
WHERE Churn_Flag = 'Yes';

SELECT AVG(Tenure_Months) AS Avg_Tenure
FROM Fact_Customer_Churn;