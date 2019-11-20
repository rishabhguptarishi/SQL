Select Title
From Titles
Where Publisher = 'Macmilian';
/*+----------+
| Title    |
+----------+
| Susannah |
| The Wife |
+----------+
2 rows in set (0.00 sec)*/

Select Distinct holdings.Branch
From holdings
Inner Join titles on holdings.Title = titles.Title
Where titles.Author = 'Ann Brown';
/*+--------+
| Branch |
+--------+
| B1     |
| B3     |
| B2     |
+--------+
3 rows in set (0.00 sec)*/

Select Distinct Branch
From holdings
Where Title IN (
  Select Title
  From Titles
  Where Author = 'Ann Brown'
);
/*+--------+
| Branch |
+--------+
| B1     |
| B3     |
| B2     |
+--------+
3 rows in set (0.00 sec)*/

Select Branch, sum(Number_of_copies)
From Holdings
Group By Branch;
/*+--------+-----------------------+
| Branch | sum(Number_of_copies) |
+--------+-----------------------+
| B1     |                     6 |
| B2     |                     9 |
| B3     |                     9 |
+--------+-----------------------+
3 rows in set (0.12 sec)*/