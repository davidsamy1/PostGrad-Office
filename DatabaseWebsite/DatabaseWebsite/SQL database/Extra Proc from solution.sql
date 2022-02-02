use finalsubmission

go

create proc addGucianPhone
@PhoneNo varchar(20)
as
declare @id int
select @ID = max(P.id)
from GUCianstudent P 
insert into GUCStudentPhoneNumber values(@id,@PhoneNo)

go
create proc addNonGucianPhone
@PhoneNo varchar(20)
as
declare @id int
select @ID = max(P.id)
from NONGUCIANstudent P 
insert into nonGUCStudentPhoneNumber values(@id,@PhoneNo)
go

CREATE PROC StudentRegister2
@password varchar(20),
@Gucian bit,
@email varchar(50),
@success bit output,
@firstname varchar(20),
@lastname varchar(20),
@type varchar(20),
@faculty varchar(20),
@address varchar(35)

AS
set @success =1

DECLARE @ID int
if(exists(select email from PostGradUser where @email=email))
set @success=0
else
INSERT INTO PostGradUser VALUES (@email, @password)

select @ID = max(P.id)
from PostGradUser P 

IF (@Gucian = 1 and @success =1)
INSERT INTO GUCianStudent (id,addresss,faculty,firstName,lastname,typee) VALUES (@ID,@address,@faculty,@firstname,@lastname,@type)

ELSE if(@Gucian = 0 and @success =1)
INSERT INTO NonGUCianStudent (id,addresss,faculty,firstName,lastname,typee) VALUES (@ID,@address,@faculty,@firstname,@lastname,@type)

go

CREATE PROC examinerRegister 
@password varchar(20),
@email varchar(50),
@success bit output,
@name varchar(20),
@fieldofwork varchar(200),
@national bit

AS
set @success =1

DECLARE @ID int
if(exists(select email from PostGradUser where @email=email))
set @success=0
else
INSERT INTO PostGradUser VALUES (@email, @password)


select @ID = max(P.id)
from PostGradUser P 
if(@success=1)
INSERT INTO examiner (id,namee,FieldOfWork,isNational ) VALUES (@ID,@name,@fieldofwork,@national)

go

CREATE PROC SupervisorRegister2
@password varchar(20),
@email varchar(50),
@success bit output,
@name varchar(20),
@faculty varchar(20)

AS
set @success =1

DECLARE @ID int
if(exists(select email from PostGradUser where @email=email))
set @success=0
else
INSERT INTO PostGradUser VALUES (@email, @password)


select @ID = max(P.id)
from PostGradUser P 
if(@success=1)
INSERT into supervisor (id,namee,faculty ) VALUES (@ID,@name,@faculty)

go

Create proc userLogin2
@email varchar(50),
@password varchar(20),
@success bit output,
@type int output,
@id int output
as
begin
if exists(
select email,passwordd
from PostGradUser
where email=@email and passwordd=@password)
begin
set @success =1
select @id=id from PostGradUser where email=@email and passwordd=@password;
-- check user type 0-->Student,1-->Admin,2-->Supervisor ,3-->Examiner
if exists(select id from GucianStudent where id=@id union select id from
NonGucianStudent where id=@id )
set @type=0
if exists(select id from Admin where id=@id)
set @type=1
if exists(select id from Supervisor where id=@id)
set @type=2
if exists(select id from Examiner where id=@id)
set @type=3
end
else
set @success=0
end
go

CREATE Proc SupViewProfile2
@supervisorID int
As
if(exists(select * from Supervisor where id=@supervisorID))
begin
select u.id,u.email,u.passwordd,s.namee,s.faculty
from PostGradUser u inner join Supervisor s on u.id=s.id
where s.id=@supervisorID
end

go

create proc AddDefenseGucian2
@ThesisSerialNo int ,
@DefenseDate Datetime , 
@DefenseLocation varchar(15),
@thesisExist bit output,
@duplicate bit output
As
set @thesisExist = 1
set @duplicate=0
if(@ThesisSerialNo in(select serialno from GUCianStudentRegisterThesis))
    if(exists(select SerialNumber,datee from Defense where @ThesisSerialNo=SerialNumber and @DefenseDate=datee))
	    set @duplicate=1
    else
        INSERT INTO Defense(SerialNumber,datee,locationn) VALUES (@ThesisSerialNo,@DefenseDate,@DefenseLocation)
