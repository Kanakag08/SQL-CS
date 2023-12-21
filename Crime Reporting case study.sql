-- Kanak Agrawal 

--create table incidents 
create database crimeAnalysis;
Use crimeAnalysis;

create table Incidents
(
IncidentId int primary key,
IncidentType varchar(50),
IncidentDate date,
Location Varchar(100),
Description varchar(100),
Status varchar(40),
VictimID int foreign key 
references Victims(VictimID),
SuspectID int foreign key
references Suspects(SuspectID),
);

insert into Incidents(IncidentId,IncidentType,IncidentDate,Location,Description,Status,VictimID,SuspectID)
values
(1,'Robbery','2023-01-05','Latitude','123 Main city','open',1,1),  
(2,'Theft','2023-02-10','longitude','456 elm town','Closed',2,2),
(3,'Homocide','2023-03-15','Latitude','789 Oak village','Under investigation',3,3),
(4,'Robbery','2023-04-20','longitude','101 pine suburb','open',4,4),
(5,'Theft','2023-05-25','Latitude','234 cedar district','Closed',5,5),
(6,'Homocide','2023-06-30','longitude','567 birch country','Under investigation',6,6),
(7,'Robbery','2023-07-05','Latitude','890 Maple state','open',7,7),
(8,'Theft','2023-08-10','longitude','321 redwood country','Closed',8,8),
(9,'Homocide','2023-09-15','Latitude','432 spruce ','Under investigation',9,9),
(10,'Robbery','2023-10-20','longitude','765 fir territory','open',10,10);

-- create table Victims
create table Victims
(
VictimID int primary key,
FirstName varchar(40),
LastName varchar(40),
DOB Date,
Gender varchar(10),
Phone int
);
 
 insert into Victims(VictimID,FirstName,LastName,DOB,Gender,Phone)
 Values 
 (1,'Arjit','Singh','1998-10-20','Male',555-123-0025),
 (2,'Sakshi','Bang','1995-10-25','Female',567-123-0025),
 (3,'avi','Agrawal','2001-11-08','Male',789-123-1122),
 (4,'Ram','Mishra','1976-02-06','Male',453-089-7531),
 (5,'Tanisha','Parashar','2007-10-20','Female',017-792-1855),
 (6,'Vivek','Sharma','2010-12-18','Male',555-123-0555),
 (7,'Anjali','ojha','2003-03-29','Female',582-123-9999),
 (8,'Shyam','Singh','1998-10-20','Male',129-120-111),
 (9,'Lucky','Patel','1990-11-20','Male',696-9630-2222),
 (10,'Nisha','Singh','2000-07-18','Feale',785-030-0025);


 --create table Suspects 
 Create Table Suspects 
 (
 SuspectID int primary key,
 SFirstName varchar(50),
 SLastName Varchar(40),
 SDOB date,
 Sgender varchar(10),
 Sphone int
 );

 insert into Suspects(SuspectID,SFirstName,SLastName,SDOB,Sgender,Sphone)
 Values 
 (1,'sam','roy','1990-10-02','Male',111-123-1919),
 (2,'Sarah','saxesna','1986-10-03','Female',112-123-1818),
 (3,'Max','MAxwell','2001-11-08','Male',789-123-1122),
 (4,'Alex','Volvo','1976-02-06','Male',124-089-1717),
 (5,'Ava','Paxton','2007-06-04','Female',119-792-1616),
 (6,'Andrew','Garfield','2010-07-18','Male',222-123-1515),
 (7,'Wendy','Lee','2003-03-29','Female',999-123-2020),
 (8,'Tom','Holland','2004-08-20','Male',129-120-1212),
 (9,'Peter','Parker','2001-11-20','Male',888-9630-1313),
 (10,'Emma','Watson','2000-07-18','Female',785-030-1414);


 --create table law enforcement 

 Create table lawEnforcement
 (
 AgencyID int primary key,
 AgencyName Varchar(40),
 Jurisdiction varchar(40),
 LPhone int
 );

 insert into lawEnforcement(AgencyID,AgencyName,Jurisdiction,LPhone)
 values
 (1,'DLA Piper','Local',555-1234-890),
 (2,'Dentons','State',540-8961-527),
 (3,'White & Case','Federal',521-7896-100),
 (4,'Gibson Dunn','Local',572-7893-101),
 (5,'ABC ','State',753-9513-741),
 (6,'Baker McKenzie','Federal',123-7894-560),
 (7,'cops anc com','Local',258-1479-321),
 (8,'LL legal','State',039-7598-103),
 (9,'Legal Cor','Federal',963-7410-258),
 (10,' Ellis LLP','Local',852-1476-003);

 --create table officers
 create Table Officers
 (
 OfficerID int primary key,
 OfirstName varchar(40),
 OlastName varchar(40),
 BadgeNo int,
 Rank int,
 OPhone int,
 AgencyID int foreign key
 references lawEnforcement(AgencyID),
 );

 insert into Officers(OfficerID,OfirstName,OlastName,BadgeNo,Rank,OPhone,AgencyID)
 values
 (1,'john','doe',1,1,123-2589-741,1),
(2,'Robert','Smith',2,2,789-5236-101,2),
(3,'jane','johson',3,3,741-2398-547,2),
(4,'sarah','Smith',4,4,963-7410-753,4),
(5,'david','Smith',5,5,369-3698-654,5),
(6,'laura','HAll',6,6,145-7890-412,6),
(7,'Micheal','Davis',7,7,306-785-9620,7),
(8,'Emma','Wilson',8,8,9630-7412-896,8),
(9,'William','Taylor',9,9,415-1122-320,9),
(10,'Olivia','Adams',10,10,852-1021-774,10);

 --create table Evidence
 create table Evidence
 (
 EvidenceId int primary key,
 Edescription varchar(100),
 LocationFund float,
 IncidentID int Foreign key
 references Incidents(IncidentID),
 );

 insert into Evidence (EvidenceId,Edescription,LocationFund,IncidentID)
 values
 (1,'Short Hair',1220,1),
 (2,'always wear caps',1500,2),
 (3,'short straight hair ',2200,3),
 (4,'Long Curly hairs',230,4),
 (5,'Bold Eyes',500,5),
 (6,'Small Height',1400,6),
 (7,'Black Hair',1600,7),
 (8,'Wears Specs',3000,8),
 (9,'Brown hairs',1500,9),
 (10,'Fair color',7500,10);

 --create table Reports 
 create table Reports
 (
 ReportID int Primary key,
 IncidentID int foreign key
 references Incidents(IncidentID),
 ReportDate date,
 ReportDetails varchar(100),
 Status varchar(50)
 );

 insert into Reports(ReportID,IncidentID,ReportDate,ReportDetails)
 values
(1,1,'2023-01-05','Pending'),
(2,2,'2023-02-10','Complete'),
(3,3,'2023-03-15','Pending'),
(4,4,'2023-04-20','Complete'),
(5,5,'2023-05-25','Pending'),
(6,6,'2023-06-30','Complete'),
(7,7,'2023-07-05','Pending'),
(8,8,'2023-08-10','Complete'),
(9,9,'2023-09-15','Pending'),
(10,10,'2023-10-20','Complete');
