
# 📊 SQL Sales Data Analysis Project

This project demonstrates practical SQL data analysis skills using a relational sales dataset.  
It includes table creation scripts, real-world queries, and business insights based on structured data.

---

## 📁 Project Structure
SQL-Sales-Portfolio/
├── sql/
│ ├── sales_schema.sql → Table creation scripts
│ ├── sample_queries.sql → Example SQL queries (JOINs, filters, aggregates)
│ └── insights.sql → Business insights written in SQL
├── data/
│ ├── customers.csv
│ ├── products.csv
│ ├── orders.csv
│ ├── orderdetails.csv
│ └── payments.csv
├── README.md


---

## 🔧 Tools Used

- **SQL Server 2022 Developer Edition**
- **SSMS (SQL Server Management Studio)**
- **Microsoft Excel** (for CSV cleaning)
- **Git & GitHub** (version control and portfolio)

---

## 🗃️ Dataset Overview

| Table         | Description                             |
|---------------|-----------------------------------------|
| Customers     | Customer info (name, email, location)   |
| Products      | List of available products              |
| Orders        | Basic order details                     |
| OrderDetails  | Items per order (line-level data)       |
| Payments      | Payments per order                      |

---

## 🔍 Key SQL Skills Demonstrated

- Table creation with keys and relationships
- Data import via CSV and BULK INSERT
- SQL `JOIN`s (INNER, LEFT)
- Aggregates: `SUM()`, `COUNT()`, `GROUP BY`
- Filtering, logic, and subqueries
- Business reporting using SQL

---

## 💡 Business Insights

Extracted in `insights.sql`, a few examples include:

- 🇮🇳 **India and USA** generate the highest revenue
- 🧑‍💼 Top 5 customers contribute to a large share of sales
- 🛒 Product categories with the most demand guide inventory planning
- 💳 **Credit Card** is the most used payment method
- 📆 Monthly sales reveal **seasonal trends**
- ❌ Some orders were placed but not paid — potential failed transactions

---

## 🧪 Example Queries

Examples from `sample_queries.sql`:

```sql
-- Total revenue by country
SELECT c.Country, SUM(p.AmountPaid) AS TotalRevenue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN Payments p ON o.OrderID = p.OrderID
GROUP BY c.Country
ORDER BY TotalRevenue DESC;

-- Most used payment methods
SELECT PaymentMethod, COUNT(*) AS Count
FROM Payments
GROUP BY PaymentMethod;