else
	set @thesisExist = 0

go

create proc AddDefenseNonGucian2
@ThesisSerialNo int ,
@DefenseDate Datetime , 
@DefenseLocation varchar(15),
@thesisExist bit output,
@Req bit output,
@duplicate bit output
As
set @thesisExist = 1
set @Req = 1
set @duplicate=0
if (@ThesisSerialNo in(select serialno from NonGUCianStudentRegisterThesis))  
	if(exists(select SerialNumber,datee from Defense where @ThesisSerialNo=SerialNumber and @DefenseDate=datee))
	    set @duplicate=1
    else if(
    50<All(SELECT NGSTC.grade 
           FROM NonGucianStudentTakeCourse NGSTC
                    inner join NonGUCianStudentRegisterThesis NGSRT on NGSTC.s_id=NGSRT.s_id
	       where NGSRT.serialno=@ThesisSerialNo))
		INSERT INTO Defense(SerialNumber,datee,locationn) VALUES (@ThesisSerialNo,@DefenseDate,@DefenseLocation)
	else 
		set @Req = 0
else
	set @thesisExist = 0

go
create proc AddExaminer2
@ThesisSerialNo int ,
@DefenseDate Datetime ,
@Password varchar(20),
@Email varchar(20),
@ExaminerName varchar(20),
@National bit, 
@fieldOfWork varchar(20),
@defenseExist bit output
As
declare @ID int
declare @ID2 int
        
if(exists(select SerialNumber,datee from defense where SerialNumber=@ThesisSerialNo and datee=@DefenseDate))
	BEGIN
		insert into PostGradUser values (@Email,@Password)
       
        Select @ID=max(PGU.id)
        from PostGradUser PGU
        
        INSERT INTO Examiner VALUES (@ID,@ExaminerName,@fieldOfWork,@National)
        
        Select @ID2=max(E.id)
        from Examiner E

        INSERT INTO ExaminerEvaluateDefense(datee,serialNo,ExaminerID) values (@DefenseDate,@ThesisSerialNo,@ID) 
        
        Set @defenseExist=1
    END
else 
	Set @defenseExist=0

go

CREATE PROC EvaluateProgressReport2
@supervisorID int, 
@thesisSerialNo int, 
@progressReportNo int, 
@evaluation int ,
@exist bit output
AS
set @exist=1

if(exists(select thesisSerialNumber,noo,supid from GUCianProgressReport where @thesisSerialNo =thesisSerialNumber and @progressReportNo=noo and @supervisorID=supid ))
    UPDATE GUCianProgressReport  set eval=@evaluation 
    where @supervisorID=GUCianProgressReport.supid 
      and @thesisSerialNo =GUCianProgressReport.thesisSerialNumber 
      and @progressReportNo=GUCianProgressReport.noo
else if(exists(select thesisSerialNumber,noo from NonGUCianProgressReport where @thesisSerialNo =thesisSerialNumber and @progressReportNo=noo and @supervisorID=supid   ))
    UPDATE NonGUCianProgressReport  set eval=@evaluation 
    where @supervisorID=NonGUCianProgressReport.supid 
      and @thesisSerialNo =NonGUCianProgressReport.thesisSerialNumber
      and @progressReportNo=NonGUCianProgressReport.noo
else
    set @exist=0

go


create proc CancelThesis2	
@ThesisSerialNo int ,
@exist bit output,
@req bit output
As
set @exist=1
set @req=1
declare @eval int
declare @noo int
if(@ThesisSerialNo in(select serialno from GUCianStudentRegisterThesis))
	begin
        select  @noo=max(GPR.noo)
        from GucianProgressReport GPR 
        where GPR.thesisSerialNumber=@ThesisSerialNo 
        
        select  @eval=GPR.eval
        from GucianProgressReport GPR 
        where GPR.thesisSerialNumber=@ThesisSerialNo and GPR.noo=@noo

        if(@eval=0)
            delete from Thesis where SerialNumber=@ThesisSerialNo
        else
            set @req=0
    end
