Task 9: Create a Memory Engine Table for Temporary Caching
  
Objective:
  
Use the in-memory storage engine to cache query results or hold transient data.
  
Steps:
  
Create a table using the Memory engine.

Insert small sample data into it.

Verify that the data is immediately accessible for reads.

Restart ClickHouse and confirm that all data is lost (as expected).

Note how Memory engine tables can be used for temporary caching, ETL intermediate steps, or ephemeral testing environments.

Document performance characteristics and limitations.
