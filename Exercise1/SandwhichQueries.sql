Select * 
From locatiOns
Where LName in(
Select locatiOn
From sandwiches
Where Filling in(
Select Filling
From tastes
Where Name = 'Jones'
)
);

Select l.*
From locatiOns l
Inner Join sandwiches s On l.LName = s.LocatiOn
Inner Join tastes t On s.Filling = t.Filling
Where t.name = 'Jones';

Select l.*, count(distinct t.Name)
From locatiOns l
Inner Join sandwiches s On l.LName = s.LocatiOn
Inner Join tastes t On s.Filling = t.Filling
Group By l.LName