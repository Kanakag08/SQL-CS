

--create table for course master
create database school;
use school;

create table CourseMaster
(
columnID int primary key,
CourseName varchar(50),
Category char(1),--B= Basic, M=Medium, A=Advanced
fee Smallmoney
);

insert into CourseMaster(columnID,CourseName,Category,fee)
values 
(1,'Java','B',2000),
(2,'C','A',5000),
(3,'Python','M',3500),
(4,'C++','B',4000),
(5,'Ruby','A',6000),
(6,'Java','A',5000),
(7,'ML','B',5000),
(8,'.Net','M',4500),
(9,'Python','A',7000),
(10,'AWS','B',6000);


--create table for student master
Create table StudentMaster
(
SID int primary key,
StudentName varchar(40),
Origin char(1),  --L= Local F=FOreign
Type Char(1)    -- U=undergraduate G=graduate
);

insert into StudentMaster(SID,StudentName,Origin,Type)
values
(1,'Kanak','L','G'),
(2,'Pari','L','G'),
(3,'Isha','F','G'),
(4,'Harsh','L','U'),
(5,'Dhruv','F','U'),
(6,'Anushka','F','U'),
(7,'Guarav','L','G'),
(8,'Vaishnav','L','U'),
(9,'Anuj','F','G'),
(10,'Meenal','F','G');


--create table enrollment master
create table EnrollmentMaster
(
columnID int foreign key 
references CourseMaster(columnID),
SID int foreign key 
references StudentMaster(SID),
DOE dateTime,
FWF bit,  --fee wavier Flag 
grade char(1)
);

select * from EnrollmentMaster
delete from EnrollmentMaster
where SID=1;

insert into EnrollmentMaster(columnID,SID,DOE,FWF,grade)
values
(1,1,'2023-01-02 09:05',0,'A'),
(2,2,'2023-02-04 10:10',1,'B'),
(3,3,'2023-03-06 11:15',0,'C'),
(4,4,'2023-04-08 12:20',1,'A'),
(5,5,'2023-05-10 01:25',0,'B'),
(6,6,'2023-06-12 02:30',1,'A'),
(7,7,'2023-07-14 03:35',0,'F'),
(8,8,'2023-08-16 04:40',1,'A'),
(9,9,'2023-09-18 05:45',0,'C'),
(10,10,'2023-10-20 06:50',1,'A');


--questions 
--1
SELECT
    C.columnID,
    C.CourseName,
    COUNT(E.SID) AS TotalForeignStudents
FROM CourseMaster C
JOIN EnrollmentMaster E ON C.columnID = E.columnID
JOIN StudentMaster S ON E.SID = S.SID
WHERE S.Origin = 'F'
GROUP BY C.columnID, C.CourseName
HAVING COUNT(E.SID) > 10;

--2
SELECT S.SID, S.StudentName
FROM StudentMaster S
WHERE
    S.SID NOT IN (
        SELECT E.SID
        FROM EnrollmentMaster E
        JOIN CourseMaster C ON E.columnID = C.columnID
        WHERE C.CourseName = 'Java'
    );


--3
SELECT
    C.CourseName AS AdvancedCourse,
    COUNT(S.StudentName) AS TotalForeignStudents
FROM
    CourseMaster C
JOIN
    EnrollmentMaster E ON C.columnID = E.columnID
JOIN
    StudentMaster S ON E.SID = S.SID
WHERE
    C.Category = 'A'
    AND S.Origin = 'F'
GROUP BY
    S.StudentName, C.CourseName
ORDER BY
    TotalForeignStudents DESC;


--4
SELECT DISTINCT
    S.SID,
    S.StudentName
FROM
    StudentMaster S
JOIN
    EnrollmentMaster E ON S.SID = E.SID
JOIN
    CourseMaster C ON E.columnID = C.columnID
WHERE
    C.Category = 'B'
    AND MONTH(E.DOE) = 11
    AND YEAR(E.DOE) = 2023;


--5
select distinct  
        S.StudentName,
        S.SID
FROM StudentMaster S
join EnrollmentMaster E on S.SID = E.SID 
join CourseMaster C on E.columnID= C.columnID
where 
S.Type ='U'AND Origin = 'L' And Category='B' AND grade='C';

--6
SELECT
    C.columnID,
    C.CourseName
FROM
    CourseMaster C
WHERE
    C.columnID NOT IN (
        SELECT DISTINCT E.columnID
        FROM EnrollmentMaster E
        WHERE MONTH(E.DOE) = 5 AND YEAR(E.DOE) = 2023
    );


--7
select CourseName,count (SID) as Total_enrollments, case
when count(SID)>50 then 'High' when count(e.SID) <=50 and count(SID)>=25 then 'Medium'
else 'Low' end as Popularity
from CourseMaster as c
inner join EnrollmentMaster as E on c.columnID=e.columnID
group by CourseName;


--8
SELECT
    S.StudentName,
    C.CourseName,
    DATEDIFF(DAY,E.DOE,getDate()) AS EnrollmentAgeInDays
FROM
    EnrollmentMaster E
JOIN
    StudentMaster S ON E.SID = S.SID
JOIN
    CourseMaster C ON E.columnID = C.columnID
WHERE
    E.DOE = (SELECT MAX(DOE) FROM EnrollmentMaster WHERE SID = E.SID)
ORDER BY
    E.DOE DESC;


--9
SELECT S.StudentName
FROM StudentMaster S
JOIN EnrollmentMaster E ON S.SID = E.SID
JOIN CourseMaster C ON E.columnID = C.columnID
WHERE
    S.Origin = 'L'
    AND C.Category = 'B'
GROUP BY S.SID, S.StudentName
HAVING COUNT(DISTINCT C.columnID) = 3;


--10
SELECT
    C.columnID,
    C.CourseName
FROM
    CourseMaster C
JOIN
    EnrollmentMaster E ON C.columnID = E.columnID
JOIN
    StudentMaster S ON E.SID = S.SID
GROUP BY
    C.columnID, C.CourseName
HAVING
    COUNT(DISTINCT S.SID) = (SELECT COUNT(*) FROM StudentMaster);



--11
select s. SID, StudentName 
from StudentMaster as s 
inner join EnrollmentMaster as e 
on s.SID=e.SID 
where FWF=1 and Grade='F';


--12
 select StudentName,CourseName,Grade 
 from StudentMaster as s
 inner join EnrollmentMaster as e 
 on s.SID=e.SID
 inner join CourseMaster as c 
 on c.columnID=e.columnID
 where s.Origin='F' and s.Type='U' and e.Grade='C' and c.Category='B';


--13
select CourseName,
count(month(DOE)) as total_enrollments 
from CourseMaster as c
 inner join EnrollmentMaster as e 
 on c.columnID=e.columnID
 where month(DOE)=month(getdate()) and year(DOE)=month(getdate())
 group by  CourseName;

