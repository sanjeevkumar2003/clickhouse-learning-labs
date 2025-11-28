-- step 1: Role Creation
CREATE ROLE IF NOT EXISTS analyst_readonly;

-- step 2: Grant privileges
GRANT SELECT ON analytics_db.* TO analyst_readonly;
GRANT SELECT ON geo.* TO analyst_readonly;

-- step 3: USER Creation
CREATE USER IF NOT EXISTS ram IDENTIFIED BY 'abcdef';
CREATE USER IF NOT EXISTS tom IDENTIFIED BY 'abcdef';

-- step 4: roles assigning
GRANT analyst_readonly TO ram;
GRANT analyst_readonly TO tom;

-- step 5: validation
clickhouse-client -u ram --password abcdef
SELECT * FROM analytics_db.product_sale LIMIT 1;
TRUNCATE analytics_db.product_sale;

clickhouse-client -u tom --password abcdef
SELECT * FROM geo.cell_towers LIMIT 1;
RENAME TABLE geo.cell_towers TO geo.cell_tower;

-- output: Received exception from server (version 25.8.2):
-- Code: 497. DB::Exception: Received from localhost:9000. DB::Exception: ram: Not enough privileges. To execute this query, it's necessary to have the grant TRUNCATE ON analytics_db.product_sale. (ACCESS_DENIED)

-- step 6: viewing priviliges

SHOW GRANTS FOR analyst_readonly;
SHOW GRANTS FOR ram;
SHOW GRANTS FOR tom;
