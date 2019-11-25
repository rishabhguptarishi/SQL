Show variables like 'autocommit';

Set autocommit = 0;

Start Transaction;
/*Query OK, 0 rows affected (0.00 sec)*/

Update Accounts Set balance = balance + 1000 Where account_no = (Select account_no From Users Where name = 'userA');
/*Query OK, 1 row affected (0.77 sec)
Rows matched: 1  Changed: 1  Warnings: 0*/

commit;
/*Query OK, 0 rows affected (0.14 sec)*/

Start Transaction;
/*Query OK, 0 rows affected (0.00 sec)*/

Update Accounts Set balance = balance - 500 Where account_no = (Select account_no From Users Where name = 'userA');
/*Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0*/

commit;
/*Query OK, 0 rows affected (0.08 sec)*/

Start Transaction;
/*Query OK, 0 rows affected (0.00 sec)*/

Update Accounts Set balance = balance - 200 Where account_no = (Select account_no From Users Where name = 'userA');
/*Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0*/

Update Accounts Set balance = balance + 200 Where account_no = (Select account_no From Users Where name = 'userB');
/*Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0*/

commit;
/*Query OK, 0 rows affected (0.07 sec)*/