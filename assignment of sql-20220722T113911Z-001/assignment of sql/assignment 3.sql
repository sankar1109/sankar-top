------------------
create database Practices
use Practices
create table tblproducts
(
tID INT PRIMARY KEY IDENTITY,
ProductName        VARCHAR(20),
RecommendedPrice    MONEY,
Category            VARCHAR(20)
);
select *from tblproducts
----------------tblCustomers-----------------------------------
CREATE TABLE tblCustomers
(
CustomerID  INT PRIMARY KEY IDENTITY,
FirstName            VARCHAR(50),
LastName            VARCHAR(50),
 City                VARCHAR(50),
 State                CHAR(2),
  Zip                VARCHAR(30)
 );
 select * from tblCustomers
 ---------------tblSales----------------------------
 CREATE TABLE tblSales
 (
SalesID  INT PRIMARY KEY IDENTITY,
ProductID INT REFERENCES tblProducts(tID),
CustomerID INT REFERENCES tblCustomers(CustomerID),
SalesPrice   MONEY,
SalesDate   SMALLDATETIME
);
select *from tblproducts

-------------------insert into tblproducts-----------------------
insert into tblproducts values('DVD',105.00 ,'LivingRoom' )
insert into tblproducts values('MICROWAVE',98.00 ,'Kitchen')
insert into tblproducts values('MONITOR',200.00 ,'Office' )
insert into tblproducts values('Speakers',85.00 ,'Office' )
insert into tblproducts values('Refrigerator',900.00 ,'Kitchen') 
insert into tblproducts values('VCR',165.00 ,'LivingRoom' )
insert into tblproducts values('CoffeePot',35.00 ,'Kitchen' )   


-----------------------------------------------------------------------------------------------
------------------------------insert into tblCustomers--------------------------------------------------
select * from tblCustomers

insert into tblCustomers values('Chintan', 'Patel','Anand','GJ' ,'388001')
insert into tblCustomers values('Paresh', 'Prajapati','Nadiad','GJ','387001' )
insert into tblCustomers values('Pragnesh', 'Patel','Surat','GJ','395008' )
insert into tblCustomers values('Nilesh', 'Dharsandia','Mumbai','MH','400002' )
insert into tblCustomers values('Sonal', 'Patel','Mumbai','MH','400002')
insert into tblCustomers values('Harshal', 'Patel','Mogri','GJ','388345')
insert into tblCustomers values('Prakash', 'Rathod','Mogri','GJ','388345')
insert into tblCustomers values('Aarzoo', 'Dodhiya','Rajkot','GJ','360003')
insert into tblCustomers values('Heta', 'Dave','Varanasi','UP','221002')
insert into tblCustomers values('Nikita', 'Dave','Varanasi','UP','221002' )
insert into tblCustomers values('Vaibhav', 'Dave','Varanasi','UP','221002' )
insert into tblCustomers values('Paresh', 'Patel','Pune','MH' ,'411001')
insert into tblCustomers values('Prakash', 'Patel','Pune','MH','411001' )
insert into tblCustomers values('Sandhya', 'Patel','Hyedrabad','AP','500031' )
insert into tblCustomers values('Divesh', 'Patel','Hyedrabad','KA','560002' )
insert into tblCustomers values('Payal', 'Shah','Banglore','KA','560002' )
insert into tblCustomers values('Priyanka', 'Rana','Banglore','GJ','388121' )
insert into tblCustomers values('Sanket', 'Dhebar','Anand','GJ','388121' )
 insert into tblCustomers values('Puja', 'Shah','Varanasi','UP','221002' )
insert into tblCustomers values('Priya', 'Shah','Varanasi','UP','221002' )

--------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
-----------------insert into tblSales-------------------------------------------------------------------



insert into tblSales values (1,1,130.00,'2005-06-14')
insert into tblSales values(2,2,97.00,'2005-06-19')
insert into tblSales values(3,3,200.00,'2005-09-20')

