Task 5: Configure User Authentication (Local Password)

Locate Config File - Go to /etc/clickhouse-server/users.xml and back it up before editing.

Add User Entry - Under the <users> section, create a new user block with username and password (plaintext or SHA256).

Assign Profile - Set a minimal access profile (e.g., read-only) to restrict privileges.

Restrict Access (Optional) - Add allowed network or host conditions for better security.

Validate Config - Check XML syntax and ensure all tags are properly closed.

Restart Service - Restart clickhouse-server to apply changes and verify it starts without errors.

Test Login - Log in using the new credentials; confirm success with correct password and failure with incorrect one.

Check Logs - Review clickhouse-server.log for authentication entries and note successful/failed attempts.
