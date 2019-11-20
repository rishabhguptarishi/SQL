Select locatiOn
From sandwiches
Where Filling in(
  Select Filling
  From tastes
  Where Name = 'Jones'
);

Select sandwiches.location
From sandwiches
Inner Join tastes On sandwiches.Filling = tastes.Filling
Where tastes.name = 'Jones';

Select sandwiches.location, count(distinct tastes.Name)
From sandwiches
Inner Join tastes On sandwiches.Filling = tastes.Filling
Group By sandwiches.location