Create database ColorMixtures;

Use ColorMixtures;
Drop Table colors;
Drop table mixtures;
Create Table Colors(
  Id integer Not Null Auto_Increment,
  name varchar(255) Not Null,
  density decimal(3,2),
  Constraint pk_colors Primary Key (Id)
);
/*+---------+---------------+------+-----+---------+----------------+
| Field   | Type          | Null | Key | Default | Extra          |
+---------+---------------+------+-----+---------+----------------+
| Id      | int(11)       | NO   | PRI | NULL    | auto_increment |
| name    | varchar(255)  | NO   |     | NULL    |                |
| density | decimal(3,2) | YES  |     | NULL    |                |
+---------+---------------+------+-----+---------+----------------+
3 rows in set (0.16 sec)*/

Alter Table Colors Auto_Increment = 10;
/*0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0*/

Create Table Mixtures(
  id integer Not Null Auto_Increment,
  parent1_id integer,
  parent2_id integer,
  mix_id integer,
  mix_density decimal(3,2),
  parent1_perc smallint,
  parent2_perc smallint,
  Constraint pk_mixtures Primary Key (id)
);
/*+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| id           | int(11)       | NO   | PRI | NULL    | auto_increment |
| parent1_id   | int(11)       | YES  |     | NULL    |                |
| parent2_id   | int(11)       | YES  |     | NULL    |                |
| mix_id       | int(11)       | YES  |     | NULL    |                |
| mix_density  | decimal(3,2) | YES  |     | NULL    |                |
| parent1_perc | smallint(6)   | YES  |     | NULL    |                |
| parent2_perc | smallint(6)   | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+*/

Alter Table Mixtures Add Constraint fk_parent1_id Foreign Key (parent1_id) References Colors (Id);

Alter Table Mixtures Add Constraint fk_parent2_id Foreign Key (parent2_id) References Colors (Id);

Alter Table Mixtures Add Constraint fk_mix_id Foreign Key (mix_id) References Colors (Id);
/*+--------------+---------------+------+-----+---------+----------------+
| Field        | Type          | Null | Key | Default | Extra          |
+--------------+---------------+------+-----+---------+----------------+
| id           | int(11)       | NO   | PRI | NULL    | auto_increment |
| parent1_id   | int(11)       | YES  | MUL | NULL    |                |
| parent2_id   | int(11)       | YES  | MUL | NULL    |                |
| mix_id       | int(11)       | YES  | MUL | NULL    |                |
| mix_density  | decimal(3,2) | YES  |     | NULL    |                |
| parent1_perc | smallint(6)   | YES  |     | NULL    |                |
| parent2_perc | smallint(6)   | YES  |     | NULL    |                |
+--------------+---------------+------+-----+---------+----------------+*/

Insert Into Colors (name, density) Values
('Red' , 0.20),
('Green' , 0.30),
('Blue', 0.40),
('Yellow', 0.20),
('Pink', 0.30),
('Cyan', 0.40),
('White', 0.28);
/*+----+--------+---------+
| Id | name   | density |
+----+--------+---------+
| 10 | Red    |    0.20 |
| 11 | Green  |    0.30 |
| 12 | Blue   |    0.40 |
| 13 | Yellow |    0.20 |
| 14 | Pink   |    0.30 |
| 15 | Cyan   |    0.40 |
| 16 | White  |    0.28 |
+----+--------+---------+
7 rows in set (0.00 sec)*/

Insert Into Mixtures(parent1_id , parent2_id , mix_Id , mix_density , parent1_perc , parent2_perc) Values
(10 , 11 , 13 , 0.6 , 30 ,  70 ),
(10 , 12 , 14 , 0.5 , 50 ,  50 ),
(11 , 12 , 15 , 0.75 , 40 , 60 ),
(10 , 13 , 16 , 0.28 , 80 , 20 );
/*+----+------------+------------+--------+-------------+--------------+--------------+
| id | parent1_id | parent2_id | mix_id | mix_density | parent1_perc | parent2_perc |
+----+------------+------------+--------+-------------+--------------+--------------+
|  1 |         10 |         11 |     13 |        0.60 |           30 |           70 |
|  2 |         10 |         12 |     14 |        0.50 |           50 |           50 |
|  3 |         11 |         12 |     15 |        0.75 |           40 |           60 |
|  4 |         10 |         13 |     16 |        0.28 |           80 |           20 |
+----+------------+------------+--------+-------------+--------------+--------------+
4 rows in set (0.00 sec)*/