insert into tblSales values(4,4,80.00,'2005-03-22')
insert into tblSales values(5,5,899.00,'2005-01-23')

insert into tblSales values(6,6,150.00,'2005-03-24')
insert into tblSales values(3,7,209.00,'2005-03-10')


insert into tblSales values(4,8,90.00, '2005-08-11')
insert into tblSales values(6,9,130.00, '2005-08-12')

insert into tblSales values(2,14,85.00, '2005-12-13')
insert into tblSales values(3,15,240.00, '2005-05-14')
insert into tblSales values(6,19,150.00, '2005-07-22')

insert into tblSales values(3,15,240.00, '2005-05-14')
insert into tblSales values(5,5,900.00, '2005-03-06')
insert into tblSales values(4,6,86.00, '2005-04-07')

insert into tblSales values(2,7,88.00, '2005-11-08')
insert into tblSales values(3,8,198.00, '2005-05-09')
insert into tblSales values(1,9,150.00, '2005-10-10')
insert into tblSales values(6,14,99.00, '2005-09-09')
insert into tblSales values(6,15,104.00, '2005-09-20')
insert into tblSales values(4,14,90.00, '2005-07-22')
insert into tblSales values(1,1,130.00,'2005-03-06')
insert into tblSales values(2,2,102.00, '2005-04-07')
insert into tblSales values(1,3,114.00, '2005-11-08')
insert into tblSales values(5,4,1000.00, '2005-05-09')
insert into tblSales values(5,5,1100.00, '2005-10-10')
insert into tblSales values(3,6,285.00, '2005-06-11')
insert into tblSales values(2,7,87.00, '2005-10-12')
insert into tblSales values(3,8,300.00, '2005-07-13')
insert into tblSales values(3,20,205.00, '2005-12-31')

go
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

----[B1] Return the FirstName, LastName, ProductName, and SalePrice for all products sold in the month of October200 


SELECT  FirstName,
        LastName,
        ProductName,
        SalesPrice
FROM tblCustomers INNER JOIN tblProducts ON tblProducts.tID=tblCustomers.CustomerID INNER JOIN tblSales  ON tID=ProductID
WHERE SalesDate BETWEEN '2005-10-01' AND '2005-10-31'

---[B2] Return the CustomerID, FirstName, and LastName of those individuals in the Customer table who have made no Sales purchases.

SELECT CustomerID,FirstName,LastName 
FROM tblCustomers
WHERE CustomerID not in (select distinct CustomerID from tblSales)

//--[B3].Return the FirstName, LastName, SalePrice, Recommended SalePrice,
 and the difference between the SalePrice and Recommended SalePrice for all Sales.
  The difference must be returned as a positive number.//

  SELECT FirstName,LastName,SalesPrice,abs(SalesPrice-RecommendedPrice) as diff
FROM tblCustomers
INNER JOIN tblProducts ON tblProducts.tID= tblCustomers.CustomerID
INNER JOIN tblSales  ON tID=ProductID

--//I1.Add the following Customer and Sale information to the database. (using store procedure)
FirstName : Priyanka
LastName : Chopra
City:Mumbai
State:MH
Zip:400001
ProductID:3
SalePrice:205
SaleDate:12/31/2005

---
CREATE PROCEDURE spInsertInToSalesDetails()

DECLARE @firstName varchar(50);
 @lastName  varchar(50)
 @productName  varchar(50);
 @cat varchar(50);
 @sPrice float;
 @custID int;
 @pid int;

as begin
SET @custID = (SELECT CustomerID FROM tblCustomers WHERE FirstName = @firstName AND LastName = @lastName)
SET @pid = (SELECT tID FROM tblProducts WHERE ProductName = @productName
INSERT INTO tblSales(ProductID,CustomerID,SalesPrice,SalesDate) VALUES(@pid,@custID,@sPrice,'')
END
