#!/bin/bash
# mysql --host 127.0.0.1 --port 4000 -u root test -e "set GLOBAL tidb_slow_log_threshold=5000;";
mysql --host 127.0.0.1 --port 4000 -u root test -e "set @@global.tidb_slow_log_threshold = 5000;"