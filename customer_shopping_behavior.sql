select * from customer;

--what is the total revenue genereated by male vs female customer
select gender, sum(purchase_amount) as revenue from customer group by gender

--which customer used a discount but still spent more than the average purchase amount

select customer_id, purchase_amount from customer where discount_applied='Yes' and purchase_amount>=(select avg(purchase_amount)from customer)

--which are the top 5 products with highest average review rating
select item_purchased, ROUND(AVG(review_rating::NUMERIC),2)as "Average Product Rating" from cusTomer
group by item_purchased
order by avg(review_rating) desc
limit 5;

--COMPARE THE AVERAGE PURCHASE AMOUNT BETWEEN STANDARD AND EXPRESS SHIPPING
select shipping_type,
ROUND(avg(purchase_amount),2)
from customer
where shipping_type in ('standard','Express')
group by shipping_type

-- do subsribed customer more ? compare average spend and total revenue between subscribers and non- subscribers
select subscription_status,
count(customer_id) as total_customers,
ROUND(avg(purchase_amount),2) as avg_spend,
ROUND(SUM(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue, avg_spend desc;

-- which 5 products have the highest percentage of purchases with discount applied

select item_purchased,
ROUND(100 * sum(CASE WHEN discount_applied ='YES' THEN 1 ELSE 0 END)/COUNT(*),2) as discount_rate
from customer
group by item_purchased
order by discount_rate desc
limit 5;

--segment customers inot new, returning and loyal based on their total number of previous purchases and show the cout of each segements
with customer_type as(
select customer_id, previous_purchases,
CASE
when previous_purchases = 1 then 'New'
when previous_purchases between 2 and 10 then 'Returining'
else 'loyal'
end as customer_segment
from customer
)
select customer_segment, count(*) "Number of Customers"
from customer_type
group by customer_segment

--what are the top 3 most purchased products within category
with item_counts as(
select category,
item_purchased,
count(customer_id) as total_orders,
ROW_NUMBER() over(partition by category order by count(customer_id) DESC) as item_rank
from customer
group by category, item_purchased
)

select item_rank, category, item_purchased, total_orders
from item_counts
where item_rank<=3;

-- are customers who are repeat buyers(more than 5 previous purchases)
select subscription_status,
count(customer_id) as repeat_buyers
from customer
where previous_purchases >5
group by subscription_status

--what is the revenue contribution of each age groups
select age_group,
SUM(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue desc;

