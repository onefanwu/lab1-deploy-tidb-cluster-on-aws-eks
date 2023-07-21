#!/bin/bash

total=50

pstr="[=======================================================================]"

# Create tables
mysql --host 127.0.0.1 --port 4000 -u root test -e "CREATE TABLE IF NOT EXISTS table3 (id INT AUTO_INCREMENT PRIMARY KEY, random_num FLOAT);";
mysql --host 127.0.0.1 --port 4000 -u root test -e "CREATE TABLE IF NOT EXISTS table4 (id INT AUTO_INCREMENT PRIMARY KEY, random_num FLOAT);";

# Insert data
for i in $(seq 1 $total)
do
   mysql --host 127.0.0.1 --port 4000 -u root test -e "INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());
   INSERT INTO table3 VALUES (NULL, RAND());";
   mysql --host 127.0.0.1 --port 4000 -u root test -e "INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());
   INSERT INTO table4 VALUES (NULL, RAND());";

   pd=$(( $i * 73 / $total ))
   printf "\r%3d.%1d%% %.${pd}s" $(( $i * 100 / $total )) $(( ($i * 1000 / $total) % 10 )) $pstr
done

mysql --host 127.0.0.1 --port 4000 -u root test -e "SELECT count(*) FROM table3;"


# How to make up a SQL statement which takes very long time to complete, base on the tables created above?
# Pro tips: cross join.
