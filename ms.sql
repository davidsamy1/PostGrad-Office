create database four;

go
use four
create table PostGradUser(
id int identity,
email varchar(50) UNIQUE,
passwordd varchar(20),
primary key(id),
Check(LEN(passwordd)>7)
)

create table Admin(
id int,
primary key (id),
foreign key (id) references PostGradUser(id) on delete cascade on update cascade

)

create table GUCianstudent(
id int,
firstName varchar(20),
lastname varchar(20),
typee varchar(20),
faculty varchar(20),
addresss varchar(35),
GPA decimal(2,1) ,
undergradID int unique,
Primary key(id),
foreign key (id) references PostGradUser(id) on delete cascade on update cascade,
Check (GPA between 0.7 and 5.0)
)

create table NONGUCIANstudent(
id int,
firstName varchar(20),
lastname varchar(20),
typee varchar(20),
faculty varchar(20),
addresss varchar(35),
GPA decimal (2,1) ,
primary key (id),
Foreign Key (id) references PostGradUser(id) on delete cascade on update cascade,
Check (GPA between 0.0 and 4.0)
)

create table GUCStudentPhoneNumber(
id int  ,
phone int   ,
primary key (id, phone),
foreign key (id) references GUCianstudent(id) on delete cascade on update cascade
 )

create table nonGUCStudentPhoneNumber(
id int  ,
phone int ,
primary key(id, phone),
foreign key (id) references NONGUCIANstudent(id) on delete cascade on update cascade
 )

create table course( 
id int primary key,
fees int ,
credithours int ,
code int unique
)

create table supervisor (
id int,
namee varchar(20),
faculty varchar (20),
primary key (id),
Foreign Key (id) references PostGradUser(id) on delete cascade on update cascade
)

create table Payment(
id int primary key identity,
amount int,
no_installments int,
fundPercentage decimal(2,1)
);

create table Thesis (
SerialNumber int primary key identity,
field varchar(20),
type1 varchar(20),
title varchar(70),
startDate date ,
endDate date,
defenseDate date,
years as (YEAR(endDate)-YEAR(startDate)),
grade decimal(4,2) ,
payment_id int, 
noExtension int,
foreign key (payment_id) references Payment(id) on update cascade on delete cascade

)

create table Publication(
id int primary key identity,
title varchar(20),
dateP date,
place varchar(20),
accepted bit,
host varchar(20)
);

create table Examiner(
id int,
namee varchar(20),
FieldOfWork varchar (20),
isNational bit,
primary key(id),
Foreign key (id) references PostGradUser(id)
);

create table Defense(
SerialNumber int,
datee date,
locationn varchar(20),
grade decimal(4,2) ,
primary key (SerialNumber, datee),
Foreign key (SerialNumber) references Thesis(serialNumber) on  delete cascade on update cascade
);

create table GUCianProgessReport(
sidd int,
noo int identity,
datee date,
eval varchar(20),
statee int,
thesisSerialNumber int,
supid int,
descriptionn varchar(500), 
primary key (sidd, noo),
Foreign key (sidd) references GucianStudent(id) ,
Foreign key (thesisSerialNumber) references Thesis(serialNumber) ,
Foreign key (supid) references Supervisor(id)
);

create table NonGUCianProgressReport(
sidd int,
noo int,
datee date,
eval varchar(20),
statee int,
thesisSerialNumber int,
supid int,
descriptionn varchar(500), 
Primary Key (sidd, noo),
Foreign Key (sidd) references NonGUCianStudent(id) ,
Foreign Key (thesisSerialNumber) references Thesis(serialNumber),
Foreign Key (supid) references Supervisor(id)
);

create table Installment(
datee date,
paymentID int,
amount int,
done bit,
Primary Key(datee, paymentID),
Foreign Key (paymentID) references payment(id) on  delete cascade on update cascade
);

create table NonGucianStudentPayForCourse (
s_id int ,
paymentNo int,
c_id int,
primary key(s_id,paymentNo,c_id),
Foreign Key (s_id) references NonGucianStudent(id)on  delete cascade on update cascade,
Foreign Key (paymentNo) references Payment(id)  on  delete cascade on update cascade,
Foreign Key (c_id) references  Course(id)  on  delete cascade on update cascade
)

create table NonGucianStudentTakeCourse (
s_id int,
c_id int,
grade decimal(4,2),
primary key (s_id,c_id),
Foreign Key (s_id) references NonGucianStudent(id)on  delete cascade on update cascade,
Foreign Key (c_id) references  Course(id)  on  delete cascade on update cascade
)

create table GUCianStudentRegisterThesis(
s_id     int,
sup_id   int,
serialno int,
primary key (s_id,sup_id,serialno),
Foreign Key (s_id) references GucianStudent(id),
Foreign Key (sup_id) references Supervisor(id),
Foreign Key (serialno) references Thesis(SerialNumber)
)

