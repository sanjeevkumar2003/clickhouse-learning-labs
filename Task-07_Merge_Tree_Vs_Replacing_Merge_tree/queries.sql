-- Step 1: Create a seperate Database
CREATE DATABASE IF NOT EXISTS engine_testing_dec23;

-- Step 2: Create a Table for Merge Tree Table
CREATE TABLE IF NOT EXISTS engine_testing_dec23.merge_tree
(
    id UInt16,
    product String
)
ENGINE = MergeTree()
ORDER BY id;

-- Step 3: Create a Table for replacing Merge Tree
CREATE TABLE IF NOT EXISTS engine_testing_dec23.replacing_merge_tree
(
    id UInt16,
    product String
)
ENGINE = ReplacingMergeTree()
ORDER BY id;

-- Step 4: Insert the Data in both the Tables
INSERT INTO engine_testing_dec23.merge_tree VALUES (1, 'A'), (1, 'A'), (1, 'B'), (1, 'C'), (2, 'A'), (2, 'B'), (2, 'C'), (3, 'A'), (4, 'A'), (5,'B'), (6, 'A'), (7, 'B'), (8, 'C'), (9, 'A'), (9, 'B'), (9, 'C'), (10, 'A'), (10, 'B'), (10, 'C'), (11, 'A'), (12, 'B'), (13, 'C'), (14, 'A'), (15, 'B'), (15, 'C'), (16, 'A'), (16, 'B'), (16, 'C'), (17, 'A'), (18, 'B'), (19, 'C'), (20, 'A'), (20, 'B'), (20, 'C')

INSERT INTO engine_testing_dec23.replacing_merge_tree VALUES (1, 'A'), (1, 'A'), (1, 'B'), (1, 'C'), (2, 'A'), (2, 'B'), (2, 'C'), (3, 'A'), (4, 'A'), (5,'B'), (6, 'A'), (7, 'B'), (8, 'C'), (9, 'A'), (9, 'B'), (9, 'C'), (10, 'A'), (10, 'B'), (10, 'C'), (11, 'A'), (12, 'B'), (13, 'C'), (14, 'A'), (15, 'B'), (15, 'C'), (16, 'A'), (16, 'B'), (16, 'C'), (17, 'A'), (18, 'B'), (19, 'C'), (20, 'A'), (20, 'B'), (20, 'C')

-- Step 5 : Preview the Tables
SElECT COUNT(*) FROM engine_testing_dec23.merge_tree;

SElECT COUNT(*) FROM engine_testing_dec23.replacing_merge_tree

-- Step 6 : Optimize it if Necessary

OPTIMIZE TABLE engine_testing_dec23.replacing_merge_tree;

OPTIMIZE TABLE engine_testing_dec23.merge_tree;
