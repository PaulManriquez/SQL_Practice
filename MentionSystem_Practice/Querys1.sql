select * from "Users";
select * from "posts";

select "posts"."Title","Users"."User_Name" from "posts"
inner join "Users" on "posts"."User_id" = "Users"."id"