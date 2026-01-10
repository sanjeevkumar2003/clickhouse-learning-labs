Task 7: Compare MergeTree vs ReplacingMergeTree in Deduplication Scenarios

Objective:
Understand how ReplacingMergeTree handles duplicate records compared to MergeTree.

Steps:
Prepare identical datasets that include duplicate rows.


Load these datasets separately into both a MergeTree and a ReplacingMergeTree table.


Observe that MergeTree keeps all inserted duplicates, while ReplacingMergeTree merges them during background merges.


Manually trigger merges if necessary and note when duplicates disappear.


Compare final row counts between both tables after merges.


Record findings on deduplication behavior and when ReplacingMergeTree should be used.
