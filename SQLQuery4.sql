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


------- find the total number of active and canceled subscriptions.SELECT 
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
