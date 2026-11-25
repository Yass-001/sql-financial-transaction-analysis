# \# sql-financial-transaction-analysis

SQL-based financial transaction analysis project using PostgreSQL. Includes data modeling, data quality checks, transaction analytics and anomaly detection.



\## Project Overview



This project explores financial transaction data using PostgreSQL.



The analysis focuses on identifying transaction patterns,

monitoring customer activity, examining geographic transaction

distribution, and detecting potentially unusual financial behavior.



The project uses a synthetic financial dataset containing

50,000 transactions and related customer, account, and

counterparty information.



The main objective is to demonstrate practical SQL skills

through database design, data quality checks, analytical queries,

and rule-based anomaly detection.



\## Business Problem



Financial institutions process large volumes of transactions

every day. Analyzing these transactions helps identify unusual

activity, monitor customer behavior, and understand financial

flows.



This project addresses the following analytical questions:



\- How does transaction volume change over time?

\- Which transactions exceed a defined amount threshold?

\- Which customers perform unusually frequent transactions?

\- Which customers show significant changes in activity

&#x20; compared with their historical behavior?

\- How are transactions distributed across countries?

\- Which accounts resume activity after a long period

&#x20; of inactivity?



These questions are explored using SQL queries in PostgreSQL.



\## Dataset Description



The project uses a synthetic financial dataset generated

for educational and analytical purposes.



The dataset contains the following tables:



&#x20;              | Table  | Records |  Description  |



| customers             | 1,000   | Customer information and risk categories |

| accounts              | 1,500   | Customer bank accounts |

| counterparties        | 2,000   | Transaction counterparties |

| transactions          | 50,000  | Financial transaction records |

| exchange\_rates        | 2,190   | Daily exchange rates against EUR |

| transaction\_anomalies | 1,250   | Predefined anomaly labels |



\### Data Characteristics



\- Transaction period: 2025

\- Currencies: CZK, EUR, USD, GBP, PLN, CHF

\- Transaction statuses: COMPLETED, PENDING, FAILED, REVERSED

\- Customer risk categories: LOW, MEDIUM, HIGH



All records are synthetic. Exchange rates are illustrative

and should not be treated as historical market data.



The anomaly labels represent predefined educational examples,

not confirmed cases of financial crime.



\## Technologies Used



| Technology | Purpose |



| PostgreSQL | Relational database management |

| SQL        | Data querying and analysis |

| DBeaver    | Database management and SQL development |

| Git        | Version control |

| GitHub     | Project hosting and documentation |



\## Project Structure



... in process ...



sql-financial-transaction-analysis/



data/

accounts.csv

counterparties.csv

customers.csv

transactions.csv

exchange\_rates.csv

transaction\_anomalies.csv



sql/

01\_schema.sql



screenshots/



.gitignore

README.md











...
...
...

\-- Analytics --

* Transaction Volume -

Business question -

SQL techniques -

Result -

Business interpretation -