else if(@ThesisSerialNo in(select serialno from NonGUCianStudentRegisterThesis))
    begin
        select  @noo=max(NGPR.noo)
        from NonGucianProgressReport NGPR 
        where NGPR.thesisSerialNumber=@ThesisSerialNo 
        
        select  @eval=NGPR.eval
        from NonGucianProgressReport NGPR 
        where NGPR.thesisSerialNumber=@ThesisSerialNo and NGPR.noo=@noo

        if(@eval=0)
            delete from Thesis where SerialNumber=@ThesisSerialNo
        else
           set @req=0
    end
else
	set @exist=0

go

Create proc updateExaminer
@id int, @name varchar(20) , @field varchar(100)
as
update Examiner 
set namee = @name ,    FieldOfWork = @field
where id =@id

go
Create proc updateExaminer2
@id int, @name varchar(20)
as
update Examiner 
set namee = @name 
where id =@id

go
Create proc updateExaminer3
@id int, @field varchar(100)
as
update Examiner 
set FieldOfWork = @field
where id =@id


go
-- add grade for defense
create proc AddDefenseGrade2
@id int, @ThesisSerialNo int , @DefenseDate Datetime , @grade decimal(4,2), @flag int output
as
if (exists(select ExaminerID from ExaminerEvaluateDefense where @ThesisSerialNo = serialNo and @id = ExaminerID 
and @DefenseDate = datee))
begin
update Defense
set grade = @grade
where SerialNumber = @ThesisSerialNo and datee = @DefenseDate
set @flag=1
end
else
set @flag = 0




-- add comments for defense
go
create proc AddDefenseComment2
@id int, @ThesisSerialNo int , @DefenseDate Datetime , @comments varchar(300), @flag int output
as
if (exists(select ExaminerID from ExaminerEvaluateDefense where @ThesisSerialNo = serialNo and @id = ExaminerID 
and @DefenseDate = datee))
begin
	update ExaminerEvaluateDefense
	set comment = @comments
	where serialNo = @ThesisSerialNo and datee = @DefenseDate
	set @flag = 1
end
else
	set @flag = 0


go
-- print stuff
create proc viewDefenses
@id INT
as 
select t.title, (gs.firstName+ ' ' + gs.lastname) as Student, sup.namee as Supervisor
from Examiner e INNER JOIN ExaminerEvaluateDefense eed on e.id = eed.ExaminerID inner join Thesis t on eed.serialNo = t.SerialNumber
INNER JOIN Defense d on d.SerialNumber = t.SerialNumber inner join GUCianStudentRegisterThesis g on g.serialno = t.SerialNumber inner join GUCianstudent gs on gs.id = g.s_id
INNER JOIN supervisor sup on  g.sup_id = sup.id
WHERE e.id = @id 
UNION
select t.title, (gs.firstName + gs.lastname) as Student, sup.namee
from Examiner e INNER JOIN ExaminerEvaluateDefense eed on e.id = eed.ExaminerID inner join Thesis t on eed.serialNo = t.SerialNumber
INNER JOIN Defense d on d.SerialNumber = t.SerialNumber inner join NonGUCianStudentRegisterThesis g on g.serialno = t.SerialNumber inner join NONGUCIANstudent gs on gs.id = g.s_id
INNER JOIN supervisor sup on  g.sup_id =sup.id
WHERE e.id = @id 


go

-- search for thesis
Create proc searchThesis
@name VARCHAR(25)
as 
SELECT title
from Thesis
WHERE title like '%'+@name + '%'


go

CREATE PROC getpublicationid
@PubID int output
as
declare @id int
select @id=max(id) from publication 
set @PubID=@id

go
create proc AddProgressReport2
@thesisSerialNo int, @progressReportDate date, @studentID
int,@progressReportNo int
as
declare @gucian int
declare @supid int

