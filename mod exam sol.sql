create table DEPT
(DEPTNO int (2),
DNAME varchar(15),
LOC varchar(10)
);
desc DEPT;

insert into DEPT values
(10,'ACCOUNTING','NEWYORK'),
(20,'RESEARCH','DALLAS'),
(30,'SALES','CHICAGO'),
(40,'OPERATIONS','BOSTON');

select * from DEPT;

show tables;

create table emptable8
(EMPNO			int(4),
ENAME			varchar(10),
JOB				varchar(9),
HIREDATE			date,
SAL				float(7,2),
COMM			float(7,2),
DEPTNO			int(2)
);
desc emptable8;

insert into emptable8 values
(7839,'King','MANAGER','1991-11-17',	5000,NULL,10),
(7698,'Blake','CLERK','1981-05-01',2850,NULL,30),
(7782,'Clark','MANAGER','1981-06-09',2450,NULL,10),
(7566,'Jones','CLERK','1981-04-02',2975,NULL,20),
(7654,'Martin','SALESMAN','1981-09-28',1250,1400,30),
(7499,'Allen','SALESMAN','1981-02-20',1600,300,30 );


select * from emptable8;

-- Display all the employees where SAL between 2500 and 5000 (inclusive of both).
select ename from emptable8
where sal>2500 AND sal<5000;

-- Display all the ENAMEs in descending order of ENAME.
select  ename from emptable8 order by ename desc;

-- Display all the JOBs in lowercase.
select lower(Job) from emptable8;

-- Display the ENAMEs and the lengths of the ENAMEs.
select ENAME, length(ename) from emptable8;

-- Display the DEPTNO and the count of employees who belong to that DEPTNO .
select deptno,count(*) from emptable8 group by deptno;

-- Display the DNAMEs and the ENAMEs who belong to that DNAME.
select DNAME,ENAME from emptable8 join dept where (dept.deptno = emptable8.deptno);

-- Display the position at which the string ‘AR’ occurs in the ename.
select ename from emptable where ename like '%AR%';

-- Display the HRA for each employee given that HRA is 20% of SAL.
select ename,sal,sal*0.2 'HRA' from emptable8;

-- -------------------------------------------------------------------

-- 1
create table TEMPP
(fir int,
sec varchar(50)
);

delimiter //
create procedure PROC1(s1 varchar(10),s2 varchar(10))
begin
declare a int;
set a = (instr(s1,s2));
if a=0 then
insert into TEMPP values (a,'s1 not exists in s2');
else
insert into TEMPP values(a,'s1 exists in s2');
end if;
end;
delimiter //

call PROC1(s1 = 'DAC', s2 = 'CDAC');

select fir "position" , sec "remark" from TEMPP;

-- -----------------------------------------------------------------------
-- 2
delimiter //
create function FUNC1(x1 int, x2 int, x3 int)
returns boolean
deterministic
begin
if x1<(x2+x3) and x2<(x1+x3) and x3(x1+x2)
then
return true;
else 
return false;
end if;
end; //
delimiter //

create table TRIANGLE1
(
x1 int,
x2 int,
x3 int
);

delimiter //
create procedure tagl(p int, q int, r int)
begin
if FUNC1(p,q,r) then
    insert into TRIANGLE1 values(p,q,r 'its valid');
    else
    insert into TRIANGLE1 values (p,q,r 'its not valid');
    end if;
    end;
    delimiter //
    
    call tagl(5,10,15);
    select * from TRIANGLE1;










