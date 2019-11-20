use learnings;
Select location
From sandwiches
Where Filling IN (
  Select Filling
  From tastes
  Where Name = 'Jones'
);
/*
+-----------+
| location  |
+-----------+
| Buttery   |
| O'Neill's |
+-----------+
2 rows in set (0.00 sec) */

Select sandwiches.location
From sandwiches
Inner Join tastes On sandwiches.Filling = tastes.Filling
Where tastes.name = 'Jones';
/*
+-----------+
| location  |
+-----------+
| Buttery   |
| O'Neill's |
+-----------+
2 rows in set (0.00 sec)  */

Select sandwiches.location, count(distinct tastes.Name) noOfPeople
From sandwiches
Inner Join tastes On sandwiches.Filling = tastes.Filling
Group By sandwiches.location;
/*
+-----------+------------+
| location  | noOfPeople |
+-----------+------------+
| Buttery   |          3 |
| Lincon    |          2 |
| O'Neill's |          3 |
| Old Nag   |          2 |
+-----------+------------+
4 rows in set (0.00 sec) */