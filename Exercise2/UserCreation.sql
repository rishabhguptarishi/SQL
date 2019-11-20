Create Database vtapp;

 Create User vtapp_user@localhost Identified By 'password';
 
select user from mysql.user;
/*+------------------+
| user             |
+------------------+
| ODBC             |
| bob              |
| mysql.infoschema |
| mysql.session    |
| mysql.sys        |
| rishi            |
| root             |
| vtapp_user       |
+------------------+
8 rows in set (0.12 sec)*/

Grant ALL
On vtapp.*
To vtapp_user@localhost;
/*Query OK, 0 rows affected (1.26 sec)*/

show grants for vtapp_user@localhost;
/*+---------------------------------------------------------------+
| Grants for vtapp_user@localhost                               |
+---------------------------------------------------------------+
| GRANT USAGE ON *.* TO `vtapp_user`@`localhost`                |
| GRANT ALL PRIVILEGES ON `vtapp`.* TO `vtapp_user`@`localhost` |
+---------------------------------------------------------------+
2 rows in set (0.00 sec)*/