create table NonGUCianStudentRegisterThesis(
s_id     int,
sup_id   int,
serialno int,
primary key (s_id,sup_id,serialno),
Foreign Key (s_id) references NonGucianStudent(id),
Foreign Key (sup_id) references Supervisor(id),
Foreign Key (serialno) references Thesis(SerialNumber)
);

create table ExaminerEvaluateDefense(
datee date,
serialNo int,
ExaminerID int,
comment varchar(300),
Primary Key (datee, serialNo, ExaminerID),
Foreign Key (serialNo,datee) references Defense,
Foreign Key (ExaminerID) references Examiner(id)
)

create table ThesisHasPublication(
serialNo int,
pubid int,
Primary Key(serialNo, pubid),
Foreign Key (serialNo) references Thesis(serialNumber)on  delete cascade on update cascade,
Foreign Key (pubid) references Publication(id)on  delete cascade on update cascade
)

insert into PostGradUser (email,passwordd) values ('Admin123@gmail.com','qwer0123')
insert into PostGradUser (email,passwordd) values ('kahled.ahmed@student.guc.edu.eg','qwer0124')
insert into PostGradUser (email,passwordd) values ('adel.mohamed@student.guc.edu.eg','qwer0125') 
insert into PostGradUser (email,passwordd) values ('ahmed.sief@student.guc.edu.eg','qwer0126')
insert into PostGradUser (email,passwordd) values ('adham.ammar@student.guc.edu.eg','qwer0127')
insert into PostGradUser (email,passwordd) values ('saeed.ahmed@student.guc.edu.eg','qwer0128') 
insert into PostGradUser (email,passwordd) values ('mahmoud.ayad@student.guc.edu.eg','qwer0129')
insert into PostGradUser (email,passwordd) values ('adham.kareem@hotmail.com','qwer01210')
insert into PostGradUser (email,passwordd) values ('hussien.tamer@hotmail.com','qwer01211')
insert into PostGradUser (email,passwordd) values ('yasser.hamdy@hotmail.com','qwer01212')
insert into PostGradUser (email,passwordd) values ('ahmed.hegazy@guc.edu.eg','qwer01213')
insert into PostGradUser (email,passwordd) values ('mohamed.hazem@guc.edu.eg','qwer01214')  
insert into PostGradUser (email,passwordd) values ('zeyad.omar@guc.edu.eg','qwer01215')

insert into Admin (id) values(1)

insert into GUCianstudent values (2,'Khaled','ahmed','PHD','Engineering','dokki',0.73,3123)
insert into GUCianstudent values (3,'adel','mohamed','PHD','Pharmacy','giza',0.8,1093)
insert into GUCianstudent values (4,'ahmed','seif','Master','Engineering','manial',1.3,15672)
insert into GUCianstudent values (5,'adham','ammar','Master','Mangement','rehab',1.05,1235)
insert into GUCianstudent values (6,'saeed','ahmed','Master','Law','maadi',1.1,6789)
insert into GUCianstudent values (7,'mahmoud','ayad','Master','Applied Arts','new cairo',1.2,12039)

insert into NONGUCIANstudent values (8,'adam','kareem','PHD','Engineering','6th october',4.0)
insert into NONGUCIANstudent values	(9,'hussien','tamer','Master','Pharmacy','rehab',3.8)
insert into NONGUCIANstudent values	(10,'yasser','hamdy','Master','Law','5th settelement',3.7)

insert into supervisor(id,namee,faculty) values (11,'ahmed hegazy','Engineering')
insert into supervisor(id,namee,faculty) values (12,'mohamed hazem','Applied Arts')
insert into supervisor(id,namee,faculty) values (13,'zeyad omar','Mangement')

select * from PostGradUser
select * from GUCianstudent
select * from NONGUCIANstudent
select * from supervisor
select * from PostGradUser P,GUCianstudent G where P.id=G.id
select * from PostGradUser P,NONGUCIANstudent NG where P.id=NG.id
select * from PostGradUser P,supervisor S where P.id=S.id


insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (50000,2,8.75)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)
insert into payment values (80000,2,9.5)

