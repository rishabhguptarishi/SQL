Use Bank;

Select e.*, Sum(c.commission_amount) commission
From Employees e
Inner Join Commissions c on e.id = c.employee_id
Group By c.employee_id
Having commission = (
  Select Sum(commission_amount) highest_commission
  From commissions
  Group By employee_id
  Order By highest_commission Desc
  Limit 1
);
/*+----+-------------+---------+---------------+--------------------+
| id | name        | salary  | department_id | Highest Commission |
+----+-------------+---------+---------------+--------------------+
|  1 | Chris Gayle | 1000000 |             1 |               9000 |
+----+-------------+---------+---------------+--------------------+
1 row in set (0.00 sec)*/

Select *
From Employees
Where Salary = (
  Select salary
  From Employees
  Order By salary DESC
  Limit 3,1
);
/*+----+--------------+--------+---------------+
| id | name         | salary | department_id |
+----+--------------+--------+---------------+
|  3 | Rahul Dravid | 700000 |             1 |
+----+--------------+--------+---------------+
1 row in set (0.00 sec)*/

Select d.name department, Sum(c.commission_amount) commission
From Departments d
Inner Join Employees e on e.department_id = d.id
Inner Join Commissions c on e.id = c.employee_id
Group By e.department_id
Having commission = (
  Select Sum(c.commission_amount) commission
  From Employees e
  Inner Join Commissions c on e.id = c.employee_id
  Group By e.department_id
  Order By commission Desc
  Limit 1
);

/*+------------+--------------------+
| department | Highest Commission |
+------------+--------------------+
| Banking    |              13000 |
+------------+--------------------+
1 row in set (0.00 sec)*/

Select Group_Concat(Distinct e.name) EmployeeName, Sum(c.commission_amount) commission
From Employees e
Inner Join Commissions c on e.id = c.employee_id
Group By c.employee_id
Having Sum(c.commission_amount) > 3000;
/*+----------------+------------+
| EmployeeName   | commission |
+----------------+------------+
| Chris Gayle    |       9000 |
| Michael Clarke |       6000 |
| Rahul Dravid   |       4000 |
| Wasim Akram    |       5000 |
+----------------+------------+
4 rows in set (0.00 sec)*/