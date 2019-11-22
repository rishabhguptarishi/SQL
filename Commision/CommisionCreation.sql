Create Table Departments(
  id integer Not Null Auto_Increment,
  name varchar(255),
  Constraint pk_departments Primary Key (id)
);

Create Table Employees(
  id integer Not Null Auto_Increment,
  name varchar(255),
  salary integer,
  department_id integer,
  Constraint pk_employees Primary Key (id)
);

Create Table Commissions(
  id integer Not Null Auto_Increment,
  employee_id integer,
  commission_amount integer,
  Constraint pk_commissions Primary Key (id)
);

Alter Table Employees Add Constraint fk_department_id Foreign Key (department_id) References Departments(id);

Alter Table Commissions Add Constraint fk_employee_id Foreign Key (employee_id) References Employees(id);

Insert Into Departments (name) Values
('Banking'),
('Insurance'),
('Services');

Insert Into Employees (name, salary, department_id) Values
('Chris Gayle', 1000000, 1),
('Michael Clarke', 800000, 2),
('Rahul Dravid', 700000, 1),
('Ricky Pointing',  600000, 2),
('Albie Morkel', 650000, 2),
('Wasim Akram', 750000, 3);

Insert Into Commissions(employee_id, commission_amount) Values
(1, 5000),
(2, 3000),
(3, 4000),
(1, 4000),
(2, 3000),
(4, 2000),
(5, 1000),
(6, 5000);

Show Index From Employees