create table testing_table(
name varchar(255),
contact_name varchar(255),
roll_no varchar(255)
);

alter table testing_table drop name;

alter table testing_table change contact_name username varchar(255);

alter table testing_table modify roll_no integer;

alter table testing_table
add column first_name varchar(255),
add column last_name varchar(255);

