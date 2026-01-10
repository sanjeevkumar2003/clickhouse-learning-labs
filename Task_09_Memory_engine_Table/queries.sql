-- Step 1:  Create a Table For memory engine

CREATE TABLE IF NOT EXISTS engine_testing_dec23.memory_table
(
    id UInt16,
    name String,
    age UInt16
)
ENGINE = Memory;

-- Step 2 : Insert a data into table

INSERT INTO engine_testing_dec23.memory_table VALUES (1, 'Mikasa', 16), (2, 'eren', 17), (3, 'jinyong', 58), (4, 'daniel park', 18), (5, 'gapryong kim', 58), (6, 'charles choi', 58), (7, 'tom lee', 58), (8, 'luffy', 19), (9, 'levi', 22), (10, 'nami', 23)

-- Step 3: Preview the table
SELECT * FROM engine_testing_dec23.memory_table;

SELECT * FROM engine_testing_dec23.memory_table WHERE id < 5;

-- Step 4: Restart the Server and preview the table
sudo systemctl restart clickhouse-server

clickhouse-client

SELECT * FROM engine_testing_dec23.memory_table;

Query id: a4ea7ed2-82cf-4c08-a1b9-ded9193ff658

Ok.

0 rows in set. Elapsed: 0.002 sec.
