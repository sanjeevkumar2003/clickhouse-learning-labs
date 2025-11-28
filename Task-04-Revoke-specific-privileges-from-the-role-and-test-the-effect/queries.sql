-- step 1: identify the role
SHOW GRANTS FOR user_admin;
GRANT user_admin TO Eren;

--step 2: revoke one privilege
REVOKE ALTER ON test.* FROM user_admin;
SHOW GRANTS FOR user_admin;

-- step 3: login and check
clickhouse-client -u Eren --password abcdef
ALTER TABLE test.events ADD COLUMN centre Float32;

-- output : Received exception from server (version 25.8.2):
-- Code: 497. DB::Exception: Received from localhost:9000. DB::Exception: Eren: Not enough privileges. To execute this query, it's necessary to have the grant ALTER ADD COLUMN(centre) ON test.events. (ACCESS_DENIED)

INSERT INTO test.events VALUES(23, 1.1345, 2.4536);

SELECT * FROM test.events LIMIT 1;
