drop table BigData_work.Data_Wiz;
drop table BigData_work.t1;
drop table BigData_work.t2;

create table BigData_work.Data_Wiz(col1 varchar(30), id int);
insert into BigData_work.Data_Wiz select 'kitten ',1;
insert into BigData_work.Data_Wiz select 'pop', 2;
insert into BigData_work.Data_Wiz select 'moo', 3;
insert into BigData_work.Data_Wiz select 'hat', 4;
insert into BigData_work.Data_Wiz select 'fish', 5;
insert into BigData_work.Data_Wiz select 'cow', 6;


create temporary table if not exists BigData_work.t1 as (select * from Data_Wiz where id%2=1);

create temporary table if not exists BigData_work.t2 as (select * from Data_Wiz where id%2=0);

select t1.*, t2.*
from t1
inner join t2 on t1.id = t2.id - 1;

select * from BigData_work.t2;