insert into Thesis values ('AI','Masters','AI and how it is affected by machine learning','2019/8/5','2021/6/3','2020/10/6',90.03,1,1)
insert into Thesis values ('Economics','Masters','how stock markets affects financial stability','2019/8/16','2021/6/23','2020/5/28',9.25,2,0)
insert into Thesis values ('Law','Masters','Criminal law dissertation ','2019/8/7','2021/3/3','2020/5/18',8.45,3,0)
insert into Thesis values ('Law','Masters','A comprehensive review on child labour laws','2019/8/28','2021/11/3','2020/12/12',7.25,4,0)
insert into Thesis values ('Law','Masters','Effect of International Commercial Law on Egyptian Laws','2019/8/6','2021/5/3','2020/6/8',8.35,5,1)
insert into Thesis values ('Business','Masters','Influence of banking sector on economic growth','2019/8/15','2021/6/3','2020/5/8',9.1,6,2)
insert into Thesis values ('Business','Masters','Relationship of financial incentives to worker morale','2019/8/13','2021/6/3','2020/5/19',8.9,7,0)
insert into Thesis values ('Cs','Masters',' databases and data mining','2019/8/20','2021/6/3','2020/5/8',7.95,8,0)
insert into Thesis values ('Art','Masters','Does Performance Art Have Boundaries?','2019/8/3','2021/6/3','2020/5/9',8.35,9,1)
insert into Thesis values ('CS','Masters','Quantum computing','2019/7/15','2021/6/3','2020/5/18',9.15,10,0)
insert into Thesis values ('CS','Masters','Merits and demerits of cloud storage','2019/8/22','2021/12/3','2020/5/24',8.25,11,1)
insert into Thesis values ('CS','Masters','Network Security and Cryptography','2019/8/19','2020/7/13','2020/5/5',9.35,12,0)
insert into Thesis values ('AI','Masters','AI based fake product detection from motion patterns ','2019/8/11','2021/2/14','2020/5/6',8.45,13,0)
insert into Thesis values ('AI','Masters','Data/driven Test Cases Generation for Autonomous Vehicles','2019/8/5','2021/5/11','2020/5/17',7.55,14,0)
insert into Thesis values ('Economics','Masters','The company objectives and their reflection in a pricing policy','2019/8/9','2021/12/2','2020/5/8',9.65,15,2)
insert into Thesis values ('Machine Learning','Masters','Automated real/time support','2019/8/30','2021/6/9','2020/5/25',9.2,16,0)
insert into Thesis values ('CS','Masters','Hardware and architecture','2019/8/6','2021/6/3','2020/5/8',8.6,17,0)
insert into Thesis values ('Robotics','Masters','Medical eobots','2019/8/7','2021/6/9','2020/5/16',7.5,18,0)
insert into Thesis values ('Robotics','Masters','AI and Robotics','2019/8/8','2021/6/25','2020/5/9',8.7,19,0)
insert into Thesis values ('CS','Masters','Cyber/physical systems','2019/8/9','2022/6/6','2020/5/8',7.8,20,1)
insert into Thesis values ('AI','PHD','Acceptance of AI/Based Decision Making','2018/8/21','2022/6/3','2020/5/20',7.9,21,0)
insert into Thesis values ('CS','PHD','Decryption, and encryption of data','2018/8/29','2022/6/9','2020/5/29',9.9,22,0)
insert into Thesis values ('CS','PHD','Natural language processing','2018/8/2','2021/6/2','2020/5/7',7.8,23,1)
insert into Thesis values ('Cybersecurity','PHD','Cyber security in IoT appliances','2018/8/30','2021/6/3','2020/5/23',9.5,24,0)
insert into Thesis values ('Automation','PHD','Machine learning for Autonomous Factories','2018/8/9','2021/6/1','2020/5/10',8.5,25,0)
insert into Thesis values ('Machine Learning','PHD','Chess engines Vs AlPhaGO','2018/8/5','2021/6/29','2020/5/1',2.5,26,0)
insert into Thesis values ('AI','PHD','Optimization algorithms for self driving cars','2018/8/11','2021/6/30','2020/5/2',8.3,27,0)
insert into Thesis values ('Robotics','PHD','Humanoid robot and imitation','2018/8/1','2021/6/3','2020/5/27',9.25,28,1)
insert into Thesis values ('Economics','PHD','Free Market Capitalism','2018/8/26','2021/6/4','2020/5/21',8.66,29,0)
insert into Thesis values ('Law','PHD','Police interrogations and Egyptian legal system','2018/8/28','2021/6/9','2020/5/10',8.75,30,0)


insert into Installment values ('2019/6/1',1,25000,1)
insert into Installment values ('2020/12/30',1,25000,0)

insert into Installment values ('2019/6/1',2,25000,1)
insert into Installment values ('2020/12/30',2,25000,0)

insert into Installment values ('2019/6/1',3,25000,1)
insert into Installment values ('2020/12/30',3,25000,0)

insert into Installment values ('2019/6/1',4,25000,1)
insert into Installment values ('2020/12/30',4,25000,0)

insert into Installment values ('2019/6/1',5,25000,1)
insert into Installment values ('2020/12/30',5,25000,0)

insert into Installment values ('2019/6/1',6,25000,1)
insert into Installment values ('2020/12/30',6,25000,0)

insert into Installment values ('2019/6/1',7,25000,1)
insert into Installment values ('2020/12/30',7,25000,0)

insert into Installment values ('2019/6/1',8,25000,1)
insert into Installment values ('2020/12/30',8,25000,0)

insert into Installment values ('2019/6/1',9,25000,1)
insert into Installment values ('2020/12/30',9,25000,0)

