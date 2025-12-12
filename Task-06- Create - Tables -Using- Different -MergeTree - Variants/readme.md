Objective:
Understand the purpose and behavior of the core MergeTree family engines — MergeTree, ReplacingMergeTree, SummingMergeTree, and AggregatingMergeTree.
Steps:
Choose or create a dedicated database for engine testing.

Create one table each using the four different engines mentioned above.

Insert similar data into all tables to enable comparison of their internal behaviors.

For each table:

Verify that it appears in system tables with the correct engine type.

Check storage directory structure under ClickHouse’s data path to see how data parts are stored.

Note differences in how each engine merges or aggregates data over time.

Document the use case best suited for each engine:

MergeTree for general-purpose analytical workloads.

ReplacingMergeTree for deduplication and late data corrections.

SummingMergeTree for pre-aggregated numeric metrics.

AggregatingMergeTree for aggregation states in materialized summaries.
