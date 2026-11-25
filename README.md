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



\## Requirements



Before running the project, make sure you have installed:



\- PostgreSQL

\- DBeaver Community Edition (or another SQL client)

\- Git



You also need access to the project CSV files.



SQL: CREATE DATABASE financial\_analysis;



\### Step 1. Create Database Schema



1\. Connect to the `financial\_analysis` database.

2\. Open `sql/01\_schema.sql`.

3\. Execute the script.



This creates the database tables, primary keys,

foreign keys, and indexes.



\### Step 2. Import Dataset



Import the CSV files from the `data/` directory

into the corresponding PostgreSQL tables.



Recommended import order:



1\. customers.csv

2\. counterparties.csv

3\. accounts.csv

4\. transactions.csv

5\. exchange\_rates.csv

6\. transaction\_anomalies.csv



In DBeaver:



1\. Open the `financial\_analysis` connection.

2\. Expand the `public` schema and locate the target table.

3\. Right-click the table.

4\. Select Import Data.

5\. Choose CSV as the source.

6\. Select the corresponding CSV file.

7\. Check column mapping and data types.

8\. Run the import.



Make sure that the target tables are empty before importing.



\### Step 3. Verify Data Import



Run the verification query to check the number of records

in each table.



Expected dataset size:



\- 1,000 customers

\- 1,500 accounts

\- 2,000 counterparties

\- 50,000 transactions

\- 2,190 exchange rate records

\- 1,250 anomaly labels





\## SQL Analytics



The project includes six core analytical queries:



... in process ...



* Transaction Volume -

Business question -

SQL techniques -

Result -

Business interpretation -



SQL scripts are available in the `sql/` directory.





\## Screenshots



Screenshots of database structure, SQL queries,

and analytical results are available in the `screenshots/`

directory.





\## Disclaimer



This project is intended for educational and portfolio purposes.



All customer, account, counterparty, and transaction records

are synthetic.



The anomaly detection rules and thresholds are illustrative

and do not represent official AML regulations, legal reporting

thresholds, or production financial monitoring systems.



Exchange rates are synthetic and are not intended for

financial or investment decisions.