insert into Installment values ('2019/6/1',10,25000,1)
insert into Installment values ('2020/12/30',10,25000,0)

insert into Installment values ('2019/6/1',11,25000,1)
insert into Installment values ('2020/12/30',11,25000,0)

insert into Installment values ('2019/6/1',12,25000,1)
insert into Installment values ('2020/12/30',12,25000,0)

insert into Installment values ('2019/6/1',13,25000,1)
insert into Installment values ('2020/12/30',13,25000,0)

insert into Installment values ('2019/6/1',14,25000,1)
insert into Installment values ('2020/12/30',14,25000,0)

insert into Installment values ('2019/6/1',15,25000,1)
insert into Installment values ('2020/12/30',15,25000,0)

insert into Installment values ('2019/6/1',16,25000,1)
insert into Installment values ('2020/12/30',16,25000,0)

insert into Installment values ('2019/6/1',17,25000,1)
insert into Installment values ('2020/12/30',17,25000,0)

insert into Installment values ('2019/6/1',18,25000,1)
insert into Installment values ('2020/12/30',18,25000,0)

insert into Installment values ('2019/6/1',19,25000,1)
insert into Installment values ('2020/12/30',19,25000,0)

insert into Installment values ('2019/6/1',20,25000,1)
insert into Installment values ('2020/12/30',20,25000,0)

insert into Installment values ('1/6/2018',21,40000,1)
insert into Installment values ('2020/12/30',21,40000,0)

insert into Installment values ('1/6/2018',22,40000,1)
insert into Installment values ('2020/12/30',22,40000,0)

insert into Installment values ('1/6/2018',23,40000,1)
insert into Installment values ('2020/12/30',23,40000,0)

insert into Installment values ('1/6/2018',24,40000,1)
insert into Installment values ('2020/12/30',24,40000,0)

insert into Installment values ('1/6/2018',25,40000,1)
insert into Installment values ('2020/12/30',25,40000,0)

insert into Installment values ('1/6/2018',26,40000,1)
insert into Installment values ('2020/12/30',26,40000,0)

insert into Installment values ('1/6/2018',27,40000,1)
insert into Installment values ('2020/12/30',27,40000,0)

insert into Installment values ('1/6/2018',28,40000,1)
insert into Installment values ('2020/12/30',28,40000,0)

insert into Installment values ('1/6/2018',29,40000,1)
insert into Installment values ('2020/12/30',29,40000,0)

insert into Installment values ('1/6/2018',30,40000,1)
insert into Installment values ('2020/12/30',30,40000,0)

select * from Payment 
select * from Payment P, Installment I where P.id=I.paymentID order by p.id
select * from Payment P, Thesis T where P.id=T.payment_id

-- Question 6 (a)

GO
Create PROC viewMyProfile
@studentId int
AS
if @studentId is NULL
    print 'input is null'
else 
BEGIN
    if @studentId in (select id from GUCianstudent)
    BEGIN
        SELECT * FROM GUCianstudent
    END
    ELSE
    BEGIN
    if @studentId in (select id from NONGUCIANstudent)
        SELECT * from NONGUCIANstudent
    else 
        print 'Student ID Does Not Exist'
    END
END


GO
-- Question 6 (b)

CREATE PROC editMyProfile
@studentID int, @firstName varchar(10), @lastName varchar(10), @password varchar(10),
@email varchar(10), @address varchar(10), @type varchar(10)
AS
if @studentID is null or @firstName is null or @lastName is null or
 @password is null or @email is null or @address is null or @type is null
 PRINT 'one or more inputs is null'
ELSE
BEGIN
    IF @studentID in (SELECT id from GUCianstudent)
    BEGIN
        UPDATE GUCianstudent
        SET firstName = @firstName , lastname = @lastName, addresss = @address,typee = @type
        WHERE id = @studentID
        UPDATE PostGradUser
        SET passwordd = @password, email = @email
        where id = @studentID
    END
    ELSE
    BEGIN
    IF @studentID in (SELECT id from NONGUCIANstudent)
        BEGIN
        UPDATE GUCianstudent
        SET firstName = @firstName , lastname = @lastName, addresss = @address,typee = @type
        WHERE id = @studentID
        UPDATE PostGradUser
        SET passwordd = @password, email = @email
        where id = @studentID
    END
    ELSE
        PRINT 'Student ID Does Not Exist'
    END
END

GO
-- Question 6 (c)
CREATE PROC addUndergradID
@studentID int,
@undergradID varchar(10)
AS
if @studentID is null or @undergradID IS NULL
    PRINT 'one  or more inputs is null'
ELSE
BEGIN
    IF @studentID in (SELECT id from GUCianstudent)
    BEGIN
        UPDATE GUCianstudent
        SET undergradID = @undergradID
        where id = @studentID
    END
    ELSE
        PRINT 'ID Does Not Exist'
END

