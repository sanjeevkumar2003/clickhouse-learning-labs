-- step 1: roles creation
CREATE ROLE IF NOT EXISTS read_only;
CREATE ROLE IF NOT EXISTS write_only;

-- step 2: Assign Privileges
GRANT SELECT ON test.* TO read_only;
GRANT INSERT ON test.* TO write_only;
GRANT ALTER ON geo.* TO write_only;

-- step 3: user creation
CREATE USER IF NOT EXISTS Eren IDENTIFIED BY 'abcdef';

-- step 4: Assign roles to the user
GRANT read_only TO Eren;
GRANT write_only TO Eren;
SHOW GRANTS FOR  Eren;
SHOW GRANTS FOR  read_only;
SHOW GRANTS FOR  write_only;

-- step 5: test privileges
clickhouse-client -u Eren --password abcdef
SELECT * FROM test.events;
SELECT * FROM geo.cell_towers;

-- output : Received exception from server (version 25.8.2):
-- Code: 497. DB::Exception: Received from localhost:9000. DB::Exception: Eren: Not enough privileges. To execute this query, 
--it's necessary to have the grant SELECT(radio, mcc, net, area, cell, unit, lon, lat, range, # # # samples, changeable, created, updated, averageSignal, h3_8, h3_11) ON geo.cell_towers. (ACCESS_DENIED)

INSERT INTO test.events VALUES (99, 150.178, 154.1897);
ALTER TABLE geo.cell_towers DROP COLUMN h3_11;

-- step 6: revoking write_only role
REVOKE write_only FROM Eren;
SHOW GRANTS FOR Eren;
INSERT INTO test.import VALUES(213, 'ea', 'ab','2025-11-28 10:13:15');

-- output : Received exception from server (version 25.8.2):
-- Code: 497. DB::Exception: Received from localhost:9000. DB::Exception: Eren: Not enough privileges. To execute this query, 
--it's necessary to have the grant SELECT(radio, mcc, net, area, cell, unit, lon, lat, range, # # # samples, changeable, created, updated, averageSignal, h3_8, h3_11) ON geo.cell_towers. (ACCESS_DENIED)