if(exists(
select id
from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
select @supid=sup_id from GUCianStudentRegisterThesis where @studentID=s_id and @thesisSerialNo=serialno
insert into GUCianProgressReport (sidd,noo,datee,thesisSerialNumber,supid)  values(@studentID,@progressReportNo,@progressReportDate,@thesisSerialNo,@supid)
end
else
begin
select @supid=sup_id from NonGUCianStudentRegisterThesis where @studentID=s_id and @thesisSerialNo=serialno
insert into NonGUCianProgressReport (sidd,noo,datee,thesisSerialNumber,supid)  values(@studentID,@progressReportNo,@progressReportDate,@thesisSerialNo,@supid)
end

go

create proc FillProgressReport2
@thesisSerialNo int, @progressReportNo int, @state int, @description varchar(200),@studentID int
as
declare @gucian bit
if(exists(
select * from GucianStudent
where id = @studentID
))
begin
set @gucian = '1'
end
else
begin
set @gucian = '0'
end
if(@gucian = '1')
begin
update GUCianProgressReport
set statee = @state, descriptionn = @description, datee = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sidd = @studentID and noo =
@progressReportNo
end
else
begin
update NonGUCianProgressReport
set statee = @state, descriptionn = @description, datee = CURRENT_TIMESTAMP
where thesisSerialNumber = @thesisSerialNo and sidd = @studentID and noo =
@progressReportNo
end



GO

CREATE PROC  getCoursesinfo
@studentId int 
AS 
SELECT * FROM 
NonGucianStudentTakeCourse inner join course 
on NonGucianStudentTakeCourse.c_id=course.id
where s_id = @studentId;
go 
CREATE PROC getallthesis
@id int
As
if(exists(SELECT id FROM  GUCianStudent where @id=id))
begin
SELECT T.title FROM 
Thesis T INNER JOIN GUCianStudentRegisterThesis NGSR on 
T.SerialNumber=NGSR.serialno
WHERE NGSR.s_id=@id
end
else
SELECT T.title FROM 
Thesis T INNER JOIN NonGUCianStudentRegisterThesis NGSR on 
T.SerialNumber=NGSR.serialno
WHERE NGSR.s_id=@id

go

CREATE PROC AdminUpdateExtension2
@ThesisSerialNo int,
@Success bit output
AS
DECLARE @Extension int
select @Extension = T.noExtension
from Thesis T where T.SerialNumber = @ThesisSerialNo
SET @Extension = @Extension + 1
Update Thesis 
SET noExtension = @Extension
where SerialNumber = @ThesisSerialNo
if (Exists(select * from Thesis T where T.SerialNumber = @ThesisSerialNo))
    Begin
        SET @Success = 1
    END
else
    Begin
        SET @Success = 0
    END

    GO

CREATE PROC AdminIssueThesisPayment2
@ThesisSerialNo int,
@amount decimal,
@noOfInstallments int,
@fundPercentage decimal,
@Success bit output
AS
Declare @ID int
INSERT INTO Payment (amount, no_installments, fundPercentage) VALUES (@amount, @noOfInstallments, @fundPercentage)        
Select @ID=max(P.id)
from Payment P
update Thesis set payment_id=@ID where SerialNumber=@ThesisSerialNo
if (Exists( select * from Thesis T where T.SerialNumber = @ThesisSerialNo))
    Begin
        SET @Success = 1
    END
else
    BEGIN
        SET @Success = 0
    END

 

GO


CREATE Proc AdminIssueInstallPayment2
@paymentID int,
@InstallStartDate date,
@Success bit output
AS
if(exists(select * from Payment where id=@paymentID))
begin
declare @numOfInst int
select @numOfInst=no_installments
from Payment
where id=@paymentID
declare @payAmount int
select @payAmount=amount
from Payment
where id=@paymentID
DECLARE @Counter INT
SET @Counter=1
WHILE (@counter<=@numOfInst)
BEGIN
declare @instdate date
set @instdate=@InstallStartDate
declare @instAmount int
set @instAmount=@payAmount/@numOfInst
if(@counter=1)
insert into
Installment(datee,paymentId,amount,done)values(@InstallStartDate,@paymentID
,@instAmount,0)
else
begin
set @instdate=DATEADD(MM, 6, @instdate);
insert into
Installment(datee,paymentId,amount,done)values(@instdate,@paymentID,@instAmount,0)
end
SET @counter=@counter+1
END
end
If (Exists(select * from Payment P where P.id = @paymentID))
    BEGIN
        SET @Success = 1
    END
else
    BEGIN
        SET @Success = 0
    END
