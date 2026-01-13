CREATE DATABASE IF NOT EXISTS telco;

USE telco;


CREATE TABLE telco_data (
    Customer_ID VARCHAR(50) PRIMARY KEY,
    Gender VARCHAR(10),
    Senior_Citizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    Tenure INT,
    Phone_Service VARCHAR(5),
    Multiple_Lines VARCHAR(15),
    Internet_Service VARCHAR(20),
    Online_Security VARCHAR(15),
    Online_Backup VARCHAR(15),
    Device_Protection VARCHAR(15),
    Tech_Support VARCHAR(15),
    Streaming_TV VARCHAR(15),
    Streaming_Movies VARCHAR(15),
    Contract VARCHAR(20),
    Paperless_Billing VARCHAR(5),
    Payment_Method VARCHAR(50),
    Monthly_Charges DECIMAL(10,2),
    Total_Charges DECIMAL (10,2),
    Churn VARCHAR(5)
);

COMMIT;

SELECT COUNT(*) FROM telco_data;


SET SQL_SAFE_UPDATES = 0;


#Q1. How does customer tenure influence churn, and which lifecycle stage has the highest risk of customer loss?
SELECT Tenure, ROUND(AVG(Churn='Yes')*100,2) AS Churn_Rate
FROM telco_data
GROUP BY Tenure
ORDER BY Tenure ASC;


#Q2. Are certain payment methods associated with higher churn, indicating customer friction or instability?
SELECT Payment_Method, ROUND(AVG(Churn='Yes')*100,2) AS Churn_pct
FROM telco_data
GROUP BY Payment_Method
ORDER BY churn_pct ASC;


#Q3. How does contract type affect churn and revenue risk, and how can contract strategy improve retention?
SELECT Contract, COUNT(*) AS Total_Contracts,ROUND(AVG(Churn='Yes')*100,2) AS churn_pct
FROM telco_data
GROUP BY Contract
ORDER BY churn_pct DESC;





