--EMP DEPARTMENT
create table deptt(
  deptno int primary key,
  dname  varchar(50),
  loc    varchar(50))

insert into deptt
values(10, 'ACCOUNTING', 'NEW YORK');
insert into deptt
values(20, 'RESEARCH', 'DALLAS');
insert into deptt
values(30, 'SALES', 'CHICAGO');
insert into deptt
values(40, 'OPERATIONS', 'BOSTON');

select * from deptt

----------EMPLOYEE DATA

CREATE TABLE Emp_details(
    Ename VARCHAR(50) NOT NULL,
    EID  INT PRIMARY KEY,
    EMP_ADD VARCHAR(50) NOT NULL,
    E_HIREDATE DATE ,
    E_SALARY INT,
	deptno int REFERENCES DEPTT(DEPTNO))


INSERT INTO Emp_details values ('Anand Raj', 1000, 'chennai', '2021-07-10', 1500,10)
INSERT INTO Emp_details values ('Apurav Kumar', 1001, 'banglore', '2021-07-11', 1550,20)
INSERT INTO Emp_details values ('Jay Barot', 1002, 'Mumbai', '2021-07-12', 2000,30)
INSERT INTO Emp_details values ('likith', 1003, 'DALLAS', '2020-07-10', 1500,10)
INSERT INTO Emp_details values ('emmanuel ', 1004, 'CHICAGO', '2020-07-11', 1550,20)
INSERT INTO Emp_details values ('niveda', 1005, 'BOSTON', '2020-07-12', 2000,30)
INSERT INTO Emp_details values ('harika', 1006, 'BSTON', '2020-07-12', 2000,40)

select * from Emp_details

--PRODUCT

create table product (pro_id int primary key, pro_name char(10), 
pro_manu_date date, pro_cost int, pro_weight FLOAT, pro_discount FLOAT, price_after_discount float)

INSERT INTO PRODUCT values (01,'PARLE-G','2021-02-01',10,0.2,5,null)
INSERT INTO PRODUCT values(02,'BRITANIA','2020-08-01',10,1.2,5,null)
INSERT INTO PRODUCT values(03,'MILK BIKIS','2021-03-01',10,0.8,10,null)
------------------------------

Create table Customer_Sales1( cid INT PRIMARY KEY,SalesID INT REFERENCES Country_Sales(SalesID),
StoreName varchar(50),paymentmode varchar(25),creditcard_number varchar(30),
Currency varchar(20) NOT NULL,Customer_Name varchar(50) NOT Null,VendorName varchar(40) NOT NULL,
INRValues decimal)

insert into Customer_Sales1 values(12,100,'Malvika stores','cash',123433356,'INR','Alia','Manvika',34)
insert into Customer_Sales1 values(13,101,'annika stores','credit card',344533356,'INR','swathi','anni',4)
insert into Customer_Sales1 values(14,102,'ramu stores','cash',898833356,'INR','swagna','anni',3)

SELECT * FROM Customer_Sales1
---------------------------------
Create table Country_Sales(SalesID INT Primary Key,Country varchar(50) Not NULL, 
City varchar(55) Not Null,Cost decimal Not Null ,Currency varchar(25) NOT NULL)


insert into Country_Sales values(100,'India','Banglore',3,'INR')

 insert into Country_Sales values (101,'US','Washington',10,'USD')

 insert into Country_Sales values(102,'India','Chennai',10,'USD')

 select * from Country_Sales

-----------------------------
 create table customerfeedback(customername char(25),message varchar(MAX),contactnumber varchar(20),
 email varchar(150),cid int foreign key references customer_sales1(cid),
 pro_id int foreign key references product(pro_id) )

 

insert into  customerfeedback values('ROSS','Product is good',985523152,'ross@gmail.com',12 ,01)
insert into customerfeedback values('JEN','taste sucks',752314932,'JEN@yahoo.co.in',13 ,02)
insert into customerfeedback values('bing','taste is good',2547893552,'bing@gmail.com',14 ,03)


select * from customerfeedback
------------------------
select * from dept
select * from Emp_details
select * from Country_Sales
select * from customer_Sales1
select * from customerfeedback
select * from product

--EMP WHO IS NOT WORKING IN ANY DEPARTMENT

SELECT Ename,EID,EMP_ADD FROM Emp_details  E
left OUTER JOIN DEPT D
ON
E.deptno=D.DEPNO
WHERE E.deptno IS NULL

--------------

-- FUNCTION GETDEPT()
 
CREATE FUNCTION GETDEPT1()
RETURNS TABLE
AS 
RETURN(SELECT Eid, ENAME, deptno  FROM Emp_details WHERE DEPTNO=10)
SELECT * FROM GETDEPT1()

drop function GETDEPT1

--CREATE PROCEDURE OUTJOIN

CREATE PROCEDURE OUTJOIN1
AS
SELECT E.Eid,E.ENAME ,D.deptno FROM deptt D FULL OUTER JOIN Emp_details E ON E.DEPTNO=D.deptno
GO

EXEC OUTJOIN1;

drop procedure OUTJOIN1;

-- trigger for upadteing colum new cost after discount

CREATE TRIGGER  total_cost
ON 
  product
  for INSERT 
  AS BEGIN
UPDATE product SET product.price_after_discount= ((product.pro_discount/product.pro_cost)*100)
END

insert into product values (5,'PARLE-G','2021-02-01',100,0.3,10,null)
select * from product;



drop trigger total_cost;

