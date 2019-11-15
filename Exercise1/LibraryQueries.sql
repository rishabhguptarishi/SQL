Select Title
From Titles
Where Publisher Like 'Macmilian';

Select Distinct branches.*
From branches
inner join holdings on branches.BCode = holdings.Branch
inner join titles on holdings.Title = titles.Title
Where titles.Author Like 'Ann Brown';

Select *
From branches
where BCode in(
Select Branch
From holdings
Where Title in(
Select Title
From Titles
Where Author Like 'Ann Brown'
)
);

Select Branch, sum(Number_of_copies)
From Holdings
Group By Branch