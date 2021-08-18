CREATE TABLE COUNTRY (CT_CODE INT PRIMARY KEY, CT_NAME CHAR(10), CT_ZONE INT, CT_CURRENCY CHAR(10),CT_STORE CHAR(10),CT_COST INT,CT_VENDOR CHAR(10))
select * from COUNTRY
CREATE TABLE Emp_details(
    Ename VARCHAR(50) NOT NULL,
    EID  INT PRIMARY KEY,
    EMP_ADD VARCHAR(50) NOT NULL,
    E_HIREDATE DATE ,
    E_SALARY INT
)
select * from Emp_details
create table dept( deptno int primary key,
dname varchar(50),
loc varchar(50),

);          
select * from dept
insert into dept
values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept
values(20, 'RESEARCH', 'DALLAS');
insert into dept
values(30, 'SALES', 'CHICAGO');

INSERT INTO Emp_details values ('Anand Raj', 1000, 'chennai', '2021-07-10', 1500)
INSERT INTO Emp_details values ('Apurav Kumar', 1001, 'banglore', '2021-07-11', 1550)
INSERT INTO Emp_details values ('Jay Barot', 1002, 'Mumbai', '2021-07-12', 2000)

Create table Country_Sales(SalesID INT Primary Key,Country varchar(50) Not NULL, City varchar(50) Not Null,Cost decimal Not Null ,Currency varchar(25) NOT NULL)


create table customerfeedback(cid int primary key,customername char(25),message varchar(MAX),contactnumber varchar(20),email varchar(150) )

select ename,emp_add,e_hiredate from emp_details where e_hiredate in (select e_hiredate from emp_details where ename like '%a%')



