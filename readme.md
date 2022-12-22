# How to Join a fact and a type 2 dimension (SCD2) table

https://www.startdataengineering.com/post/how-to-join-fact-scd2-tables/

## Introduction
If you are using a data warehouse, you would have heard of fact and dimension tables. Simply put, fact tables are used to record a business event and dimension tables are used to record the attributes of business items(eg user, item tables in an e-commerce app). This is also referred to as a star schema or dimension modeling.

For example, in an e-commerce website, a fact table would contain information about orders, such as when the order was placed, the items in that order, who placed that order, etc. The dimension tables would be an item table (containing item id, item price, size, etc) and an user table (containing user id, user name, user address etc).

If you are wondering 
* how can I store my table’s history over time ?
* how can I join a fact table and an SCD2 dimension table ?

## What is an SCD2 table and why use it?
The dimensional data in a data warehouse are usually derived from an application’s database. There are 7 common types of ways to model and store dimensional data in a data warehouse. In this post, we will look exclusively at `Type 2: Add New Row.`

SCD2 stands for slowly changing dimension type 2. In this type, we create a new row for each change to an existing record in the corresponding transaction table. Each row in the SCD2 dimension table will have row effective and row expiration datetime columns to denote the range within which that row represents the state of the data.

Application table
Assume in our e-commerce applications database that we have a user table to store user attributes.

## Setup for MS SQL
[I'm a relative reference to a repository file](../db_samples.sql)