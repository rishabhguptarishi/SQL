use vtapp;

Create Table Categories(
  id integer Not Null auto_increment,
  name varchar(255) Not Null,
  Constraint pk_categories Primary Key (id)
);

Create Table UserTypes(
  id integer Not Null auto_increment,
  type varchar(255) Not Null,
  Constraint pk_userTypes Primary Key (id)
);

Create Table Users(
  id integer Not Null auto_increment,
  name varchar(255) Not Null,
  typeId integer Not Null,
  Constraint pk_users Primary Key (id)
);

Create Table Articles(
  id integer Not Null auto_increment,
  title varchar(255) Not Null,
  content varchar(255) Not Null,
  authorId integer Not Null,
  categoryId integer Not Null,
  Constraint pk_articles Primary Key (id)
);

Create Table Comments(
  id integer Not Null auto_increment,
  comment varchar(255) ,
  writerId integer,
  articleId integer ,
  Constraint pk_comments Primary Key (id)
);

Alter Table Users Add constraint fk_typeId Foreign Key (typeId) References UserTypes(id);

Alter Table Articles Add constraint fk_authorId Foreign Key (authorId) References Users(id);

Alter Table Articles Add constraint fk_categoryId Foreign Key (categoryId) References Categories(id);

Alter Table Comments Add constraint fk_writerId Foreign Key (writerId) References Users(id);

Alter Table Comments Add constraint fk_articleId Foreign Key (articleId) References Articles(id);

Insert Into Categories (name)
Values('category1'),
('category2'),
('category3'),
('category4');

Insert Into UserTypes (type)
Values('type1'),
('type2'),
('type3'),
('type4');

Insert Into Users(name,typeId)
values('user1',1),
('user2',2),
('user3',2),
('user4',2),
('user5',1),
('user6',3);

Insert Into Articles(title, content, authorId, categoryId)
Values ('title1', 'content1', 2, 2),
('title2', 'content2', 2, 2),
('title3', 'content3', 4, 3),
('title4', 'content4', 3, 1),
('title5', 'content5', 4, 1),
('title6', 'content6', 3, 4);

Insert Into Comments(comment, writerId, articleId)
Values ('title1', 2, 2),
('title2', 3, 2),
('title3', 2, 3),
('comment4', 2, 4),
('comment8', 2, 6),
('comment3', 2, 4),
('comment3', 2, 4);

Insert Into Comments(writerId, articleId)
Values (2,6);

Delete From Users Where name = 'user6';
/*Query OK, 1 row affected (0.41 sec)*/

Delete From UserTypes Where type in ('type3','type4');
/*Query OK, 2 rows affected (0.13 sec)*/

Delete From Comments Where comment = 'comment3';
/*Query OK, 1 row affected (0.22 sec)*/

Update Comments Set articleId = (Select id From Articles Where title = 'title3') Where articleId = (Select id From Articles Where title = 'title6');
/*Query OK, 2 row affected (0.313 sec)*/

Delete From Articles Where categoryId = (Select id From Categories where name = 'category4');
/*Query OK, 1 row affected (0.07 sec)*/

Delete From Categories Where name = 'category4';