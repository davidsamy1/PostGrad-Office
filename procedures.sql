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
