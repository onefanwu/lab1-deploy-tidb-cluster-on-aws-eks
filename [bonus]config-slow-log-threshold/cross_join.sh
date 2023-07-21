#!/bin/bash
mysql --host 127.0.0.1 --port 4000 -u root test -e "SELECT *
FROM table1
CROSS JOIN table2;"