GO
-- Question 6 (d)
CREATE PROC ViewCoursesGrades
@studentID int
AS
if @studentID is null
PRINT 'The Given Input Is Null'
ELSE
BEGIN
    IF @studentID in (select s_id from NonGucianStudentTakeCourse)
    BEGIN
        SELECT c_id,grade from NonGucianStudentTakeCourse
        WHERE s_id = @studentID
    END
    ELSE
        PRINT 'Student ID Does Not Exist'
END

GO
--Question 6 (e)

CREATE PROC ViewCoursePaymentsInstall
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
BEGIN
    IF @studentID in (select sid from NonGucianStudentPayForCourse)
        SELECT p.*,i.*
        FROM NonGucianStudentPayForCourse n inner JOIN Payment p on n.paymentNo = p.id INNER JOIN Installment i on i.paymentID = p.id
        ELSE
            print 'ID Does Not Exist'
END

GO

CREATE PROC ViewThesisPaymentsInstall
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
    BEGIN 
    IF @studentID in (select s_id from GUCianStudentRegisterThesis)
    BEGIN
        select i.*,p.*
        from Installment i INNER JOIN Payment p on i.paymentID = p.id INNER JOIN Thesis t on t.payment_id = p.id
            INNER JOIN GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
        WHERE @studentID=g.s_id
    END
    ELSE
    BEGIN
        IF @studentID in (select s_id from NonGUCianStudentRegisterThesis)
        BEGIN
            select i.*,p.*
            from Installment i INNER JOIN Payment p on i.paymentID = p.id INNER JOIN Thesis t on t.payment_id = p.id
                INNER JOIN NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
            WHERE @studentID=g.s_id
        END
        ELSE
        PRINT ' ID Does Not Exist'
    END
END

GO

CREATE PROC ViewUpcomingInstallments
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
BEGIN 
    IF @studentID in (select s_id from GUCianStudentRegisterThesis)
    BEGIN
        select i.datee, i.paymentID, i.amount
        from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
            LEFT OUTER JOIN GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
        WHERE @studentID=g.s_id and GETDATE() < i.datee and i.done = '0' 
    END
    ELSE
    BEGIN
        IF @studentID in (select s_id from NonGUCianStudentRegisterThesis)
        BEGIN
            select i.datee, i.paymentID, i.amount
            from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
                LEFT OUTER JOIN NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
            WHERE @studentID=g.s_id and GETDATE() < i.datee and i.done = '0'
        END
    END
END
GO

CREATE PROC ViewMissedInstallments
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
BEGIN 
    IF @studentID in (select s_id from GUCianStudentRegisterThesis)
    BEGIN
        select i.datee, i.paymentID, i.amount
        from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
            LEFT OUTER JOIN GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
        WHERE @studentID=g.s_id and GETDATE() > i.datee and i.done = '0'
    END
    ELSE
    BEGIN
        IF @studentID in (select s_id from NonGUCianStudentRegisterThesis)
        BEGIN
            select i.datee, i.paymentID, i.amount
            from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
                LEFT OUTER JOIN NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
            WHERE @studentID=g.s_id and GETDATE() > i.datee and i.done = '0'
        END
        ELSE
        PRINT 'Student ID Does Not Exist'
    END
END
GO


-- Question 6 (i)
CREATE PROC linkPubThesis
@PubID int,
@thesisSerialNo int
AS
if (exists(select * from Thesis t where @thesisSerialNo = t.SerialNumber))
BEGIN
    if (exists(select * from Publication p where @PubID = p.id))
    BEGIN
        INSERT Into ThesisHasPublication 
        VALUES(@thesisSerialNo,@PubID)
    END
    ELSE
        PRINT 'Publication ID Does not Exist '
END
ELSE
        PRINT 'Thesis Serial Number Does not Exist '

-- Question 6 (h)

GO
CREATE PROC addPublication
@title varchar(50),
@pubDate datetime,
@host varchar(50),
@place varchar(50), 
@accepted bit
AS
if @title IS NULL   or  @pubDate  IS NULL or  @host IS NULL or  @place IS NULL or  @accepted IS NULL
    PRINT 'One of the inputs is null'
ELSE
BEGIN
    INSERT INTO Publication (title, dateP, place, accepted, host)
    VALUES (@title,@pubDate, @place, @accepted, @host)
END

-- Question 6 (g)

GO
CREATE PROC ViewEvalProgressReport
@thesisSerialNo int,
@progressReportNo int
AS

