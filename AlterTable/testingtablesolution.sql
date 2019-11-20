
create table testing_table(
  name varchar(255),
  contact_name varchar(255),
  roll_no varchar(255)
);
/*+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| name         | varchar(255) | YES  |     | NULL    |       |
| contact_name | varchar(255) | YES  |     | NULL    |       |
| roll_no      | varchar(255) | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+*/

alter table testing_table drop name;
/*+--------------+--------------+------+-----+---------+-------+
| Field        | Type         | Null | Key | Default | Extra |
+--------------+--------------+------+-----+---------+-------+
| contact_name | varchar(255) | YES  |     | NULL    |       |
| roll_no      | varchar(255) | YES  |     | NULL    |       |
+--------------+--------------+------+-----+---------+-------+*/

alter table testing_table change contact_name username varchar(255);
/*+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| username | varchar(255) | YES  |     | NULL    |       |
| roll_no  | varchar(255) | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+*/

alter table testing_table modify roll_no integer;
/*+----------+--------------+------+-----+---------+-------+
| Field    | Type         | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| username | varchar(255) | YES  |     | NULL    |       |
| roll_no  | int(11)      | YES  |     | NULL    |       |
+----------+--------------+------+-----+---------+-------+*/

alter table testing_table
  add column first_name varchar(255),
  add column last_name varchar(255);
/*+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| username   | varchar(255) | YES  |     | NULL    |       |
| roll_no    | int(11)      | YES  |     | NULL    |       |
| first_name | varchar(255) | YES  |     | NULL    |       |
| last_name  | varchar(255) | YES  |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+*/
