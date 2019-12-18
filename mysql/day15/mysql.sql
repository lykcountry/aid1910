-- 视图
create view c2 as select c.name,c.sex,i.hobby from cls as c,interest as i where c.name=i.name;

-- 查看数据库中的视图表
show full tables in stu where table_type like 'VIEW';

create or replace view c1 as select name,age,score from cls;

-- 函数
create function st1() returns int
    -> begin
    -> update cls set score=60 where name='Emma';
    -> set @a=(select score from cls where name='Emma');
    -> return @a;
    -> end$$

-- 存储过程
 create procedure test(in age int)
    -> begin
    -> declare val int;
    -> set val=1;
    -> set val=val+age;
    -> select val;
    -> end$$

create procedure test2(in uid int)
begin
declare val int;
select age from cls where id=uid into val;
select val;
end$$

-- 查看数据库中的存储过程
select name from mysql.proc where db='stu' and type='procedure';
