-- Step 1: Back up the config file
sudo cp /etc/clickhouse-server/users.xml /etc/clickhouse-server/users.xml.bak

-- Step 2: create a new user config file in the safe place
sudo nano /etc/clickhouse-server/users.d/myuser.xml
<?xml version = "1.0"?>
<clickhouse>
    <users>
        <Naruto>
            <password>abcdef</password>
            <profile>readonly</profile>
            <networks>
                <ip>127.0.0.1</ip>
            </networks>
        </Naruto>
    </users>
</clickhouse>

-- step 3: check the xml syntax
sudo xmllint --noout /etc/clickhouse-server/users.d/myuser.xml

-- step 4: Restart clickhouse-server
sudo systemctl restart clickhouse-server

--step 5: check the status of the clickhouse-server
sudo systemctl status clickhouse-server --no-pager

--step 6: Test the login credentials
clickhouse-client -u Naruto --password abcdef

-- step 7: check logs
sudo tail -n 200 /var/log/clickhouse-server/clickhouse-server.log
