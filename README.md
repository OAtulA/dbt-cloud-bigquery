# dbt Cloud + BigQuery Data Transformation Pipeline

A hands-on cloud data engineering project demonstrating an **ELT workflow using Google BigQuery and dbt Cloud**. The project ingests source data into BigQuery, uses dbt to define and execute SQL transformations, and materializes transformed analytical tables back into BigQuery.

## Architecture

```text
                    ┌──────────────────────┐
                    │      Source Data     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    Google BigQuery   │
                    │     Raw / Source     │
                    │        Tables        │
                    └──────────┬───────────┘
                               │
                         dbt source()
                               │
                               ▼
                    ┌──────────────────────┐
                    │      dbt Cloud       │
                    │                      │
                    │  SQL + Jinja Models  │
                    │  Compile / Run       │
                    │  Transformations     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │    Google BigQuery   │
                    │  Transformed Models  │
                    └──────────────────────┘
```

## What I Built

* Created source tables in **Google BigQuery**.
* Created a dedicated **GCP service account** for dbt Cloud authentication.
* Configured BigQuery IAM permissions for the dbt service account.
* Connected **dbt Cloud to BigQuery**.
* Defined BigQuery tables as dbt sources using `source()`.
* Built SQL/Jinja transformation models in dbt.
* Used **dbt Cloud IDE** to develop and validate models.
* Used `dbt compile` to validate generated SQL.
* Used selective model execution with `dbt run --select`.
* Materialized the transformed model as a table in BigQuery.
* Organized dbt models by data domain.

## GCP Authentication & IAM

dbt Cloud connects to BigQuery using a dedicated GCP service account rather than personal user credentials.

The service account was configured with the following BigQuery roles:

* **BigQuery Data Editor**
* **BigQuery Data Viewer**
* **BigQuery Job User**
* **BigQuery Read Session User**

This provides practical experience with cloud authentication, IAM permissions, and service-account-based access to a data warehouse.

> For production environments, IAM permissions should be reviewed and reduced to the minimum required privileges for the workload.

## dbt Transformation

The project defines the BigQuery `orders` table as a dbt source and transforms it through a dbt model.

Example source reference:

```sql
{{ source('bigquery_source', 'orders') }}
```

The transformation currently derives analytical fields such as:

* `days_since_order`
* `is_completed`
* `order_value_tier`

The resulting model is materialized back into BigQuery, creating a transformed table that can be consumed by downstream analytics workloads.

## Project Structure

```text
dbt-cloud-bigquery/
│
├── models/
│   ├── DDLS/
│   │   └── orders_ddl.sql
│   │
│   └── ORDERS/
│       ├── schema.yaml
│       └── transformed_orders.sql
│
├── analyses/
├── macros/
├── seeds/
├── snapshots/
├── tests/
│
├── dbt_project.yml
└── README.md
```

## Technologies

| Technology          | Purpose                                               |
| ------------------- | ----------------------------------------------------- |
| **Google BigQuery** | Cloud data warehouse and execution engine             |
| **dbt Cloud**       | SQL transformation and analytics engineering workflow |
| **SQL**             | Data transformation                                   |
| **Jinja**           | Dynamic SQL / dbt templating                          |
| **GCP IAM**         | Service-account authentication and authorization      |
| **Git / GitHub**    | Version control and project collaboration             |

## Key dbt Commands

Compile the dbt project and inspect the generated SQL:

```bash
dbt compile
```

Run a specific transformation model:

```bash
dbt run --select transformed_orders
```

## What This Project Demonstrates

### Cloud Data Engineering

Hands-on experience connecting a cloud transformation workflow to **Google BigQuery** using a dedicated service account and IAM permissions.

### ELT Architecture

The project follows an ELT approach:

1. Data is stored in BigQuery.
2. dbt defines the transformation logic.
3. BigQuery executes the generated SQL.
4. dbt materializes the resulting analytical model in BigQuery.

### Analytics Engineering

The project demonstrates core dbt concepts including:

* Sources
* Models
* SQL transformations
* Jinja templating
* Model selection
* Compilation
* Materialization
* Schema configuration

## Future Improvements

The project is intentionally being developed incrementally. Planned improvements include:

* [ ] Add comprehensive dbt data-quality tests
* [ ] Add source and model documentation
* [ ] Improve staging and analytical data-model layers
* [ ] Add dbt model lineage and documentation
* [ ] Configure scheduled dbt Cloud jobs
* [ ] Add CI/CD validation for model changes
* [ ] Introduce development and production environments
* [ ] Apply stricter least-privilege IAM permissions

## Learning Objective

This project was built to gain practical experience with **cloud data warehousing, ELT pipelines, dbt, SQL transformations, BigQuery, and GCP IAM**, with an emphasis on building workflows that resemble real-world data engineering and analytics engineering environments.

---

**Author:** [OAtulA](https://github.com/OAtulA)