if EXISTS(SELECT * FROM Thesis t WHERE t.SerialNumber = @thesisSerialNo)
BEGIN
    if exists(SELECT * FROM GUCianProgessReport g WHERE g.noo = @progressReportNo )
    BEGIN
        SELECT p.eval 
        FROM GUCianProgessReport p INNER JOIN Thesis t on  p.thesisSerialNumber = t.SerialNumber
        where t.SerialNumber = @thesisSerialNo and p.noo = @progressReportNo
    END
    ELSE
        if exists(SELECT * FROM NonGUCianProgressReport g WHERE g.noo = @progressReportNo )
        BEGIN
            SELECT n.eval 
            FROM NonGUCianProgressReport n INNER JOIN Thesis t on  n.thesisSerialNumber = t.SerialNumber
            where t.SerialNumber = @thesisSerialNo and n.noo = @progressReportNo
        END
        ELSE
            PRINT 'Progress Report Number Does Not Exist'
    END
    ELSE
        PRINT 'Serial Number Does not Exist'

GO

-- Question 6 (f)
CREATE PROC AddProgressReport
@thesisSerialNo int,
@progressReportDate date
AS

DECLARE @supid INT
DECLARE @sid INT


IF @thesisSerialNo is null or @progressReportDate is null
    PRINT 'ONE OF THE INPUTS IS NULL'
else 
BEGIN
    if @thesisSerialNo in (select serialno from GUCianStudentRegisterThesis)
    BEGIN
    
        SELECT @supid = g.sup_id FROM GUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
        SELECT @sid = g.s_id FROM GUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
        INSERT into GUCianProgessReport (thesisSerialNumber, datee, sidd, supid)
        VALUES(@thesisSerialNo, @progressReportDate, @sid, @supid)
    END
    ELSE
    BEGIN
        if @thesisSerialNo in (select serialno from NonGUCianStudentRegisterThesis)
        BEGIN  
            SELECT @supid = g.sup_id FROM NonGUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
            SELECT @sid = g.s_id FROM NonGUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
            INSERT into NonGUCianProgressReport (thesisSerialNumber, datee, sidd, supid)
            VALUES(@thesisSerialNo, @progressReportDate, @sid, @supid)
        END
        ELSE 
            PRINT ' Wrong Thesis Serial Number'
    END
END


GO
CREATE PROC FillProgressReport
@thesisSerialNo int, 
@progressReportNo int, 
@state int, 
@description varchar(200)
AS 
 if @thesisSerialNo is null or @progressReportNo is null or @state is null or @description is null
 BEGIN
    PRINT 'One of the inputs is null'
END
ELSE 
BEGIN
    if @thesisSerialNo in (select serialno from GUCianStudentRegisterThesis)
    BEGIN
        UPDATE GUCianProgessReport 
        SET statee = @state , descriptionn = @description 
        where @progressReportNo = noo and @thesisSerialNo = thesisSerialNumber
    END
    else
    BEGIN
        if @thesisSerialNo in (select serialno from NonGUCianStudentRegisterThesis)
        BEGIN
            UPDATE NonGUCianProgressReport 
            SET statee = @state , descriptionn = @description 
            where @progressReportNo = noo and @thesisSerialNo = thesisSerialNumber
        END
        ELSE
            PRINT 'Wrong Thesis Serial Number'
    END
END

-- _________________________________________________________________________


INSERT INTO PostGradUser(id,email,passwordd) VALUES(14,'somerandommail@gmail.com','12345678')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(15,'anotherrandommail@gmail.com','1234ASD78')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(16,'athirdrandommail@gmail.com','1234dfgh78')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(17,'justarandommail@gmail.com','1dfg5678')
INSERT INTO PostGradUser(id,email,passwordd) VALUES(18,'randommail@gmail.com','123sfn78')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(14, 'Ziad','Applies Science','0')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(15, 'Ahmed','Mathimatics','0')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(16, 'Yousef','Engineering','1')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(17, 'Adham','Networks','1')
INSERT INTO Examiner(id,namee,FieldOfWork,isNational) VALUES(18, 'Hatem','CS','1')



-- Question 6 (a)

GO
Create PROC viewMyProfile
@studentId int
AS
if @studentId is NULL
    print 'input is null'
else 
BEGIN
    if @studentId in (select id from GUCianstudent)
    BEGIN
        SELECT * FROM GUCianstudent
    END
    ELSE
    BEGIN
    if @studentId in (select id from NONGUCIANstudent)
        SELECT * from NONGUCIANstudent
    else 
        print 'Student ID Does Not Exist'
    END
END


GO
-- Question 6 (b)

CREATE PROC editMyProfile
@studentID int, @firstName varchar(10), @lastName varchar(10), @password varchar(10),
@email varchar(10), @address varchar(10), @type varchar(10)
AS
if @studentID is null or @firstName is null or @lastName is null or
 @password is null or @email is null or @address is null or @type is null
 PRINT 'one or more inputs is null'
ELSE
BEGIN
    IF @studentID in (SELECT id from GUCianstudent)
    BEGIN
        UPDATE GUCianstudent
        SET firstName = @firstName , lastname = @lastName, addresss = @address,typee = @type
        WHERE id = @studentID
        UPDATE PostGradUser
        SET passwordd = @password, email = @email
        where id = @studentID
    END
    ELSE
    BEGIN
    IF @studentID in (SELECT id from NONGUCIANstudent)
        BEGIN
        UPDATE GUCianstudent
        SET firstName = @firstName , lastname = @lastName, addresss = @address,typee = @type
        WHERE id = @studentID
        UPDATE PostGradUser
        SET passwordd = @password, email = @email
        where id = @studentID
    END
    ELSE
        PRINT 'Student ID Does Not Exist'
    END
