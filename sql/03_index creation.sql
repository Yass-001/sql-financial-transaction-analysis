-- Index creation

-- Accounts

create index idx_accounts_customer_id
on accounts(customer_id);

-- Transactions

create index idx_transactions_account_id
on transactions(account_id);

create index idx_transactions_counterparty_id
on transactions(counterparty_id);

create index idx_transactions_date
on transactions(transaction_date);

create index idx_transactions_status
on transactions(status);

create index idx_transactions_currency
on transactions(currency);

-- Counterparties

create index idx_counterparties_country
on counterparties(country);

-- Exchange rates

create index idx_exchange_rates_date
on exchange_rates(rate_date);
