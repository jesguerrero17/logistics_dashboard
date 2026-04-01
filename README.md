## Supply Chain Analytics Pipeline

A fully automated, end‑to‑end data engineering project that simulates a real supply chain analytics workflow. This project ingests raw CSV data, loads it into PostgreSQL, normalizes it into a relational schema, and builds a clean analytical dataset ready for dashboards and business insights.

### Tools & Technologies

- Python — data ingestion, cleaning, ETL orchestration
- Pandas — preprocessing and column standardization
- SQLAlchemy — automated database creation and SQL execution
- PostgreSQL — relational database for staging + normalized tables
- SQL — schema design, constraints, and transformation logic

### What the Pipeline Does

- Automatically creates the PostgreSQL database if it doesn’t exist
- Loads raw supply chain data into a staging table
- Normalizes the data into dimension and fact tables
- Builds a structured backend suitable for analytics and dashboards
