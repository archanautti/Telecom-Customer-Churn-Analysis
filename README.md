📌 Telecom Customer Churn Analysis
📖 Project Overview:

Customer churn is a major challenge for telecom companies because losing existing customers directly impacts revenue and business growth.

This project analyzes telecom customer behavior to identify the factors that influence customer churn, detect high-risk customers, and provide actionable insights that help improve customer retention.

An end-to-end analytics solution was developed using Python, SQL Server, Power BI, and Streamlit to transform raw customer data into meaningful business decisions.

❓ Business Problem:

Telecom companies need to understand:

Why are customers leaving the service?
Which customer groups have a higher churn risk?
How much revenue is lost due to customer churn?
What actions can improve customer retention?

This project provides a data-driven approach to answer these questions.


🎯 Project Objectives:

Analyze customer churn patterns.
Identify important churn factors.
Segment customers based on behavior.
Find high-risk customers.
Analyze revenue impact caused by churn.
Build interactive dashboards for business teams.
Provide customer retention strategies.



🛠️ Tools & Technologies:

Data Analysis

Python
Pandas
NumPy
Matplotlib
Seaborn

Database

SQL Server

Visualization

Power BI
Streamlit

Machine Learning

Scikit-learn
Logistic Regression

Data Source

Excel datasets





🔄 Project Workflow:

1. Data Collection

Collected telecom-related datasets containing:

Customer details
Contract information
Payment details
Service usage
Customer support information
Churn status




2. Data Cleaning & Preparation:

Performed:

Missing value handling
Duplicate removal
Data type correction
Feature preparation
Data transformation


3. SQL Data Modeling:

Used SQL Server for:

Data storage
Table relationships
Data transformation
Business analysis queries


Dimension Tables:

Customer
Contract
Geography
Payment
Plan
Internet Service
Date

Fact Table

Customer Churn Fact Table



📊 Exploratory Data Analysis:

Performed analysis to understand customer behavior.

Customer Analysis

Studied:

Customer demographics
Tenure distribution
Revenue patterns
Usage behavior
Churn Analysis

Analyzed churn based on:

Contract type
Payment method
Internet service
Customer segments
Revenue Impact Analysis

Identified:

Revenue loss from churned customers
High-value customers at risk


🤖 Machine Learning Approach:

Built a churn prediction model to identify customers who have a higher probability of leaving.

Model Used

Logistic Regression

Process:
Data preprocessing
Feature encoding
Train-test split
Feature scaling
Model training
Performance evaluation

The model supports business teams in identifying customers who require retention attention.


📈 Power BI Dashboard:

Created interactive dashboards for business decision-making.

Dashboard 1: Executive Overview

Provides overall business performance:

Total Customers
Revenue
Churn Customers
Churn Rate
Revenue Loss
Dashboard 2: Customer Analysis

Provides customer behavior insights:

Customer segments
Tenure analysis
Revenue distribution
Demographic analysis
Dashboard 3: Churn Analysis

Identifies churn patterns:

Churn by contract
Churn by payment method
Churn by services
Dashboard 4: Risk Analysis

Focuses on retention:

High-risk customers
Revenue impact
Customer risk categories


🚀 Streamlit Application:

Built an interactive application to make analysis accessible.

Features:

✔ Customer overview
✔ Churn analysis
✔ Risk analysis
✔ Interactive charts
✔ Business insights


💡 Key Insights:

From the analysis:

Customers with shorter contracts have higher churn probability.
New customers require stronger engagement strategies.
High-value customers leaving causes significant revenue loss.
Customer support experience impacts retention.
Long-term customers show better retention.


✅ Business Solution:

Based on the analysis, telecom companies can:

Target high-risk customers with personalized offers.
Encourage long-term contracts.
Improve customer support services.
Introduce loyalty programs.
Monitor customer behavior regularly



📂 Repository Structure:

Telecom-Customer-Churn-Analysis

│
├── dataset
│   └── Fact_Customer_Churn.csv
│
├── notebooks
│   └── EDA_and_Model.ipynb
│
├── SQL
│   └── Churn_Analysis.sql
│
├── PowerBI
│   └── Telecom_Churn_Dashboard.pbix
│
├── Streamlit
│   ├── app.py
│   ├── pages
│   ├── models
│   └── utils
│
├── images
│   └── Dashboard Screenshots
│
└── README.md

📌 Project Impact:

This project helps telecom businesses move from reactive decisions to proactive customer retention by identifying churn risks early and supporting data-driven strategies.

👩‍💻 Author

Archana Utti
