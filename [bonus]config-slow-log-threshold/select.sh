#!/bin/bash

mysql --host 127.0.0.1 --port 4000 -u root test -e "ANALYZE TABLE table2;"