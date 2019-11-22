Use colormixtures;

Select If(c1.name = 'Red',c2.name,c1.name) 'combine with', c3.name 'resulting color'
From mixtures m
Inner Join Colors c1 on m.parent1_id = c1.id
Inner Join Colors c2 on m.parent2_id = c2.id
Inner Join Colors c3 on m.mix_Id = c3.id
Where c1.name = 'Red' Or c2.name = 'Red';
/*+--------------+-----------------+
| combine with | resulting color |
+--------------+-----------------+
| Green        | Yellow          |
| Blue         | Pink            |
| Yellow       | White           |
+--------------+-----------------+
3 rows in set (0.00 sec)*/
/*-------------------------2-----------------------------------------------------------------------------------*/
Select @redId := id
From Colors
Where name = 'Red';

Select c.name name
From mixtures m
Inner Join Colors c on m.mix_id = c.id
Where m.parent1_id <> @redId and m.parent2_id <> @redId;
/*+------+
| name |
+------+
| Cyan |
+------+
1 row in set (0.00 sec)*/

/*-------------------------3-----------------------------------------------------------------------------------*/

Select c1.name 'parent name', Group_Concat(Distinct c2.name Separator' & ') 'possible mixture'
From (
  Select parent1_id, mix_id
  From mixtures
  Union
  Select parent2_id, mix_id
  From mixtures
) m
Inner Join colors c1 on m.parent1_id = c1.id
Inner Join colors c2 on m.mix_id = c2.id
Group By parent1_id;
/*+-------------+-----------------------+
| parent name | possible mixture      |
+-------------+-----------------------+
| Red         | Pink & White & Yellow |
| Green       | Cyan & Yellow         |
| Blue        | Cyan & Pink           |
| Yellow      | White                 |
+-------------+-----------------------+
4 rows in set (0.00 sec)*/

/*-------------------------4-----------------------------------------------------------------------------------*/

Select Concat(m.parent1_id, ' & ', m.parent2_id) 'parent colors', m.mix_id, m.mix_density, c.density 'original density'
From mixtures m 
Inner Join colors c on c.id = m.mix_id
Where m.mix_density > c.density;
/*+---------------+--------+-------------+------------------+
| parent colors | mix_id | mix_density | original density |
+---------------+--------+-------------+------------------+
| 10 & 11       |     13 |        0.60 |             0.20 |
| 10 & 12       |     14 |        0.50 |             0.30 |
| 11 & 12       |     15 |        0.75 |             0.40 |
+---------------+--------+-------------+------------------+
3 rows in set (0.00 sec)*/

/*-------------------------5-----------------------------------------------------------------------------------*/
Select @redId := id
From Colors
Where name = 'Red';

Select Sum(if(parent1_id = @redId, parent1_perc, parent2_perc)/100) amount
From mixtures
Where parent1_id = @redId or parent2_id = @redId;
/*+--------+
| amount |
+--------+
| 1.6000 |
+--------+
1 row in set (0.00 sec)*/