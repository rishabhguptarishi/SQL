Select @id := id
From Users
Where name = 'user3';

Select @articleId := id, title, content
From Articles
Where authorId = @id;

Select articles.*
From articles
Inner Join users on users.id = articles.authorId
where users.name = 'user3';
/*+----+--------+----------+----------+------------+
| id | title  | content  | authorId | categoryId |
+----+--------+----------+----------+------------+
|  4 | title4 | content4 |        3 |          1 |
+----+--------+----------+----------+------------+
1 row in set (0.00 sec)*/

Select comment
From Comments
where articleId In(
  Select id
  From Articles
  Where authorId = @id
);

Select Comments.comment
From Comments
Inner Join Articles On articles.id = comments.articleId
Inner Join Users on articles.authorId = users.id
Where users.name = 'user3';
/*+----------+
| comment  |
+----------+
| comment4 |
| NULL     |
+----------+
2 rows in set (0.00 sec)*/

Select articles.*
From articles
Inner Join Comments On articles.id = Comments.articleId
where Comments.comment Is Null;

Select *
From articles
Where id In(
  Select articleId
  From Comments
  Where comment Is Null
);

/*+----+--------+----------+----------+------------+
| id | title  | content  | authorId | categoryId |
+----+--------+----------+----------+------------+
|  4 | title4 | content4 |        3 |          1 |
|  3 | title3 | content3 |        4 |          3 |
+----+--------+----------+----------+------------+
2 rows in set (0.00 sec)*/

Select *
From articles
Where id in (
  Select articleId
  From comments
  Group By articleId
  Having Count(articleId) = (
    Select Count(articleId)
    From comments
    Group By articleId
    Order By Count(articleId) Desc
    Limit 1
  )  
);
/*+----+--------+----------+----------+------------+
| id | title  | content  | authorId | categoryId |
+----+--------+----------+----------+------------+
|  3 | title3 | content3 |        4 |          3 |
+----+--------+----------+----------+------------+*/

Select Distinct articles.*
From articles
Left Join comments on comments.articleId = articles.id
Group By comments.writerId, comments.articleId
Having Count(*) < 2
/*+----+--------+----------+----------+------------+
| id | title  | content  | authorId | categoryId |
+----+--------+----------+----------+------------+
|  2 | title2 | content2 |        2 |          2 |
+----+--------+----------+----------+------------+
1 row in set (0.00 sec)*/
