--- Step 1: creating a dedicate database if not exists
CREATE DATABASE IF NOT EXISTS engine_testing;

-- Step 2 : creating a tables for every engine
CREATE TABLE IF NOT EXISTS engine_testing.merge_tree
(
    id UInt64,
    ts DateTime,
    category String,
    value UInt64
)
ENGINE = MergeTree()
ORDER BY id;

CREATE TABLE IF NOT EXISTS engine_testing.replacing_merge_tree
(
    id UInt64,
    ts DateTime,
    category String,
    value UInt64
)
ENGINE = ReplacingMergeTree()
ORDER BY id;

CREATE TABLE IF NOT EXISTS engine_testing.summing_merge_tree
(
    id UInt64,
    ts DateTime,
    category String,
    value UInt64
)
ENGINE = SummingMergeTree()
ORDER BY id;

CREATE TABLE IF NOT EXISTS engine_testing.aggregate_merge_tree
(
    category String,
    value AggregateFunction(sum, UInt64)
)
ENGINE = AggregatingMergeTree()
ORDER BY category

-- step 3: Inserting data into tables:

INSERT INTO engine_testing.merge_tree VALUES (1, now(), 'A', 10), (1, now() + 10, 'B', 15), (2, now() + 20, 'C', 30), (3, now() + 30, 'D', 60);

INSERT INTO engine_testing.replacing_merge_tree VALUES (1, now(), 'A', 10), (1, now() + 10, 'B', 15), (2, now() + 20, 'C', 30), (3, now() + 30, 'D', 60);

INSERT INTO engine_testing.summing_merge_tree VALUES (1, now(), 'A', 10), (1, now() + 10, 'B', 15), (2, now() + 20, 'C', 30), (3, now() + 30, 'D', 60);

INSERT INTO engine_testing.aggregate_merge_tree
SELECT
category,
sumState(toUInt64(value))
FROM
(
SELECT 'A' AS category, 10 AS value
UNION ALL SELECT 'A' , 50
UNION ALL SELECT 'B', 40
UNION ALL SELECT  'B', 60
)
GROUP BY category;

--- step 4:  checking whether the data is inserted

SELECT * FROM engine_testing.merge_tree;

SELECT * FROM engine_testing.replacing_merge_tree;

SELECT * FROM engine_testing.aggregate_merge_tree;

SELECT category, sumMerge(value) FROM engine_testing.aggregate_merge_tree GROUP BY category ORDER BY category;

-- step 5: checking storage directory

sudo ls -R  /var/lib/clickhouse/data/engine_testing/summing_merge_tree

sudo ls -R  /var/lib/clickhouse/data/engine_testing/merge_tree

sudo ls -R  /var/lib/clickhouse/data/engine_testing/aggregate_merge_tree

sudo ls -R  /var/lib/clickhouse/data/engine_testing/replacing_merge_tree
