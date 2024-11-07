# LITA_CAPSTONE_PROJECT

[PROJECT OVERVIEW](#project-overview)

[DATA SOURCES](#data-sources)

[TOOLS USED](#tools-used)

[DATA CLEANING AND PREPARATION](#data-cleaning-and-preparation)

[EXPLORATORY AND ANALYSIS](#exploratory-and-analysis)

[DATA ANALYSIS](#data-analysis)

[RESULTS FROM EXCEL](#results-from-excel)

[RESULTS FROM SQL](#results-from-sql)

[VISUALIZATION](#visualization)

### PROJECT OVERVIEW
----
This data analysis aims to generate insight into the customer data for a subscription service to identify
segments and trends. The goal is to understand customer behavior, track subscription types,
and identify key trends in cancellations and renewals. So the need for exploration of the customer data to uncover key insights, 
to make reasonable decisions which enable to tell compelling stories and know the performances from our data.
 
### DATA SOURCES
----
The Primary Source of the Data Used here, LITA Capstone Dataset.xlsx

### TOOLS USED
----
- Microsoft Excel for 
  i.	Data Cleaning 
  ii.	Data Analysis
  iii.	Data VIsualisaton

-Excel for querying
-PowerBi for Visualisation and giving a compelling report
-Github for portfolio building

### DATA CLEANING AND PREPARATION
----
  i.	Data Loading and Inspection
  ii.	Handling missing variables
  iii.	Data Cleaning and Formatting
  
### EXPLORATORY AND ANALYSIS
----
This involves the exploration of the Data to answer question such as:
- find the most popular subscription type by the number of customers.
- find customers who canceled their subscription within 6 months.
- calculate the average subscription duration for all customers.
- find customers with subscriptions longer than 12 months.

### DATA ANALYSIS
----
Below are some codes used during the exploration
```SQL
SELECT * FROM [dbo].[Capstone_Consumer]

------ retrieve the total number of customers from each region.
 
Select  region, 
	count(Customerid) as Total_Customers 
from 
	[dbo].[Capstone_Consumer]
Group by 
	region

----find the most popular subscription type by the number of customers.

Select top 1 subscriptiontype, 
	count(customerid) as Total_Customers
From 
	[dbo].[Capstone_Consumer]
Group by 
	subscriptiontype 
Order by 
	total_customers desc


---find customers who canceled their subscription within 6 months.

SELECT customerid,subscriptionstart,subscriptionend,Canceled,
      DATEDIFF(month, subscriptionstart, subscriptionend) AS duration_months
FROM 
	[dbo].[Capstone_Consumer]
WHERE 
	subscriptionend IS NOT NULL
	AND DATEDIFF(month, subscriptionstart, subscriptionend) <= 6;



----calculate the average subscription duration for all customers.

Select 
	avg(datediff(day, subscriptionstart, subscriptionend)) as Avg_Subscription_Duration
From 
	[dbo].[Capstone_Consumer]


---find customers with subscriptions longer than 12 months.
SELECT customerid, subscriptionstart,subscriptionend,
	DATEDIFF(day, subscriptionstart, subscriptionend) AS duration_days
FROM 
	[dbo].[Capstone_Consumer]
WHERE 
	subscriptionend IS NOT NULL
	AND DATEDIFF(day, subscriptionstart, subscriptionend) > 365

---calculate total revenue by subscription type.

Select subscriptiontype,
	Sum(revenue) as total_revenue 
From 
	[dbo].[Capstone_Consumer]
Group by 
	subscriptiontype 
ORDER BY 
	Total_Revenue DESC


---find the top 3 regions by subscription cancellations.
SELECT TOP 3 region, 
	COUNT(*) AS cancellation_count
FROM 
	[dbo].[Capstone_Consumer]
WHERE 
	subscriptionend IS NOT NULL  -- Assuming a NULL end date means active
GROUP BY 
	region
ORDER BY 
	cancellation_count DESC;


------- find the total number of active and canceled subscriptions.
SELECT 
    CASE 
        WHEN subscriptionend IS NULL OR subscriptionend > GETDATE() THEN 'Active'
        ELSE 'Canceled'
    END AS subscription_status,
    COUNT(customerid) AS total_subscriptions
FROM 
	[dbo].[Capstone_Consumer]
GROUP BY 
    CASE 
        WHEN subscriptionend IS NULL OR subscriptionend > GETDATE() THEN 'Active'
        ELSE 'Canceled'
    END;
```
### RESULTS FROM EXCEL

<img width="953" alt="EXCEL CONSUMER DATA" src="https://github.com/user-attachments/assets/d9084dd8-c5c8-45ad-b7c2-4875b5f03ce3">

<img width="959" alt="EXCEL" src="https://github.com/user-attachments/assets/7ed32515-d745-482f-a6a0-ec15d3aef14c">

### RESULTS FROM SQL

![SQL CONSUMER 1](https://github.com/user-attachments/assets/387213fb-3d31-42c3-a46e-df4bbe1be263)

![SQL CONSUMER 2](https://github.com/user-attachments/assets/0d67d7f7-f14d-40ca-84f7-1eb8a5672780)

![SQL CONSUMER 3](https://github.com/user-attachments/assets/52fe13c7-bcb1-4f23-b0c1-d92936b3bd4f)

![SQL CONSUMER 4](https://github.com/user-attachments/assets/cd6a9420-4598-4804-ad01-e38e8556715a)

![SQL CONSUMER 5](https://github.com/user-attachments/assets/ece3adc5-0d64-4d5c-a88e-757f962b7c46)

![SQL CONSUMER 6](https://github.com/user-attachments/assets/63cd99f4-bd82-4e49-b550-c291f2e1a98f)

![SQL CONSUMER 7](https://github.com/user-attachments/assets/6c4790a2-8c60-4823-a76e-a25f26ddeef5)

### VISUALIZATIONS