END

GO
-- Question 6 (c)
CREATE PROC addUndergradID
@studentID int,
@undergradID varchar(10)
AS
if @studentID is null or @undergradID IS NULL
    PRINT 'one  or more inputs is null'
ELSE
BEGIN
    IF @studentID in (SELECT id from GUCianstudent)
    BEGIN
        UPDATE GUCianstudent
        SET undergradID = @undergradID
        where id = @studentID
    END
    ELSE
        PRINT 'ID Does Not Exist'
END

GO
-- Question 6 (d)
CREATE PROC ViewCoursesGrades
@studentID int
AS
if @studentID is null
PRINT 'The Given Input Is Null'
ELSE
BEGIN
    IF @studentID in (select s_id from NonGucianStudentTakeCourse)
    BEGIN
        SELECT c_id,grade from NonGucianStudentTakeCourse
        WHERE s_id = @studentID
    END
    ELSE
        PRINT 'Student ID Does Not Exist'
END

GO
--Question 6 (e)

CREATE PROC ViewCoursePaymentsInstall
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
BEGIN
    IF @studentID in (select sid from NonGucianStudentPayForCourse)
        SELECT p.*,i.*
        FROM NonGucianStudentPayForCourse n inner JOIN Payment p on n.paymentNo = p.id INNER JOIN Installment i on i.paymentID = p.id
        ELSE
            print 'ID Does Not Exist'
END

GO

CREATE PROC ViewThesisPaymentsInstall
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
    BEGIN 
    IF @studentID in (select s_id from GUCianStudentRegisterThesis)
    BEGIN
        select i.*,p.*
        from Installment i INNER JOIN Payment p on i.paymentID = p.id INNER JOIN Thesis t on t.payment_id = p.id
            INNER JOIN GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
        WHERE @studentID=g.s_id
    END
    ELSE
    BEGIN
        IF @studentID in (select s_id from NonGUCianStudentRegisterThesis)
        BEGIN
            select i.*,p.*
            from Installment i INNER JOIN Payment p on i.paymentID = p.id INNER JOIN Thesis t on t.payment_id = p.id
                INNER JOIN NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
            WHERE @studentID=g.s_id
        END
        ELSE
        PRINT ' ID Does Not Exist'
    END
END

GO

CREATE PROC ViewUpcomingInstallments
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
BEGIN 
    IF @studentID in (select s_id from GUCianStudentRegisterThesis)
    BEGIN
        select i.datee, i.paymentID, i.amount
        from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
            LEFT OUTER JOIN GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
        WHERE @studentID=g.s_id and GETDATE() < i.datee and i.done = '0' 
    END
    ELSE
    BEGIN
        IF @studentID in (select s_id from NonGUCianStudentRegisterThesis)
        BEGIN
            select i.datee, i.paymentID, i.amount
            from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
                LEFT OUTER JOIN NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
            WHERE @studentID=g.s_id and GETDATE() < i.datee and i.done = '0'
            UNION
            select i.datee, i.paymentID, i.amount
            from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
                LEFT OUTER JOIN NonGucianStudentPayForCourse g on g.paymentNo = p.id  
            WHERE @studentID=g.s_id and GETDATE() < i.datee and i.done = '0'
        END
    END
END
GO

CREATE PROC ViewMissedInstallments
@studentID int
AS
if @studentID is NULL
    PRINT 'The Given Input Is Null'
ELSE
BEGIN 
    IF @studentID in (select s_id from GUCianStudentRegisterThesis)
    BEGIN
        select i.datee, i.paymentID, i.amount
        from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
            LEFT OUTER JOIN GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
        WHERE @studentID=g.s_id and GETDATE() > i.datee and i.done = '0'
    END
    ELSE
    BEGIN
        IF @studentID in (select s_id from NonGUCianStudentRegisterThesis)
        BEGIN
            select i.datee, i.paymentID, i.amount
            from Installment i LEFT OUTER JOIN Payment p on i.paymentID = p.id LEFT OUTER JOIN Thesis t on t.payment_id = p.id
                LEFT OUTER JOIN NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber  
            WHERE @studentID=g.s_id and GETDATE() > i.datee and i.done = '0'
        END
        ELSE
        PRINT 'Student ID Does Not Exist'
    END
END
GO


