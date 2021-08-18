Create table ExamResult(name varchar(50),Subject varchar(20),Marks int)

insert into ExamResult values('Adam','Maths',70)
insert into ExamResult values ('Adam','Science',80)
insert into ExamResult values ('Adam','Social',60)

insert into ExamResult values('Rak','Maths',60)
insert into ExamResult values ('Rak','Science',50)
insert into ExamResult values ('Rak','Social',70)

insert into ExamResult values('Sam','Maths',90)
insert into ExamResult values ('Sam','Science',90)
insert into ExamResult values ('Sam','Social',80)

--rank
select Name,Subject,Marks,
RANK() over(partition by subject order by Marks asc)Rank
From ExamResult
order by name,subject

--function
CREATE FUNCTION east_or_west (
@long DECIMAL(9,6)
)
RETURNS CHAR(4) AS
BEGIN
DECLARE @return_value CHAR(4);
SET @return_value = 'same';
IF (@long > 0.00) SET @return_value = 'east';
IF (@long < 0.00) SET @return_value = 'west';
RETURN @return_value
END;
DROP FUNCTION east_or_west;


SELECT dbo.east_or_west(0) AS argument, dbo.east_or_west(-1) AS argument_minus, dbo.east_or_west(5) AS argument_plus;
--sequence

CREATE SEQUENCE MySequenc
START WITH 1
INCREMENT BY 10

DECLARE @Person TABLE
(
ID int NOT NULL PRIMARY KEY,
FullName varchar(100) NOT NULL,
adress varchar(50) not null
);

INSERT @Person (ID, FullName,adress)
VALUES (NEXT VALUE FOR MySequenc, 'Jim Johnson','mumbi'),
(NEXT VALUE FOR MySequenc, 'Bob Thompson','kerala'),
(NEXT VALUE FOR MySequenc, 'Tim Perdue','tamilnadu')

SELECT * FROM @Person;

drop sequence MySequenc;

--Common Table Expressions (CTE)

Declare @RowNo int =2;
with ROWCTE as  
   (  
      SELECT @RowNo as ROWNO    
		UNION ALL  
      SELECT  ROWNO+2
  FROM  ROWCTE  
  WHERE RowNo < 20
    )  
 
SELECT * FROM ROWCTE 
 
--Common Table Expression  

WITH
  cteReports (EmpId, Ename, Job, MgrId, ERank)
  AS
  (
    SELECT EMPNO, ENAME,JOB, MGR, 1
    FROM EMP 
    WHERE MGR IS NULL
    UNION ALL
    SELECT e.EMPNO, e.ENAME, e.JOB, e.MGR, 
      r.ERank+1
    FROM EMP e
      INNER JOIN cteReports r
        ON e.MGR = r.Empid
  )
SELECT
 Ename Employee , Job Designation , 
  ERank "Employee Rank",
  (SELECT Ename FROM EMP
    WHERE EMPNO = cteReports.MgrId) AS Manager
FROM cteReports 
ORDER BY ERank


create table product (pro_id int primary key, pro_name char(10), pro_manu_date date, pro_cost int, pro_weight int, pro_discount int)

 

INSERT INTO PRODUCT VALUES(01,'PARLE-G','2021-02-01',3,0.2,20)
INSERT INTO PRODUCT VALUES(02,'BRITANIA','2020-08-01',10,1.2,5)
INSERT INTO PRODUCT VALUES(03,'MILK BIKIS','2021-03-01',10,0.8,10)

select * from product


Create table Country_Sales(SalesID INT Primary Key,Country varchar(50) Not NULL, City varchar(55) Not Null,Cost decimal Not Null ,Currency varchar(25) NOT NULL)
select * from Country_Sales


Create table Customer_Sales( cid INT PRIMARY KEY,SalesID INT REFERENCES Country_Sales(SalesID),StoreName varchar(50),paymentmode varchar(25),
creditcard_number varchar(30),Currency varchar(20) NOT NULL,Customer_Name varchar(50) NOT Null,VendorName varchar NOT NULL,INRValues decimal)

select * from Country_Sales

insert into Country_Sales(100,'India','Banglore',3,'INR')


     insert into Country_Sales values (101,'US','Washington',10,'USD')


Create table sales(
sales_ID INT primary key,
tracking_no INT,
sales_person varchar(50),
total_unit_sold INT,
)

select * from sales

INSERT INTO sales values (123 , 555,'max',50)
INSERT INTO sales values (456 , 375,'rex',70)
INSERT INTO sales values (156 , 888,'joy',10)


create table customerfeedback(customername char(25),message varchar(MAX),contactnumber varchar(20),email varchar(150),cid int foreign key references customer_sales
(cid),pro_id int foreign key references product(pro_id) )

select * from customerfeedback

insert into  customerfeedback values('ROSS','Product is good',985523152,'ross@gmail.com', ,01)
insert into customerfeedback values('JEN','taste sucks',752314932,'JEN@yahoo.co.in', ,02)
insert into customerfeedback values('bing','taste is good',2547893552,'bing@gmail.com', ,03)


