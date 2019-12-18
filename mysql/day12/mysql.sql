--插入操作
-- class_1
insert into class_1 values (1,'Alex',18,'m',92.5);

insert into class_1 values (2,'Abby',17,'w',86),(3,'Tom',17,'m',77);

insert into class_1 (name,age,sex) values ('Emma',18,'w');

insert into class_1 (name,age,score) values ('Lily',18,94);

-- interest
insert into interest values (1,'Joy','sing,dance','B',56800.00,'骨骼惊奇,练舞奇才');

insert into interest values (3,'Abby','draw','C',9800.888,'神韵有佳,达芬奇二代');

-- 查找
select name,age from class_1 where age between 16 and 18;

select name,age from class_1 where age in (15,17,19);

select name,age from class_1 where sex is null;

select * from class_1 where (sex='m' and score>=85) or (sex='w' and score < 85);
等同于
select * from class_1 where sex='m' xor score < 85;

-- 修改
update class_1 set age=age+1;

-- 删除
delete from class_1 where sex is null;