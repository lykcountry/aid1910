级联动作
alter table person
    add constraint dept_fk foreign key (dept_id) references dept (id) on delete cascade on update cascade;

-- 用户信息		id	name	age	sex
-- 朋友圈		内容	地点	时间	图片
-- 点赞评论	    谁给哪个朋友圈信息点赞啦
-- 	        谁给哪个朋友圈评论啦，评论的是什么

create table user
(
    id   int primary key auto_increment,
    name varchar(20) not null,
    age  tinyint     not null,
    sex  enum('m',
    'w'
)
    );

create table pyq
(
    id      int primary key auto_increment,
    content text,
    address varchar(64),
    time    datetime,
    image   char(100),
    user_id int,
    constraint user_fk foreign key (user_id) references user (id)
);

create table dz_pl
(
    id      int primary key auto_increment,
    user_id int,
    pyq_id  int,
    dz      char,
    comment text,
    constraint user_fk1 foreign key (user_id) references user (id),
    constraint pyq_fk foreign key (pyq_id) references pyq (id)
);


-- 学生  课程  老师 表关系
create table student1
(
    id   int primary key auto_increment,
    name varchar(32),
    age  tinyint,
    sex  enum('m',
    'w'
) ,
    address text
);

create table teacher
(
    id    int primary key auto_increment,
    name  varchar(32),
    age   tinyint,
    title char(12)
);

create table course
(
    id         int primary key auto_increment,
    c_name     varchar(20),
    xf         float,
    teacher_id int,
    constraint teacher_fk foreign key (teacher_id) references teacher (id)
);

create table student_course
(
    id         int primary key auto_increment,
    student_id int,
    course_id  int,
    score      float,
    constraint student_fk foreign key (student_id) references student (id),
    constraint course_fk foreign key (course_id) references course (id)
);

-- 关联查询
-- 查看人名 分数  兴趣，
-- cls作为左表，interest右表
-- 匹配条件  人员姓名相匹配

select c.name as 姓名, c.score as 分数, i.hobby as 爱好
from cls as c
         left join interest as i on c.name = i.name
where c.score > 80;




