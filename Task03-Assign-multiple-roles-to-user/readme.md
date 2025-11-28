Task 3: Assign Multiple Roles to a User (Testing Role Combination)
Steps

Plan the Roles
Identify two distinct roles to represent different privilege sets.
Example idea:
read_role: Grants read-only access (SELECT privileges).
writer_role: Grants data modification privileges (INSERT or ALTER).


Create the Roles
Define both roles within ClickHouse to represent different functional levels of access.
Ensure each role has distinct, non-overlapping permissions.


Assign Privileges to Each Role
Configure read_role to allow only data reading operations on one or more databases.
Configure writer_role to allow write or modification privileges on the same or another dataset.


Create a User for Testing
Add a new user account intended for testing combined role behavior.
Initially, do not assign any direct privileges to this user.


Assign Multiple Roles to the Same User
Attach both read_role and writer_role to the new user.
Confirm via privilege listing commands that both roles are associated with the user.


Test Effective Privileges
Verify that the user can perform all actions allowed by either role.
The user should be able to read data (from read_role)
The user should also be able to modify data (from writer_role)
Confirm that operations outside both roles (e.g., DDL changes) are still restricted.


Temporarily Revoke One Role
Remove the writer_role from the user and re-test.
The user should now retain only the privileges provided by the read_role.


Document Observations
Record the effective privileges before and after role revocation.
Note that in ClickHouse, roles are additive, not hierarchical — users can have multiple roles, and all active roles collectively determine access rights.
