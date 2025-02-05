select * from reactions

--Goal: get all the | post | where received at least one reaction  	
	--Distinct get the unique values related to post_id 
	--count is an agregate function that count the number of rows of the column 
select count(distinct post_id)
from reactions;
--Distinct groups just in one column and enable you to use the agregate function |count|

--Goal: get all the | post | where received at least one reaction
--Larger version
select count(p1.post_id) as post_with_atleast_oneReaction
from(
select post_id
from reactions 
group by post_id	
)as p1;

--GOAL: Show all number of reactions along with the username of the person who made them.
--Order by the number of reactions and username in ASC (minor to mayor)
--Notes:
--select users.username must be in the function of group by 
select users.username,count(*) as N_reactions
from users 
inner join reactions on reactions.user_id = users.id
group by reactions.user_id,users.username 
ORDER BY N_reactions ASC, users.username ASC;



--GOAL: Get the most reacted post (post with the highest number of reactions).
--Notes:
--You can use also LIMIT function 
select max(p1.n_reactions)
from (
select users.username,count(*) as N_reactions
from users 
inner join reactions on reactions.user_id = users.id
group by reactions.user_id,users.username 
ORDER BY N_reactions ASC, users.username ASC
) as p1


--GOAL: Show all posts that have received both "like" and "dislike" reactions.
-- 1st: group by post id and type
-- 2nd: we order by post_id 
-- 3rd: where clouse -> search for the goups that have at least one type in like or dislike
select post_id,type,count(*)
from reactions 
where type in ('like','dislike')
group by post_id,type
order by post_id

select * from reactions where post_id = 1	
	
-- 4th: adding a distinc clouse and with condition = 2 , we now have the posts that
--have both conditions (2 reactions in his case like and dislike reaction)
-- select post_id,type,count(*) as n_reactions
-- from reactions 
-- where type in ('like','dislike')
-- group by post_id,type
-- having count (*) = 2
-- order by post_id
select p1.post_id 
from (
	select post_id,type,count(*)
	from reactions 
	where type in ('like','dislike')
	group by post_id,type
	order by post_id	
)as p1
group by p1.post_id
having count (*) = 2
--Notes: 
--1st You cannot use a alias in having clouse (having count (*) = 2)
--2nd Order by is at the end









