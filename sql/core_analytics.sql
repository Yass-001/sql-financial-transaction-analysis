-- Transaction Volume

select
    DATE_TRUNC('month', transaction_date) as month,
    COUNT(*) as transaction_count,
    SUM(amount) as total_amount
from transactions
where status = 'COMPLETED'
group by 1
order by 1;

-- Transaction Volume by currency

select
    DATE_TRUNC('month', transaction_date) as month,
    currency,
    COUNT(*) as transaction_count,
    SUM(amount) as total_amount
from transactions
where status = 'COMPLETED'
group by
    DATE_TRUNC('month', transaction_date),
    currency
order by
    month,
    currency;

-- Large Transactions

select
    t.transaction_id,
    c.customer_id,
    c.customer_name,
    a.account_id,
    t.transaction_date,
    t.amount,
    t.currency,
    t.status 
from transactions t
join accounts a
    on t.account_id = a.account_id
join customers c
    on a.customer_id = c.customer_id 
where t.amount > 10000
order by t.amount desc; 

-- Transaction Frequency

select 
    c.customer_id,
    c.customer_name,
    DATE_TRUNC('hour', t.transaction_date) as transaction_hour,
    COUNT(*) as transaction_count,
    SUM(t.amount) as total_amount
from transactions t 
join accounts a 
    on t.account_id  = a.account_id 
join customers c 
    on a.customer_id = c.customer_id 
where t.status = 'COMPLETED'
group by 
    c.customer_id,
    c.customer_name,
    DATE_TRUNC('hour', t.transaction_date)
having COUNT(*) >= 5
order by
    transaction_count desc,
    transaction_hour;

-- Unusual Activity

with monthly_activity as (
    select
        c.customer_id,
        c.customer_name,
        DATE_TRUNC('month', t.transaction_date) AS month,
        COUNT(*) as transaction_count
    from transactions t
    join accounts a
        on t.account_id = a.account_id
    join customers c
        on a.customer_id = c.customer_id
    where t.status = 'COMPLETED'
    group by
        c.customer_id,
        c.customer_name,
        DATE_TRUNC('month', t.transaction_date)
),

calendar_months as (
    select
        GENERATE_SERIES(
            DATE_TRUNC('month', (select MIN(transaction_date) from transactions)),
            DATE_TRUNC('month', (select MAX(transaction_date) from transactions)),
            INTERVAL '1 month'
        ) as month
),

customer_month_grid as (
    select
        c.customer_id,
        c.customer_name,
        m.month
    from customers c
    cross join calendar_months m
),

activity_history as (
    select
        g.customer_id,
        g.customer_name,
        g.month,
        COALESCE(ma.transaction_count, 0) as transaction_count,
        AVG(COALESCE(ma.transaction_count, 0)) over (
            partition by g.customer_id
            order by g.month
            rows between unbounded preceding and 1 preceding
        ) as historical_avg
    from customer_month_grid g
    left join monthly_activity ma
        on g.customer_id = ma.customer_id
        and g.month = ma.month
)

select
    customer_id,
    customer_name,
    month,
    transaction_count as current_month_transactions,
    ROUND(historical_avg, 2) as historical_avg_transactions,
    ROUND(
        transaction_count / NULLIF(historical_avg, 0),
        2
    ) as activity_ratio
from activity_history
where month = (
    select MAX(month)
    from calendar_months
)
and historical_avg > 0
and transaction_count >= 5
and transaction_count > historical_avg * 2
order by activity_ratio desc;

-- Country Analysis

select
    country,
    currency,
    COUNT(*) as transaction_count,
    SUM(amount) as total_amount,
    ROUND(AVG(amount), 2) as average_amount
from transactions
where status = 'COMPLETED'
group by
    country,
    currency
order by
    transaction_count desc;

-- Country Analysis by currency

select
    t.country,
    COUNT(*) as transaction_count,
    ROUND(SUM(t.amount * er.rate_to_eur), 2) as total_amount_eur,
    ROUND(AVG(t.amount * er.rate_to_eur), 2) as average_amount_eur
from transactions t
join exchange_rates er
    on t.currency = er.currency
    and t.transaction_date::date = er.rate_date
where t.status = 'COMPLETED'
group by t.country
order by total_amount_eur desc;

-- Country Analysis with high risk

select
    country,
    COUNT(*) as transaction_count,
    COUNT(distinct account_id) as affected_accounts,
    SUM(amount) as total_amount
from transactions
where country in ('IR', 'KP', 'SY')
and status = 'COMPLETED'
group by country
order by transaction_count desc;

-- Dormant Accounts

with transaction_history as (
    select 
        t.transaction_id,
        t.account_id,
        t.transaction_date,
        t.amount,
        t.currency,
        t.transaction_type,
        LAG(t.transaction_date) over (
        partition by t.account_id 
        order by t.transaction_date 
        ) as previous_transaction_date
from transactions t 
where t.status = 'COMPLETED'
)

select 
    th.transaction_id,
    th.account_id,
    c.customer_id,
    c.customer_name,
    th.previous_transaction_date,
    th.transaction_date AS reactivation_date,
    th.transaction_date::date - th.previous_transaction_date::date
        AS inactive_days,
    th.amount,
    th.currency,
    th.transaction_type
from transaction_history th
join accounts a
    on th.account_id = a.account_id 
join customers c
    on a.customer_id = c.customer_id 
where th.previous_transaction_date is not Null 
and th.transaction_date - th.previous_transaction_date
>= interval '90 days'
order by inactive_days desc;



