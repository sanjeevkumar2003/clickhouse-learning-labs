Task 1: Create a New User with Limited Privileges (SELECT Only)

Log in as an administrator user on the ClickHouse server.

Identify or create a test database (e.g., analytics_db) for this exercise.

Create a test table with a few sample records to work with. Use generateRandom() to insert random records

Create a new user with a secure password.

Grant this user only SELECT privileges on the chosen database.

Test that the user can successfully run a SELECT query.

Attempt non-SELECT operations such as INSERT or ALTER to confirm that access is denied.

Document the behavior and confirm that permission boundaries are enforced correctly.
