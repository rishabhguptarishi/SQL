Create Database Campaign;

Use Campaign;

Create Table People(
  id integer Not Null Auto_Increment,
  email varchar(255),
  phone varchar(255),
  city varchar(255),
  Constraint pk_people Primary Key (id)
);

SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
/* relogin with mysql --local-infile -u root -p campaign*/

LOAD DATA LOCAL INFILE 'C:\Users\vinsol pc\Downloads\email_subscribers.txt' 
INTO TABLE People COLUMNS TERMINATED BY ',' LINES TERMINATED BY '\n'
(@col1, @col2, @col3) Set email = @col1, phone = @col2, city = @col3;

Select Distinct city From People;
/*+-----------+
| city      |
+-----------+
|  Lucknow  |
|  Chennai  |
|  Kolkatta |
|  Delhi    |
|  Mumbai   |
+-----------+
5 rows in set (0.10 sec)*/

Select Count(*) 'number of people', City
From People
Group By City;
/*+------------------+-----------+
| number of people | City      |
+------------------+-----------+
|               39 |  Lucknow  |
|               42 |  Chennai  |
|               38 |  Kolkatta |
|               40 |  Delhi    |
|               41 |  Mumbai   |
+------------------+-----------+
5 rows in set (0.00 sec)*/

Select Count(*) 'number of people', City
From People
Group By City
Having Count(*) = (
  Select Count(*)
  From People
  Group By City
  Order By Count(*) DESC
  Limit 1
);
/*+------------------+----------+
| number of people | City     |
+------------------+----------+
|               42 |  Chennai |
+------------------+----------+
1 row in set (0.00 sec)*/

Select Distinct Substring(email, Locate('@',email)+1) Domain
From People;
/*+--------------+
| Domain       |
+--------------+
| hotmail.com  |
| yahoo.com    |
| me.com       |
| gmail.com    |
+--------------+
4 rows in set (0.00 sec)*/

Select Distinct Substring(email, Locate('@',email)+1) as Domain, Count(*) 'number of Users'
From People
Group By Domain
Having Count(*) = (
  Select Count(*)
  From People
  Group By Substring(email, Locate('@',email)+1)
  Order By Count(*) DESC
  Limit 1
);
/*+------------+-----------------+
| Domain     | number of Users |
+------------+-----------------+
| yahoo.com  |              51 |
| me.com     |              51 |
+------------+-----------------+
2 rows in set (0.00 sec)*/

