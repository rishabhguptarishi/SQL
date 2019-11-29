use twitter;
Select u1.name, u2.name followings
From relationships r
Inner Join users u1 on u1.id = r.user_id
Inner Join users u2 on u2.id = r.following_id;

/*--------------------------------------------------------------------------------------------------------------------------------------------------*/
Select u1.name, group_concat(u2.name separator ', ') followings
From relationships r
Inner Join users u1 on u1.id = r.user_id
Inner Join users u2 on u2.id = r.following_id
Group By r.user_id
Order By Count(followings) DESC;
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/
Select u.name, t.content, t.created_at
from tweets t
inner join users u on u.id = t.user_id 
where t.user_id =1 or t.user_id in (
  Select following_id
  from relationships
  where user_id = 1  
)
Order By t.created_at ASC;
/*-----------------------------------------------------------------------------------------------------------------------------------------------*/
Select u.name, Count(t.content) total_tweets
From tweets t
Inner Join users u on t.user_id = u.id
Group By t.user_id;
/*---------------------------------------------------------------------------------------------------------------------------------------*/
Select name
from users
where id not in (
  select distinct user_id
  from tweets
);

Select u.name
From Users u
Left Join tweets t on u.id = t.user_id
Where t.user_id is null;
/*---------------------------------------------------------------------------------------------------------------------------------------------------*/
Select u.name, t.content
From tweets t
Inner Join users u  on u.id = t.user_id
Where t.created_at > Date_Add(now(), Interval -1 Hour);

Select t.name, t.content
From (
  Select u.name, t.content, t.created_at
  From tweets t
  Inner Join users u  on u.id = t.user_id
) as t
Where t.created_at > Date_Add(now(), Interval -1 Hour)