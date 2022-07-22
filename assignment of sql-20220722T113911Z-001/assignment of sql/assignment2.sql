---table salesperson---
create database assignment2
use assignment2
create table salesperson
(
pk_sno int not null,
sname varchar(50) not null,
city varchar(50) not null,
comm float
);
insert into salesperson values (1001,'peel','london',.12)
insert into salesperson values (1002,'Serres','san jose',.13)
insert into salesperson values (1004,'Motika','london',.11)
insert into salesperson values (1007,'Rafkin','barcelona',.15)
insert into salesperson values (1003,'Axelrod','New york',.1)
select * from salesperson


-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------tabel customber---------------
create table customber
(
pk_cnm int not null,
cname varchar(50) not null,
city varchar(50) not null,
rating int not null,
fk_sno int not null,
);
select * from customber
insert into customber values(201,'hoffman','london',100,1001)

insert into customber values(202,'Giovanne','roe',200,1003)
insert into customber values(203,'liu','san jose',300,1002)
insert into customber values(204,'grass','barcelona',100,1002)
insert into customber values(206,'clemens','london',300,1007)
insert into customber values(207,'pereira','roe',100,1004)
select * from customber
select * from salesperson
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
create table oreder
(pK_onm int not null,
amt float not null,
ode date not null,
fk_cnm int not null ,
fk_sno int not null ,
);
select * from oreder

insert into oreder values(3001,18.69,'1994-oct-03',2008,1007)
insert into oreder values(3003,767.19,'1994-oct-03',2001,1001)
insert into oreder values(3002,1900.10,'1994-oct-03',2007,1004)
insert into oreder values(3005,3005,'1994-oct-03',2003,1002)
insert into oreder values(3006,3006,'1994-oct-04',2008,1007)


insert into oreder values(3009,3009,'1994-oct-04',2002,1003)
insert into oreder values(3007,3007,'1994-oct-05',2004,1002)
insert into oreder values(3008,3008,'1994-oct-05',2006,1001)
insert into oreder values(3010,3010,'1994-oct-06',2004,1002)
insert into oreder values(3011,3011,'1994-oct-06',2006,1001)

--[A1] All orders for more than $1000.
select amt from oreder where amt >1000
-------------------------------------------------------------------------------------------------------
--[A2]Names and cities of all salespeople in London with commission above 0.10.
select * from salesperson
select sname,city from salesperson where city='london' and comm>.10


----[A8] All salespeople either in Barcelona or in London.--------
select sname from salesperson where city='Barcelona' or city='London'
------------------------------------------------------------------------------------------------
--[A9] All salespeople with commission between 0.10 and 0.12. (Boundary values shouldbe excluded).-----
select sname ,comm  from salesperson where comm>=0.10 and comm <=0.12

----[A10] All customers excluding those with rating <= 100 unless they are located in Rome.
select * from customber where   rating<=100 or city='rome'
--[All] orders except those with 0 or NULL value in amt field.

select * from oreder
Where amt is not null and amt <> 0

------[A12] Count the number of salespeople currently listing orders in the order table.

Select count(distinct fk_sno)
from oreder

--[A13] Largest order taken by each salesperson, datewise.

Select ode, fk_sno, max(amt)
from oreder
group by ode, fk_sno
ordeR by ode, fk_sno

--------------------------------------------------------------------------------------------------
--[A14]Largest order taken by each salesperson with order value more than $3000. (ie same city).
Select ode, fk_sno, max(amt)
from oreder 
where amt > 3000
group by ode, fk_sno
ordeR by ode, fk_sno


-------------------------------------------------------------------------------------------------------------------