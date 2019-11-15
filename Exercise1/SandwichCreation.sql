Create Table Tastes(
  Name Varchar(255) Not Null,
  Filling Varchar(255) Not Null,
  Constraint pk_tastes Primary Key (name,filling)
);

Create Table Locations(
  LName Varchar(255),
  Phone Varchar(10),
  Address Varchar(255),
  Constraint pk_lname Primary Key (LName)
);

Create Table Sandwiches(
  Location Varchar(255) Not Null,
  Bread Varchar(255) Not Null,
  Filling Varchar(255) Not Null,
  Price Double(10,2),
  Constraint pk_sandwiches Primary Key (Location, Bread, Filling)
);

Alter Table sandwiches Add Constraint fk_location Foreign Key (Location) References Locations(LName);

Insert Into tastes 
Values('Brown', 'Turkey'),
('Brown', 'Beef'),
('Brown', 'Ham'),
('Jones', 'Cheese'),
('Green', 'Beef'),
('Green', 'Turkey'),
('Green', 'Cheese');

Insert Into Locations
Values('Lincon', '6834523', 'Lincon Place'),
('O''Neill''s', '6742134', 'Pearse St'),
('Old Nag', '7678132', 'Dame St'),
('Buttery', '7023421', 'College St');

Insert Into sandwiches Values
('Lincon', 'Rye', 'Beef', 1.35),
('Lincon', 'Rye', 'Ham', 1.25),
('Lincon', 'White', 'Ham', 1.40),
('O''Neill''s', 'White', 'Cheese', 1.20),
('O''Neill''s', 'White', 'Turkey', 1.25),
('O''Neill''s', 'Whole', 'Ham', 1.35),
('Old Nag', 'Rye', 'Beef', 1.35),
('Old Nag', 'Rye', 'Ham', 1.40),
('Buttery', 'White', 'Ham', 1.10),
('Buttery', 'White', 'Cheese', 1.00);

Select * From sandwiches;
Select * From tastes;
Select * From locations;

