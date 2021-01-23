
accepted		pending			applied
0				0				0			ask
0				0				1			rejected
0				1				0			ask
0				1				1			pending
1				0				0			ask
1				0				1			accepted
1				1				0			ask
1				1				1			pending


--Creation of tables in HOHKDB.mdf
CREATE TABLE AdminTable (AdminId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (AdminId));
CREATE TABLE CategoryTable (CategoryId int IDENTITY NOT NULL, CategoryName varchar(255) NULL, PRIMARY KEY (CategoryId));
CREATE TABLE CertificationTable (CertificateId int IDENTITY NOT NULL, HKId int NOT NULL, CertificateName varchar(255) NULL, PRIMARY KEY (CertificateId));
CREATE TABLE HKJobAssociativeTable (HKJobId int IDENTITY NOT NULL, JobId int NOT NULL, HKId int NOT NULL, Applied bit NULL, Pending bit NULL, Accepted bit NULL, Rating int DEFAULT 0 NULL, PRIMARY KEY (HKJobId));
CREATE TABLE HouseKeeperTable (HKId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (HKId));
CREATE TABLE HouseOwnerTable (HOId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (HOId));
CREATE TABLE JobCategoryAssociativeTable (JobCategoryId int IDENTITY NOT NULL, JobId int NOT NULL, CategoryId int NOT NULL, PRIMARY KEY (JobCategoryId));
CREATE TABLE JobLocationAssociativeTable (JobLocationId int IDENTITY NOT NULL, JobId int NOT NULL, LocationId int NOT NULL, PRIMARY KEY (JobLocationId));
CREATE TABLE JobTable (JobId int IDENTITY NOT NULL, HOId int NOT NULL, Title varchar(255) NULL, Salary varchar(255) NULL, Description varchar(255) NULL, DatePosted date NULL, DeadlineDate date NULL, Vacant bit NULL, PRIMARY KEY (JobId));
CREATE TABLE LocationTable (LocationId int IDENTITY NOT NULL, LocationName varchar(255) NULL, PRIMARY KEY (LocationId));
ALTER TABLE JobTable ADD CONSTRAINT FKJobTable771792 FOREIGN KEY (HOId) REFERENCES HouseOwnerTable (HOId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE HKJobAssociativeTable ADD CONSTRAINT FKHKJobAssoc564106 FOREIGN KEY (JobId) REFERENCES JobTable (JobId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE HKJobAssociativeTable ADD CONSTRAINT FKHKJobAssoc769404 FOREIGN KEY (HKId) REFERENCES HouseKeeperTable (HKId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE CertificationTable ADD CONSTRAINT FKCertificat165829 FOREIGN KEY (HKId) REFERENCES HouseKeeperTable (HKId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobLocationAssociativeTable ADD CONSTRAINT FKJobLocatio272303 FOREIGN KEY (JobId) REFERENCES JobTable (JobId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobLocationAssociativeTable ADD CONSTRAINT FKJobLocatio643065 FOREIGN KEY (LocationId) REFERENCES LocationTable (LocationId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobCategoryAssociativeTable ADD CONSTRAINT FKJobCategor688377 FOREIGN KEY (JobId) REFERENCES JobTable (JobId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobCategoryAssociativeTable ADD CONSTRAINT FKJobCategor877825 FOREIGN KEY (CategoryId) REFERENCES CategoryTable (CategoryId) ON UPDATE Cascade ON DELETE Cascade;



--Types
CREATE TYPE TypeCategoryAssociativeTable AS TABLE(JobId int, CategoryId INT);



--Procedures
---------------
CREATE PROCEDURE ProcedureCategoryNameExists
	@CategoryName varchar(255)
AS
Begin
	Declare @Count int

	SELECT @Count=Count(CategoryName) from CategoryTable where CategoryName=@CategoryName

	 If @Count > 0
        Select 1 as CategoryNameExists
     Else
        Select 0 as CategoryNameExists
End

---------------
CREATE PROCEDURE ProcedureLocationNameExists
	@LocationName varchar(255)
AS
Begin
	Declare @Count int

	SELECT @Count=Count(LocationName) from LocationTable where LocationName=@LocationName

	 If @Count > 0
        Select 1 as LocationNameExists
     Else
        Select 0 as LocationNameExists
End

---------------
CREATE PROCEDURE ProcedureGetAllJobs
AS
Begin
	select distinct
	jobtable.JobId,
	jobtable.Title,
	jobtable.Salary,
	jobtable.Description,
	jobtable.DatePosted,
	jobtable.DeadlineDate,
	jobtable.Vacant,
	HouseOwnerTable.UserName
	from jobtable
	inner join HouseOwnerTable on HouseOwnerTable.HOId=jobtable.HOId
end

---------------
CREATE PROCEDURE ProcedureGetHOJobsList
	@Hoid int
AS
Begin
	select distinct
	jobtable.JobId,
	jobtable.Title,
	jobtable.Salary,
	jobtable.DatePosted,
	jobtable.DeadlineDate,
	jobtable.Vacant,
	LocationTable.LocationName
	from jobtable
	inner join jobLocationAssociativeTable on jobLocationAssociativeTable.jobId=jobtable.jobId
	inner join LocationTable on LocationTable.LocationId=jobLocationAssociativeTable.LocationId
	where jobtable.HOId=@Hoid;	
end

---------------
CREATE PROCEDURE ProcedureUpdateJobAndLocationAssociativeAndCategoryAssociative
	@TypeCategoryAssociativeTable TypeCategoryAssociativeTable Readonly,
	@JobId int,
	@Title varchar(255),
	@Salary varchar(255),
	@Description varchar(255),
	@DatePosted varchar(255),
	@DeadlineDate varchar(255),
	@Vacant varchar(255),
	@LocationId int
AS
Begin
	delete from JobCategoryAssociativeTable where JobId=@JobId;
	update JobTable set 
		Title=@Title,
		Salary=@Salary,
		Description=@Description,
		DatePosted=@DatePosted,
		DeadlineDate=@DeadlineDate,
		Vacant=@Vacant
	where JobId=@JobId;
	insert into JobCategoryAssociativeTable(JobId,CategoryId)
	(select JobId,CategoryId from @TypeCategoryAssociativeTable);
	update JobLocationAssociativeTable set
		LocationId=@LocationId
	where JobId=@JobId;
End

---------------
CREATE PROCEDURE ProcedureInsertJob
	@TypeCategoryAssociativeTable TypeCategoryAssociativeTable Readonly,
	@HOId int,
	@Title varchar(255),
	@Salary varchar(255),
	@Description varchar(255),
	@DatePosted DateTime,
	@DeadlineDate DateTime
AS
Begin
	declare @lastJobIdInserted int
	insert into jobTable(HOId, Title, Salary, Description, DatePosted, DeadlineDate, Vacant)
	values ( @HOId,  @Title, @Salary, @Description, @DatePosted, @DeadlineDate,1);
	SET @lastJobIdInserted = SCOPE_IDENTITY();
	RETURN @lastJobIdInserted
End

---------------
CREATE PROCEDURE ProcedureLocationAssociativeAndCategoryAssociative
	@TypeCategoryAssociativeTable TypeCategoryAssociativeTable Readonly,
	@JobId int,
	@LocationId int
AS
Begin
	insert into JobCategoryAssociativeTable(JobId,CategoryId) (select JobId,CategoryId from @TypeCategoryAssociativeTable);
	insert into JobLocationAssociativeTable(JobId,LocationId) VALUES ( @JobId,@LocationId) ;
End

---------------
CREATE PROCEDURE ProcedureCheckHKStats
  @JobId int
as
begin
  declare @TotalHK int
  declare @TotalHKRej int
  declare @TotalHKPend int
  declare @temp table(
    TotalHKInJob int,
    TotalHKInJobPending int,
    TotalHKInJobRejected int
  )
  select @TotalHK=count(*) from HouseKeeperTable
    Inner join HKJobAssociativeTable On HKJobAssociativeTable.HKId = HouseKeeperTable.HKid
    INNER JOIN JobTable ON JobTable.JobId=HKJobAssociativeTable.JobId
  where  JobTable.JobId=@JobId

  select @TotalHKPend=count(*) from HouseKeeperTable
    Inner join HKJobAssociativeTable On HKJobAssociativeTable.HKId = HouseKeeperTable.HKId
    INNER JOIN JobTable ON JobTable.JobId=HKJobAssociativeTable.JobId
  where  JobTable.JobId=@JobId and HKJobAssociativeTable.Pending=1

  select @TotalHKRej=count(*) from HouseKeeperTable
    Inner join HKJobAssociativeTable On HKJobAssociativeTable.HKId = HouseKeeperTable.HKId
    INNER JOIN JobTable ON JobTable.JobId=HKJobAssociativeTable.JobId
  where  JobTable.JobId=@JobId and HKJobAssociativeTable.Applied=1 and HKJobAssociativeTable.Pending=0 and HKJobAssociativeTable.Accepted=0

  insert into @temp values (@TotalHK, @TotalHKPend, @TotalHKRej)

  Select * from @temp
end

---------------
CREATE PROCEDURE ProcedureCertNameExists
	@HKId int,
	@CertificateName varchar(255)
AS
Begin
	Declare @Count int

	SELECT @Count=Count(CertificateName) from CertificationTable where CertificateName=@CertificateName and HKId=@HKId

	 If @Count > 0
          Select 1 as certificateNameInUse
     Else
          Select 0 as certificateNameInUse
End

---------------
CREATE procedure ProcedureCheckHKStatsPerJob
@HKId int,
@JobId int
as 
begin
SELECT
HKJobAssociativeTable.Pending,
HKJobAssociativeTable.Applied,
HKJobAssociativeTable.Accepted
FROM HKJobAssociativeTable
inner join HouseKeeperTable on HKJobAssociativeTable.HKId=HouseKeeperTable.HKId
where HKJobAssociativeTable.HKId=@HKId and 
HKJobAssociativeTable.JobId=@JobId
end

-------------
CREATE PROCEDURE ProcedureUserNameExists
	@UserName varchar(255)
AS
Begin
	Declare @Count int

	SELECT @Count=Count(UserName) from HouseKeeperTable where UserName=@UserName

	 If @Count > 0
          Select 1 as userNameInUse
     Else
		SELECT @Count=Count(UserName) from HouseOwnerTable where UserName=@UserName
		If @Count > 0
          Select 1 as userNameInUse
		else
          Select 0 as userNameInUse
End

