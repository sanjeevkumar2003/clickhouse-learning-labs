Task 4: Revoke Specific Privileges from a Role and Test the Effect

Identify a role that currently holds multiple privileges (e.g., SELECT and INSERT).

Revoke one of the privileges (such as INSERT) from that role.

Verify the updated privilege list for the role to ensure changes have been applied.

Log in as a user who was assigned that role earlier.

Attempt the revoked operation (e.g., INSERT) to confirm that access is now denied.

Attempt the retained operation (e.g., SELECT) to confirm it still works.

Document the before-and-after behavior to understand privilege propagation in ClickHouse.
