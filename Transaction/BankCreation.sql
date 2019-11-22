create database Bank;

Use Bank;

Create Table Users(
  id integer Not Null,
  name varchar(255) Not Null,
  email varchar(255),
  account_no varchar(255),
  Constraint pk_users Primary Key (id)
);

Create Table Accounts(
  id integer Not Null,
  account_no varchar(255) Not Null Unique,
  balance decimal,
  Constraint pk_accounts Primary Key (id)
);

Alter Table Users Add Constraint fk_account_no Foreign Key (account_no) References Accounts (account_no);

Insert Into Accounts Values(1, '1234', 1000),
(2, '1235', 100),
(3, '1245', 1000);

Insert Into Users Values(1, 'userA', 'a@gmail.com', '1234'),
(2, 'userB', 'b@gmail.com', '1235'),
(3, 'userC', 'c@gmail.com', '1245');