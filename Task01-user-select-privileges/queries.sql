# Step 1: Create a Sample Database called analytics_db
CREATE DATABASE IF NOT EXISTS analytics_db

# Step 2 : Create a Table called product_sale
CREATE TABLE analytics_db.product_sale(
    Id UUID,
    Product_Name String,
    Price UInt64,
    Stock UInt64,
    sale UInt64
)
ENGINE = MergeTree()
ORDER BY (Product_Name, Id)
SETTINGS index_granularity = 8124;

# Step 3: Insert mock data into product_sale
INSERT INTO analytics_db.product_sale
SELECT * FROM
generateRandom('Id UUID, Product_Name String, Price UInt64, Stock UInt64, sale UInt64', 10, 10, 0)
LIMIT 50;

# Step 4 : User Creation
CREATE USER ram IDENTIFIED BY 'abcdef';

# Step 5: Grant Select privileges 
GRANT SELECT ON analytics_db.* TO ram;

# Step 6: Test
clickhouse-client -u ram --password abcdef
SELECT * FROM analytics_db.product_sale;
INSERT INTO analytics_db.product_sale
SELECT * FROM
generateRandom('Id UUID, Product_Name String, Price UInt64, Stock UInt64, sale UInt64', 0, 10, 0)
LIMIT 50;

# output : Received exception from server (version 25.8.2):
# Code: 497. DB::Exception: Received from localhost:9000. DB::Exception: ram: Not enough privileges. To execute this query, it's necessary to have the grant INSERT(Id, Product_Name, Price, Stock, sale) ON analytics_db.product_sale. (ACCESS_DENIED)


