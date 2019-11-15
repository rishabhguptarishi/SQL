Create Database vtapp;

 Create User vtapp_user@localhost Identified By 'password';
 
select user from mysql.user;

Grant ALL
On vtapp.*
To vtapp_user@localhost;