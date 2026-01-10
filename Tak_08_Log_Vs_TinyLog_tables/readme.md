Objective:
Learn how Log-based engines differ from MergeTree engines in terms of performance and durability.

Steps:

Create two small tables — one using the Log engine and another using the TinyLog engine.

Insert data into both tables multiple times.

Observe how quickly data becomes available for queries.

Simulate a ClickHouse restart and recheck whether both tables still contain data.

Note that Log and TinyLog are faster for inserts but are less durable and not suitable for large or critical datasets.

Compare them to MergeTree-based tables for persistence and reliability.
