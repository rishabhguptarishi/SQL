Create Table Branches(
BCode Varchar(3),
Librarian Varchar(255),
Address Varchar(255),
Constraint pk_branches Primary Key (BCode)
);

Create Table Titles(
Title Varchar(255),
Author Varchar(255),
Publisher Varchar(255),
Constraint pk_titles Primary Key (Title)
);

Create Table Holdings(
Branch Varchar(3),
Title Varchar(255),
Number_of_copies int,
Constraint pk_holdings Primary Key (Branch, Title)
);

Alter Table Holdings Add Constraint fk_title Foreign Key (Title) References Titles(Title);
Alter Table Holdings Add Constraint fk_branch Foreign Key (Branch) References Branches(BCode);

Insert Into branches Values
('B1', 'John Smith', '2 Anglesea Rd'),
('B2', 'Mary Jones', '34 Pearse St'),
('B3', 'Francis Owens', 'Grange X');

Insert Into Titles Values
('Susannah', 'Ann Brown', 'Macmilian'),
('How to fish', 'Amy Fly', 'Stop Press'),
('History of Dublin', 'David Little', 'Wiley'),
('Computers', 'Blaise Pascal', 'Applewoods'),
('The Wife', 'Ann Brown', 'Macmilian');

Insert Into Holdings Values
('B1', 'Susannah', 3),
('B1', 'How to fish', 2),
('B1', 'History of Dublin', 1),
('B2', 'How to fish', 4),
('B2', 'Computers', 2),
('B2', 'The Wife', 3),
('B3', 'History of Dublin', 1),
('B3', 'Computers', 4),
('B3', 'Susannah', 3),
('B3', 'The Wife', 1);