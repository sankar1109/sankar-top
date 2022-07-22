create database E
create table employee
(
employee_id int not null,
frist_name varchar(30) ,
last_name varchar(30),
salary int ,
joining_date  datetime ,
department varchar(50),
);
 sp_help employee
select * from employee
insert into employee values (1,'jhon','abraham',1000000,'2013-jan-01 12:00:00','banking')
insert into employee values (2,'michale','clarke',800000,'2013-jan-01 12:00:00 ', 'insurance')
insert into employee values (3,'roy',  'thomas',700000,'2013-feb-01 12:00:00 ','banking')
insert into employee values (4,'tom','jose',600000,'2013-feb-01 12:00:00','insurance')
insert into employee values (5,'jerry','pinto',650000,'2013-feb-01 12:00:00','insurance')
insert into employee values (6,'phillip','mathew',750000,'2013-jan-01 12:00:00  ', 'service')
insert into employee values (7,'testname1','123',650000,'2013-jan-01 12:00:00 ', 'service')
insert into employee values (8,'testname2','Lname%',600000,'2013-feb-01 12:00:00 ', 'insurance')
-----------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------
-----[I1] Get First_Name from employee table using alias name “Employee Name”.-----------------------------------------------
select frist_name as 'Employee name' from employee
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--[I2]Get FIRST_NAME, Joining year, Joining Month and Joining Date from employee table.------------------------------------
SELECT frist_name,joining_date from employee
----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---[I3]Get all employee details from the employee table order by First_Name Ascending and Salary descending.
select frist_name ,salary from employee order by frist_name ASC, salary DESC
---------------------------------------------------------------------------------

--[I4]Get employee details from employee table whose first name contains ‘o’.
select * from employee where frist_name like '%o%'
---------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------
--[I5]Get employee details from employee table whose joining month is “January”.----

select * from employee where joining_date like '%jan%'

--[I6] Get department, total salary with respect to a department from employee table order by total salary descending.---

SELECT department ,sum(salary) TOTAL_SALARY from employee group by department ORDER BY TOTAL_SALARY DESC



----------------------------------------------------------------------------------------------------------------------------
0--[I7] Get department wise maximum salary from employee table order by salary ascending.------------------------------

select department , max(salary) maxsalary from employee group by department order by  maxsalary asc



--------------------------------------------------------------------------------------------------------------------------
-------------------------incentive tabel --------------------------------------------------------------------------------
create table incentive
(
employee_ref_id int ,
incentive_date date ,
incentive_amount int ,
);
select * from incentive
insert into incentive values(1,'01-02-2013',5000)
insert into incentive values(2,'01-02-2013',3000)
insert into incentive values(3,'01-02-2013',4000)
insert into incentive values(1,'01-01-2013',4500)
insert into incentive values(2,'01-01-2013',3500)



---[I8] Select first_name, incentive amount from employee and incentives table for those employees 
--who have incentives and incentive amount greater than 3000



SElect frist_name ,incentive_amount from employee A
inner join incentive B on A.employee_id = B.employee_ref_id and  incentive_amount >3000 

------------------------------------------------------------------------------------------
--[I9]Select 2nd Highest salary from employee table.

------------------------------------------------------------------------------------
---------------------------------------
--[10]Select first_name,incentive amount from employee and incentives table for all employees who got incentives using left join.

select frist_name ,incentive_amount from employee A left join incentive B ON A.employee_id=B.employee_ref_id 



--[I11]Create View OF Employee table in which store first name ,last name and salary only.

CREATE  VIEW S AS SELECT frist_name,last_name,salary from employee WHERE salary>600000

------[I12] -Create Procedure to find out department wise highest salary.

select department , max(salary) maxsalary from employee group by department order by  maxsalary asc
--------------------------------------------------------------------------------------------------------------------------
