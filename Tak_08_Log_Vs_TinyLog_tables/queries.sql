-- Step 1: Create A Table for log engine

CREATE TABLE IF NOT EXISTS engine_testing_dec23.log
(
    id UInt16,
    product String
)
ENGINE = Log;

-- Step 2: Create a Table for tinylog

CREATE TABLE IF NOT EXISTS engine_testing_dec23.tiny_log
(
    id UInt16,
    product String
)
ENGINE = TinyLog;

-- Step 3: Insert the Data into the both the tables

INSERT INTO engine_testing_dec23.log VALUES (1, 'A'), (1, 'A'), (1, 'B'), (1, 'C'), (2, 'A'), (2, 'B'), (2, 'C'), (3, 'A'), (4, 'A'), (5,'B'), (6, 'A'), (7, 'B'), (8, 'C'), (9, 'A'), (9, 'B'), (9, 'C'), (10, 'A'), (10, 'B'), (10, 'C'), (11, 'A'), (12, 'B'), (13, 'C'), (14, 'A'), (15, 'B'), (15, 'C'), (16, 'A'), (16, 'B'), (16, 'C'), (17, 'A'), (18, 'B'), (19, 'C'), (20, 'A'), (20, 'B'), (20, 'C');

INSERT INTO engine_testing_dec23.tiny_log VALUES (1, 'A'), (1, 'A'), (1, 'B'), (1, 'C'), (2, 'A'), (2, 'B'), (2, 'C'), (3, 'A'), (4, 'A'), (5,'B'), (6, 'A'), (7, 'B'), (8, 'C'), (9, 'A'), (9, 'B'), (9, 'C'), (10, 'A'), (10, 'B'), (10, 'C'), (11, 'A'), (12, 'B'), (13, 'C'), (14, 'A'), (15, 'B'), (15, 'C'), (16, 'A'), (16, 'B'), (16, 'C'), (17, 'A'), (18, 'B'), (19, 'C'), (20, 'A'), (20, 'B'), (20, 'C');

--Step 4 : Restart the Server
sudo systemctl restart clickhouse-server;

-- Step 5 : Preview the Tables
SELECT COUNT(*) FROM engine_testing_dec23.tiny_log;

SELECT COUNT(*) FROM engine_testing_dec23.log;

SELECT COUNT(*) FROM engine_testing_dec23.merge_tree;
