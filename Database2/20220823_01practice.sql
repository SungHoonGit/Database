create table score(
     name  char(15)    not null
    ,lng    number(10)      not null
    ,mat    number(10)      not null
    ,eng    number(10)      not null 
);

alter table score add tot number add aver number;

update score set tot=lng+eng+mat, aver=(lng+eng+mat)/3;
drop table score;
delete from score;
select * from score;


insert into score(name, lng, mat, eng)
values ('ȫ�浿', 100, 90, 80);

insert into score(name, lng, mat, eng)
values ('���޷�', 85, 75, 60);