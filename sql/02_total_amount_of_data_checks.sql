select 'customers' as table_name, COUNT(*) as rows_count
from customers

union all

select 'accounts', COUNT(*)
from accounts

union all

select 'transactions', COUNT(*)
from transactions

union all

select 'counterparties', COUNT(*)
from counterparties

union all

select 'exchange_rates', COUNT(*)
from exchange_rates

union all

select 'transaction_anomalies', COUNT(*)
from transaction_anomalies;