-- Question 6 (i)
CREATE PROC linkPubThesis
@PubID int,
@thesisSerialNo int
AS
if (exists(select * from Thesis t where @thesisSerialNo = t.SerialNumber))
BEGIN
    if (exists(select * from Publication p where @PubID = p.id))
    BEGIN
        INSERT Into ThesisHasPublication 
        VALUES(@thesisSerialNo,@PubID)
    END
    ELSE
        PRINT 'Publication ID Does not Exist '
END
ELSE
        PRINT 'Thesis Serial Number Does not Exist '

-- Question 6 (h)

GO
CREATE PROC addPublication
@title varchar(50),
@pubDate datetime,
@host varchar(50),
@place varchar(50), 
@accepted bit
AS
if @title IS NULL   or  @pubDate  IS NULL or  @host IS NULL or  @place IS NULL or  @accepted IS NULL
    PRINT 'One of the inputs is null'
ELSE
BEGIN
    INSERT INTO Publication (title, dateP, place, accepted, host)
    VALUES (@title,@pubDate, @place, @accepted, @host)
END

-- Question 6 (g)

GO
CREATE PROC ViewEvalProgressReport
@thesisSerialNo int,
@progressReportNo int
AS

if EXISTS(SELECT * FROM Thesis t WHERE t.SerialNumber = @thesisSerialNo)
BEGIN
    if exists(SELECT * FROM GUCianProgessReport g WHERE g.noo = @progressReportNo )
    BEGIN
        SELECT p.eval 
        FROM GUCianProgessReport p INNER JOIN Thesis t on  p.thesisSerialNumber = t.SerialNumber
        where t.SerialNumber = @thesisSerialNo and p.noo = @progressReportNo
    END
    ELSE
        if exists(SELECT * FROM NonGUCianProgressReport g WHERE g.noo = @progressReportNo )
        BEGIN
            SELECT n.eval 
            FROM NonGUCianProgressReport n INNER JOIN Thesis t on  n.thesisSerialNumber = t.SerialNumber
            where t.SerialNumber = @thesisSerialNo and n.noo = @progressReportNo
        END
        ELSE
            PRINT 'Progress Report Number Does Not Exist'
    END
    ELSE
        PRINT 'Serial Number Does not Exist'

GO

-- Question 6 (f)
CREATE PROC AddProgressReport
@thesisSerialNo int,
@progressReportDate date
AS

DECLARE @supid INT
DECLARE @sid INT


IF @thesisSerialNo is null or @progressReportDate is null
    PRINT 'ONE OF THE INPUTS IS NULL'
else 
BEGIN
    if @thesisSerialNo in (select serialno from GUCianStudentRegisterThesis)
    BEGIN
    
        SELECT @supid = g.sup_id FROM GUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
        SELECT @sid = g.s_id FROM GUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
        INSERT into GUCianProgessReport (thesisSerialNumber, datee, sidd, supid)
        VALUES(@thesisSerialNo, @progressReportDate, @sid, @supid)
    END
    ELSE
    BEGIN
        if @thesisSerialNo in (select serialno from NonGUCianStudentRegisterThesis)
        BEGIN  
            SELECT @supid = g.sup_id FROM NonGUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
            SELECT @sid = g.s_id FROM NonGUCianStudentRegisterThesis g WHERE g.serialno = @thesisSerialNo
            INSERT into NonGUCianProgressReport (thesisSerialNumber, datee, sidd, supid)
            VALUES(@thesisSerialNo, @progressReportDate, @sid, @supid)
        END
        ELSE 
            PRINT ' Wrong Thesis Serial Number'
    END
END


GO
CREATE PROC FillProgressReport
@thesisSerialNo int, 
@progressReportNo int, 
@state int, 
@description varchar(200)
AS 
 if @thesisSerialNo is null or @progressReportNo is null or @state is null or @description is null
 BEGIN
    PRINT 'One of the inputs is null'
END
ELSE 
BEGIN
    if @thesisSerialNo in (select serialno from GUCianStudentRegisterThesis)
    BEGIN
        UPDATE GUCianProgessReport 
        SET statee = @state , descriptionn = @description 
        where @progressReportNo = noo and @thesisSerialNo = thesisSerialNumber
    END
    else
    BEGIN
        if @thesisSerialNo in (select serialno from NonGUCianStudentRegisterThesis)
        BEGIN
            UPDATE NonGUCianProgressReport 
            SET statee = @state , descriptionn = @description 
            where @progressReportNo = noo and @thesisSerialNo = thesisSerialNumber
        END
        ELSE
            PRINT 'Wrong Thesis Serial Number'
    END
END

-- _________________________________________________________________________



-- exec viewMyProfile 1
-- exec editMyProfile 2 ''
-- exec addUndergradID
-- exec ViewCoursesGrades
-- exec ViewCoursePaymentsInstall
-- exec ViewThesisPaymentsInstall
-- exec ViewUpcomingInstallments
-- exec ViewMissedInstallments
-- exec linkPubThesis
-- exec addPublication
-- exec ViewEvalProgressReport
-- exec AddProgressReport
-- exec FillProgressReport