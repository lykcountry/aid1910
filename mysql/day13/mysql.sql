-- alter操作
alter table interest
    add email char(28);
alter table interest
    add phone char(16) after price;
alter table interest
    drop email;
alter table interest
    modify level char(3);
alter table interest
    change remark comment text;
alter table class_1 rename cls;

-- datetime
select *
from marathon
where birthday > (curdate() - interval 20 year);

# 高级查询
select *
from cls
where name like "___";

select *
from cls
order by age, score desc;

update cls
set score = 93
where sex = 'm'
limit 1;

# 成绩最好的女生
select *
from cls
where sex = 'w'
order by score desc
limit 1;

# union
select name, age, score
from cls
where score >= 90
union all
select name, age, sex
from cls
where age > 18;

# --子查询
select name, hobby
from interest
where name = (select name from cls order by score limit 1);


# 聚合查询
select avg(attack), max(attack)
from sanguo
where country = '蜀';

select gender, count(*)
from sanguo
group by gender;

# 所有国家中，男英雄比较多的前两个国家，查看这两个
# 国家的国家名称和男英雄数量，展示时请按数量降序排序
# 展示
select country, count(*) as number
from sanguo
where gender = '男'
group by country
order by number desc
limit 2;

# 索引
create index name_index on cls (name);
create table index_test
(
    id   int auto_increment,
    name varchar(20),
    primary key (id),
    index (name)
);

# 删除索引
drop index name on index_test;


