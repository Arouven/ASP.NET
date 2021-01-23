--create the database
CREATE DATABASE TeacherStudentDB;

--creating tables
CREATE TABLE AdminTable (AdminId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (AdminId));
CREATE TABLE CategoryAssociativeTable (CategoryCourseId int IDENTITY NOT NULL, CourseId int NOT NULL, CategoryId int NOT NULL, PRIMARY KEY (CategoryCourseId));
CREATE TABLE CategoryTable (CategoryId int IDENTITY NOT NULL, CategoryName varchar(255) NULL, PRIMARY KEY (CategoryId));
CREATE TABLE CertificationTable (CertificationId int IDENTITY NOT NULL, TutorId int NOT NULL, CertificationName varchar(255) NOT NULL, PRIMARY KEY (CertificationId));
CREATE TABLE CourseTable (CourseId int IDENTITY NOT NULL, TutorId int NOT NULL, CourseName varchar(255) NULL, DateSchedule datetime NULL, DateCreated date NULL, CourseDescription varchar(255) NULL, AimsAndObjectives varchar(255) NULL, PRIMARY KEY (CourseId));
CREATE TABLE EventTable (EventId int IDENTITY NOT NULL, TutorId int NOT NULL, EventName varchar(255) NULL, EventDetail varchar(255) NULL, Location varchar(255) NULL, PRIMARY KEY (EventId));
CREATE TABLE MaterialAssociativeTable (MaterialId int IDENTITY NOT NULL, CourseId int NOT NULL, MaterialTypeId int NOT NULL, PRIMARY KEY (MaterialId));
CREATE TABLE MaterialTypeTable (MaterialTypeId int IDENTITY NOT NULL, MaterialTypeName varchar(255) NULL, PRIMARY KEY (MaterialTypeId));
CREATE TABLE StudentCourseAssociativeTable (StudentCourseId int IDENTITY NOT NULL, StudentId int NOT NULL, CourseId int NOT NULL, Subscribe bit NULL, PRIMARY KEY (StudentCourseId));
CREATE TABLE StudentTable (StudentId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (StudentId));
CREATE TABLE TutorTable (TutorId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (TutorId));
--Adding constraints
ALTER TABLE CourseTable ADD CONSTRAINT FKCourseTabl693115 FOREIGN KEY (TutorId) REFERENCES TutorTable (TutorId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE StudentCourseAssociativeTable ADD CONSTRAINT FKStudentCou222856 FOREIGN KEY (StudentId) REFERENCES StudentTable (StudentId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE StudentCourseAssociativeTable ADD CONSTRAINT FKStudentCou373222 FOREIGN KEY (CourseId) REFERENCES CourseTable (CourseId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE MaterialAssociativeTable ADD CONSTRAINT FKMaterialAs405260 FOREIGN KEY (CourseId) REFERENCES CourseTable (CourseId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE MaterialAssociativeTable ADD CONSTRAINT FKMaterialAs671839 FOREIGN KEY (MaterialTypeId) REFERENCES MaterialTypeTable (MaterialTypeId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE EventTable ADD CONSTRAINT FKEventTable286585 FOREIGN KEY (TutorId) REFERENCES TutorTable (TutorId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE CertificationTable ADD CONSTRAINT FKCertificat925974 FOREIGN KEY (TutorId) REFERENCES TutorTable (TutorId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE CategoryAssociativeTable ADD CONSTRAINT FKCategoryAs504842 FOREIGN KEY (CourseId) REFERENCES CourseTable (CourseId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE CategoryAssociativeTable ADD CONSTRAINT FKCategoryAs16812 FOREIGN KEY (CategoryId) REFERENCES CategoryTable (CategoryId) ON UPDATE Cascade ON DELETE Cascade;

--inserting records
INSERT INTO AdminTable([FirstName],[LastName],[ProfilePictureUrl],[Address],[BirthDate],[PhoneNumber],[Email],[UserName],[Password],[Freeze]) VALUES ('Leila','Mendez','1.png','LO','2000/09/09',51793939,'convallis.est.vitae@aliquetmagnaa.net','Leila','Carolyn',0),('Juliet','Combs','2.png','Provence-Alpes-Côte d''Azur','1985/02/27',59724366,'Vivamus@nonummyac.ca','Juliet','Alvin',0),('Hilel','Joyce','3.png','CO','1999/02/11',51670073,'magnis@facilisisSuspendisse.com','Hilel','Tyler',0),('Jason','Patterson','4.png','CH','1994/11/23',53801424,'mi.Duis@DuisgravidaPraesent.co.uk','Jason','Bernard',0),('Dalton','Schmidt','5.png','Midi-Pyrénées','2001/06/08',57319175,'ut.mi@sedpede.org','Dalton','Risa',0),('Yasir','Hess','6.png','PO','1993/03/19',53057965,'leo.in.lobortis@sagittisDuisgravida.com','Yasir','Abbot',0);
INSERT INTO CategoryTable([CategoryName]) VALUES ('Networking'),('Database'),('Web'),('Programming'),('Artificial Inteligence');
INSERT INTO StudentTable([FirstName],[LastName],[ProfilePictureUrl],[Address],[BirthDate],[PhoneNumber],[Email],[UserName],[Password],[Freeze]) VALUES ('Raja','Uma','6.png','327-5324 Elit, Avenue','2005/07/22',30714825,'fames.ac.turpis@mollis.net','Brian','Madison','1'),('Lydia','Eagan','7.png','1110 Nunc. Street','2004/02/06',23560348,'et.eros@loremDonec.org','Emmanuel','Margaret','0'),('Hermione','Mannix','8.png','4362 Diam Rd.','1999/08/23',47942886,'imperdiet.non@utmiDuis.com','Debra','Sebastian','0'),('Talon','Shelby','9.png','Ap #673-5399 Sed St.','2000/08/13',42365515,'luctus.sit.amet@Donecconsectetuer.edu','Fletcher','Wanda','0'),('Hayes','Oleg','10.png','P.O. Box 122, 3568 Pede. Av.','2000/01/27',41093984,'magna@loremloremluctus.edu','Cedric','Otto','1'),('Elizabeth','Raven','11.png','7509 Urna. Rd.','1999/08/01',34461330,'nibh@dignissimmagnaa.co.uk','Sophia','Mari','0'),('Keane','Lane','12.png','Ap #134-601 Consequat Street','2003/02/27',58275032,'Fusce@nuncsed.ca','Jane','Bryar','0'),('Lester','Mariam','13.png','9842 Urna Street','2006/06/20',45785247,'vel@nonhendreritid.ca','Ray','Reuben','1'),('Nichole','Jonah','14.png','8269 A, St.','2004/12/14',27461413,'nec@arcu.co.uk','Keelie','Paki','1'),('Acton','Colton','15.png','P.O. Box 260, 9301 Gravida Road','2006/02/15',79051445,'hendrerit.consectetuer@tempusrisus.ca','Sean','Lionel','1'),('Germane','Omar','16.png','4378 Eros. Ave','2005/10/21',20006980,'eros@risusDuisa.edu','Gretchen','Sacha','1'),('Raven','Nevada','17.png','733-2679 Curae; Rd.','2005/02/13',69793815,'eu.dui.Cum@ridiculus.ca','Kaitlin','Ryder','1'),('Calvin','Ina','18.png','862-1884 Tellus Av.','2004/11/07',70438914,'blandit.viverra.Donec@Nuncsollicitudin.co.uk','Lydia','Illana','0'),('Heather','Wyoming','19.png','844-7614 Eu, Avenue','2001/06/23',33188642,'sodales.purus.in@arcuNuncmauris.co.uk','Isadora','Anastasia','0'),('Geoffrey','Quamar','20.png','241-8602 Imperdiet Road','2003/05/27',74686559,'arcu.Aliquam.ultrices@libero.co.uk','Beverly','Tatyana','0'),('Fiona','Joy','21,.png','491-7712 Parturient St.','2003/03/06',20054779,'mus.Aenean@Integer.org','Leigh','Alma','0'),('Emery','Elijah','22.png','Ap #868-2641 Vitae, Av.','2001/03/02',26431279,'massa.lobortis@ornaretortor.com','Colleen','Eden','1'),('Whilemina','Ezekiel','23.png','P.O. Box 312, 4550 Nam Av.','2002/05/12',25241029,'eu.eleifend.nec@Proinvel.ca','Cara','Ahmed','1'),('Tyrone','Russell','24.png','Ap #417-8496 Aliquam Rd.','2004/07/19',31334609,'aliquam.arcu@felis.ca','Melodie','Alec','1'),('Camden','Ivy','25.png','2456 Odio Road','2002/03/24',96706716,'Nulla@aliquetdiam.ca','Cairo','Brynne','0'),('Veronica','Merrill','26.png','100 Sem Rd.','2004/10/17',95269582,'sit.amet.risus@Sed.ca','Genevieve','Dean','0'),('Reuben','Kendall','27.png','Ap #885-6002 Malesuada Av.','2002/12/22',19987088,'lectus@VivamusrhoncusDonec.edu','Doris','Wyoming','1'),('Miranda','Imogene','28.png','1028 Ante Avenue','2004/02/05',44230637,'fermentum@ligulaNullam.net','Ella','Cairo','0'),('Malachi','Nero','29.png','Ap #222-628 Eget Av.','2000/02/01',39264196,'ac@aliquetdiam.edu','Noelani','Bo','1'),('Tashya','Rhona','30.png','Ap #375-463 Quisque St.','2004/02/04',64210009,'velit@pede.edu','Jakeem','Martin','0');
INSERT INTO TutorTable([FirstName],[LastName],[ProfilePictureUrl],[Address],[BirthDate],[PhoneNumber],[Email],[UserName],[Password],[Freeze]) VALUES ('Harrison','Riley','31.png','2549 Velit Road','2000/12/26',45611516,'elit@placerategetvenenatis.co.uk','Blaine','Gemma','1'),('Hillary','Thor','32.png','4808 Fringilla Street','2004/08/01',79697628,'Proin.velit.Sed@adipiscingelitAliquam.net','Aquila','Claire','0'),('Eric','Fletcher','33.png','3466 Sed Av.','2004/11/08',70973683,'est.Nunc@lacusCras.net','Nathaniel','Cole','1'),('Colin','Leah','34.png','Ap #677-8088 Sapien Rd.','2002/07/20',60159829,'metus.vitae@vitaemaurissit.com','Harper','Cameran','1'),('Odysseus','Walter','35.png','6536 Donec Rd.','2003/01/21',76842568,'ac@imperdietnon.org','Germaine','Micah','1'),('Kane','Kerry','36.png','P.O. Box 308, 3548 At, Rd.','2006/05/23',29724643,'magna@ac.com','Aquil','Leah','1'),('Alvin','Kane','37.png','P.O. Box 594, 9198 Vestibulum, Street','2006/03/07',69252689,'Donec.at.arcu@adlitora.org','Eagan','Noah','1'),('Calvin','Irma','38.png','Ap #799-9201 Libero Ave','2001/05/23',62324235,'eu.arcu.Morbi@consectetueradipiscing.edu','Acton','Upton','1'),('Marcia','Mason','39.png','3570 Fermentum St.','2000/06/02',85033474,'sit.amet@Maurismagna.net','Molly','Ann','0'),('Carla','Blossom','40.png','P.O. Box 220, 8662 Metus. Av.','2003/01/23',15797940,'commodo@lorem.org','Boris','Zenia','0'),('Yasir','Gannon','41.png','P.O. Box 514, 336 Sollicitudin Rd.','2002/06/07',70160670,'et.magnis@nislQuisque.com','Joseph','Lucius','0'),('Clayton','Fiona','42.png','Ap #385-314 Enim. Av.','2006/01/16',93498538,'mauris@penatibuset.com','Yardley','Shaine','0'),('Tarik','Marcia','43.png','Ap #965-8491 In Street','2005/06/19',22058391,'Nulla.eget@vitaesodalesnisi.net','Laith','Cheryl','0'),('Mary','Zenaida','44.png','5567 Donec St.','2000/08/20',64260363,'Cras@dictum.edu','Farrah','Jenna','0'),('Aurelia','Shaeleigh','45.png','P.O. Box 865, 7044 Et St.','2005/06/16',53957632,'at.nisi.Cum@natoque.co.uk','Fatima','Serena','0'),('Mikayla','Jasper','46.png','P.O. Box 734, 7801 Amet Rd.','2006/04/07',16992288,'lacus@nisiCum.net','Phyllis','Eaton','1'),('Rose','Mollie','47.png','Ap #997-6158 Velit St.','2004/03/17',55164378,'magna.Ut.tincidunt@volutpatNullafacilisis.com','Prescott','Cairo','1'),('Conan','Nissim','48.png','719-6711 Libero St.','1999/08/02',58080002,'Curabitur.massa.Vestibulum@Aliquamrutrum.ca','Judah','Cecilia','0'),('Amethyst','Brenda','49.png','842-8077 Habitant St.','2003/06/07',25820841,'at.pretium@nullaat.co.uk','Chase','Wyoming','1'),('Aurora','Bertha','50.png','Ap #662-386 Maecenas Rd.','2005/11/07',76971805,'Integer.eu.lacus@etnunc.co.uk','Allistair','Quon','0'),('Harrison','Dillon','51.png','370-6435 Consectetuer Rd.','2005/11/27',44964546,'dictum.eleifend.nunc@tincidunttempus.net','Gareth','Stella','0'),('Xander','Joseph','52.png','Ap #160-3426 Convallis Rd.','2001/06/30',58772232,'tristique.senectus@vitae.com','Boris','Zephr','0'),('Scarlet','Upton','53.png','Ap #511-6467 Posuere Ave','2001/07/02',96803853,'nulla.vulputate@ipsum.net','Frances','Lisandra','0'),('Darius','Alden','54.png','8886 Sagittis Ave','2004/06/29',78761372,'quam.dignissim.pharetra@Integermollis.co.uk','Simon','Castor','0'),('Wilma','Fiona','55.png','Ap #903-8131 Et Street','2004/03/07',87076609,'Etiam.ligula@arcuNunc.ca','Vance','Slade','1');
INSERT INTO MaterialTypeTable([MaterialTypeName]) VALUES ('Assignment'), ('Notes'), ('Links');
INSERT INTO CertificationTable([TutorId], [CertificationName]) VALUES ( 1, 'Microsoft'),( 1, 'Cisco'),( 2, 'Cisco'),( 2, 'Juniper'),( 3, 'degree'),( 4, 'Master'),( 5, 'Master');
INSERT INTO CourseTable([TutorId], [CourseName], [DateSchedule], [DateCreated], [CourseDescription]) VALUES (1, 'Primary Keys', '1993/03/19', '1993/03/10', 'Learn how and when to use primary keys'), (2, 'Primary Keys', '1993/03/19', '1993/03/18', 'Learn how to create PK & FK'), (3, 'all html tags', '2003/04/19', '2003/03/19', 'Learn how to use html tags'), (4, 'Switches', '2013/03/19', '2013/03/18', 'Configure vlans'), (5, 'Python', '2020/03/19', '2020/03/18', 'Global and local variables'), (5, 'Chat Robot', '2020/03/20', '2020/03/18', 'Build an artificial intelligence that will chat to student in the place of lecturers.');
INSERT INTO CategoryAssociativeTable([CourseId],[CategoryId]) VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
INSERT INTO EventTable([TutorId], [EventName], [EventDetail], [Location]) VALUES (2, 'coffee coding', 'We will meet at our coffee shop for coding!', 'Bon cafe'), (2, 'Seminar', 'We will meet for a seminar - AI talk!', 'Seminar hall');
INSERT INTO StudentCourseAssociativeTable([StudentId], [CourseId], [Subscribe]) VALUES (1,1,1), (2,1,1), (3,1,1), (4,1,1), (5,1,1), (6,1,1), (7,1,1), (8,1,1), (9,1,1), (10,1,1), (11,1,1), (12,1,1), (13,1,1), (14,1,1), (15,1,1), (16,1,1), (13,2,1), (14,2,1), (15,2,1), (16,2,0);
INSERT INTO MaterialAssaociativeTable([CourseId], [MaterialTypeId]) VALUES (1,1), (2,2), (3,3), (4,1), (6,2), (6,2);



--Adding Procedures
--check names exist
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
--
CREATE PROCEDURE ProcedureMaterialNameExists
	@MaterialName varchar(255)
AS
Begin
	Declare @Count int

	SELECT @Count=Count(MaterialTypeName) from MaterialTypeTable where MaterialTypeName=@MaterialName

	 If @Count > 0
          Select 1 as MaterialNameExists
     Else
          Select 0 as MaterialNameExists
End
CREATE PROCEDURE ProcedureUpdateMaterialTypeTable
	@MaterialTypeName varchar(255),
	@MaterialTypeId int
AS
Begin
	update MaterialTypeTable set MaterialTypeName=@MaterialTypeName where MaterialTypeId=@MaterialTypeId;
End




CREATE PROCEDURE ProcedureInsertCourse
	@TutorId int,
	@CourseName varchar(255),
	@DateSchedule DateTime,
	@DateCreated DateTime,
	@CourseDescription varchar(255),
	@AimsAndObjectives varchar(255)
AS
Begin
	declare @lastCourseIdInserted int
	insert into CourseTable( TutorId, CourseName, DateSchedule, DateCreated, CourseDescription, AimsAndObjectives) values (@TutorId, @CourseName, @DateSchedule, @DateCreated, @CourseDescription, @AimsAndObjectives);
	SET @lastCourseIdInserted = SCOPE_IDENTITY();
	RETURN @lastCourseIdInserted
End
CREATE TYPE TypeCategoryAssociativeTable AS TABLE
( 
 CourseId int,
 CategoryId INT 
)

CREATE TYPE TypeMaterialAssociativeeTable AS TABLE
( 
CourseId int,
MaterialTypeId int,
MaterialPathUrl varchar(255),
MaterialName varchar(255)
)
CREATE PROCEDURE ProcedureMaterialAssociativeCategoryAssociative
	@TypeMaterialAssociativeTable TypeMaterialAssociativeTable Readonly,
	@TypeCategoryAssociativeTable TypeCategoryAssociativeTable Readonly
AS
Begin
	insert into MaterialAssociativeTable(CourseId,MaterialTypeId,MaterialPathUrl,MaterialName) (select CourseId,MaterialTypeId,MaterialPathUrl,MaterialName from @TypeMaterialAssociativeTable);
	insert into CategoryAssociativeTable(CourseId,CategoryId)
	(select CourseId,CategoryId from @TypeCategoryAssociativeTable);
End


alter PROCEDURE ProcedureGetTutorCoursesList
	@tutorid int
AS
Begin

select distinct
coursetable.courseId,
coursetable.TutorId,
coursetable.CourseName,
coursetable.DateCreated,
coursetable.DateSchedule
from coursetable
where coursetable.TutorId=@tutorid
	
	end

CREATE PROCEDURE ProcedureUpdateCourseAndCategoryAssociative
	@TypeCategoryAssociativeTable TypeCategoryAssociativeTable Readonly,
	@CourseId int,
	@CourseName varchar(255),
	@DateSchedule varchar(255),
	@CourseDescription varchar(255),
	@AimsAndObjectives varchar(255)
AS
Begin
	delete from CategoryAssociativeTable where CourseId=@CourseId;
	update CourseTable set CourseName=@CourseName,DateSchedule=@DateSchedule,CourseDescription=@CourseDescription,AimsAndObjectives=@AimsAndObjectives where CourseId=@CourseId;
	insert into CategoryAssociativeTable(CourseId,CategoryId)
	(select CourseId,CategoryId from @TypeCategoryAssociativeTable);
End

create PROCEDURE ProcedureCheckStudStats
@CourseId int
as
begin
declare @TotalStud int
declare @TotalStudRej int
declare @TotalStudPend int
declare @temp table(
TotalStudentInCourse int,
TotalStudentInCoursePending int,
TotalStudentInCourseRejected int
)
select @TotalStud=count(*)
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
INNER JOIN CourseTable ON CourseTable.courseId=StudentCourseAssociativeTable.CourseId
where  CourseTable.courseId=1

select @TotalStudPend=count(*)
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
INNER JOIN CourseTable ON CourseTable.courseId=StudentCourseAssociativeTable.CourseId
where  CourseTable.courseId=1 and StudentCourseAssociativeTable.Pending=1
select @TotalStudRej=count(*)
from StudentTable
Inner join StudentCourseAssociativeTable On StudentCourseAssociativeTable.StudentId = StudentTable.Studentid
INNER JOIN CourseTable ON CourseTable.courseId=StudentCourseAssociativeTable.CourseId
where  CourseTable.courseId=1 and StudentCourseAssociativeTable.Subscribe=0 and StudentCourseAssociativeTable.Pending=0

insert into @temp values (@TotalStud, @TotalStudPend, @TotalStudRej)

Select * from @temp
end

alter procedure ProcedureCheckStudStatsPerCourse
@StudentId int,
@CourseId int
as 
begin

SELECT
StudentCourseAssociativeTable.Pending,StudentCourseAssociativeTable.Subscribe,StudentCourseAssociativeTable.Accepted
FROM StudentCourseAssociativeTable
inner join StudentTable on StudentCourseAssociativeTable.StudentId= StudentTable.StudentId
where StudentCourseAssociativeTable.StudentId=@StudentId and StudentCourseAssociativeTable.CourseId=@CourseId
end
	
	
CREATE PROCEDURE ProcedureUserNameExists
	@UserName varchar(255)
AS
Begin
	Declare @Count int

	SELECT @Count=Count(UserName) from StudentTable where UserName=@UserName

	 If @Count > 0
          Select 1 as userNameInUse
     Else
		SELECT @Count=Count(UserName) from TutorTable where UserName=@UserName
		If @Count > 0
          Select 1 as userNameInUse
		else
          Select 0 as userNameInUse
End


--fill categorycourseAssociativeTable
CREATE PROCEDURE ProcedureGetTutorCoursesList
	@tutorid int
AS
Begin

DECLARE @Temp TABLE
(
	coursesId int,
	coursesNames varchar(255),
	datesCreated datetime,
	datesSchedule datetime,
	categoriesNames varchar(max)
)
insert into @Temp(coursesId,coursesNames,datesCreated,datesSchedule) 
select distinct CourseId,CourseName,DateCreated,DateSchedule from(
select distinct
coursetable.courseId,
coursetable.TutorId,
coursetable.CourseName,
coursetable.DateCreated,
coursetable.DateSchedule,
coursetable.CourseDescription,coursetable.AimsAndObjectives,
CategoryTable.CategoryName,
MaterialAssociativeTable.MaterialPathUrl,MaterialAssociativeTable.DatePosted,
MaterialTypeTable.MaterialTypeName
from coursetable
inner join  categoryassociativetable on CategoryAssociativeTable.CourseId=coursetable.CourseId 
inner join CategoryTable on CategoryTable.CategoryId=categoryassociativetable.CategoryId
inner join  MaterialAssociativeTable on MaterialAssociativeTable.CourseId=coursetable.CourseId 
inner join MaterialTypeTable on MaterialTypeTable.MaterialTypeId=MaterialAssociativeTable.MaterialTypeId
where coursetable.TutorId=@tutorid	
) as courses
DECLARE @CurrentId INT
DECLARE @CurrentName NVARCHAR(50) 
DECLARE myCursor CURSOR FOR
SELECT coursesId,categoriesNames FROM @Temp 
OPEN myCursor 
FETCH NEXT FROM myCursor INTO @CurrentId, @CurrentName 
WHILE(@@FETCH_STATUS = 0)
BEGIN
	UPDATE @Temp SET categoriesNames = (
	(select stuff((select distinct ', ' + CategoryName
	from coursetable
	inner join  categoryassociativetable on CategoryAssociativeTable.CourseId=coursetable.CourseId 
	inner join CategoryTable on CategoryTable.CategoryId=categoryassociativetable.CategoryId
	inner join  MaterialAssociativeTable on MaterialAssociativeTable.CourseId=coursetable.CourseId 
	inner join MaterialTypeTable on MaterialTypeTable.MaterialTypeId=MaterialAssociativeTable.MaterialTypeId
	where coursetable.CourseId=@CurrentId
	for xml path ('')),1,1,'') as catName) ) WHERE coursesId = @CurrentId
	FETCH NEXT FROM myCursor INTO @CurrentId, @CurrentName
END
select * from @Temp
CLOSE myCursor
DEALLOCATE myCursor
End

	
	


Select distinct Username,CategoryName from CourseTable
inner join  TutorTable on CourseTable.TutorId=TutorTable.TutorId 
inner join  CategoryAssociativeTable on CourseTable.CourseId=CategoryAssociativeTable.CourseId 
inner join  CategoryTable on CategoryAssociativeTable.CategoryId=CategoryTable.CategoryId 






accepted		pending			subscribe
0				0				0			ask
0				0				1			rejected
0				1				0			ask
0				1				1			pending
1				0				0			ask
1				0				1			accepted
1				1				0			ask
1				1				1			pending








--Select commands
SELECT AdminId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze FROM AdminTable;
SELECT CategoryCourseId, CourseId, CategoryId FROM CategoryAssociativeTable;
SELECT CategoryId, CategoryName FROM CategoryTable;
SELECT CertificationId, TutorId, CertificationName FROM CertificationTable;
SELECT CourseId, TutorId, CourseName, DateSchedule, DateCreated, CourseDescription, AimsAndObjectives FROM CourseTable;
SELECT EventId, TutorId, EventName, EventDetail, Location FROM EventTable;
SELECT MaterialId, CourseId, MaterialTypeId FROM MaterialAssociativeTable;
SELECT MaterialTypeId, MaterialTypeName FROM MaterialTypeTable;
SELECT StudentCourseId, StudentId, CourseId, Subscribe FROM StudentCourseAssociativeTable;
SELECT StudentId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze FROM StudentTable;
SELECT TutorId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze FROM TutorTable;

--Insert commands
INSERT INTO AdminTable(AdminId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO CategoryAssociativeTable(CategoryCourseId, CourseId, CategoryId) VALUES (?, ?, ?);
INSERT INTO CategoryTable(CategoryId, CategoryName) VALUES (?, ?);
INSERT INTO CertificationTable(CertificationId, TutorId, CertificationName) VALUES (?, ?, ?);
INSERT INTO CourseTable(CourseId, TutorId, CourseName, DateSchedule, DateCreated, CourseDescription, AimsAndObjectives) VALUES (?, ?, ?, ?, ?, ?, ?);
INSERT INTO EventTable(EventId, TutorId, EventName, EventDetail, Location) VALUES (?, ?, ?, ?, ?);
INSERT INTO MaterialAssociativeTable(MaterialId, CourseId, MaterialTypeId) VALUES (?, ?, ?);
INSERT INTO MaterialTypeTable(MaterialTypeId, MaterialTypeName) VALUES (?, ?);
INSERT INTO StudentCourseAssociativeTable(StudentCourseId, StudentId, CourseId, Subscribe) VALUES (?, ?, ?, ?);
INSERT INTO StudentTable(StudentId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO TutorTable(TutorId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
--update commands
UPDATE AdminTable SET FirstName = ?, LastName = ?, ProfilePictureUrl = ?, Address = ?, BirthDate = ?, PhoneNumber = ?, Email = ?, UserName = ?, Password = ?, Freeze = ? WHERE AdminId = ?;
UPDATE CategoryAssociativeTable SET CourseId = ?, CategoryId = ? WHERE CategoryCourseId = ?;
UPDATE CategoryTable SET CategoryName = ? WHERE CategoryId = ?;
UPDATE CertificationTable SET TutorId = ?, CertificationName = ? WHERE CertificationId = ?;
UPDATE CourseTable SET TutorId = ?, CourseName = ?, DateSchedule = ?, DateCreated = ?, CourseDescription = ?, AimsAndObjectives = ? WHERE CourseId = ?;
UPDATE EventTable SET TutorId = ?, EventName = ?, EventDetail = ?, Location = ? WHERE EventId = ?;
UPDATE MaterialAssociativeTable SET CourseId = ?, MaterialTypeId = ? WHERE MaterialId = ?;
UPDATE MaterialTypeTable SET MaterialTypeName = ? WHERE MaterialTypeId = ?;
UPDATE StudentCourseAssociativeTable SET StudentId = ?, CourseId = ?, Subscribe = ? WHERE StudentCourseId = ?;
UPDATE StudentTable SET FirstName = ?, LastName = ?, ProfilePictureUrl = ?, Address = ?, BirthDate = ?, PhoneNumber = ?, Email = ?, UserName = ?, Password = ?, Freeze = ? WHERE StudentId = ?;
UPDATE TutorTable SET FirstName = ?, LastName = ?, ProfilePictureUrl = ?, Address = ?, BirthDate = ?, PhoneNumber = ?, Email = ?, UserName = ?, Password = ?, Freeze = ? WHERE TutorId = ?;
--Delete commands
DELETE FROM AdminTable WHERE AdminId = ?;
DELETE FROM CategoryAssociativeTable WHERE CategoryCourseId = ?;
DELETE FROM CategoryTable WHERE CategoryId = ?;
DELETE FROM CertificationTable WHERE CertificationId = ?;
DELETE FROM CourseTable WHERE CourseId = ?;
DELETE FROM EventTable WHERE EventId = ?;
DELETE FROM MaterialAssociativeTable WHERE MaterialId = ?;
DELETE FROM MaterialTypeTable WHERE MaterialTypeId = ?;
DELETE FROM StudentCourseAssociativeTable WHERE StudentCourseId = ?;
DELETE FROM StudentTable WHERE StudentId = ?;
DELETE FROM TutorTable WHERE TutorId = ?;


--delete the whole tables
ALTER TABLE CourseTable DROP CONSTRAINT FKCourseTabl693115;
ALTER TABLE StudentCourseAssociativeTable DROP CONSTRAINT FKStudentCou222856;
ALTER TABLE StudentCourseAssociativeTable DROP CONSTRAINT FKStudentCou373222;
ALTER TABLE MaterialAssociativeTable DROP CONSTRAINT FKMaterialAs405260;
ALTER TABLE MaterialAssociativeTable DROP CONSTRAINT FKMaterialAs671839;
ALTER TABLE EventTable DROP CONSTRAINT FKEventTable286585;
ALTER TABLE CertificationTable DROP CONSTRAINT FKCertificat925974;
ALTER TABLE CategoryAssociativeTable DROP CONSTRAINT FKCategoryAs504842;
ALTER TABLE CategoryAssociativeTable DROP CONSTRAINT FKCategoryAs16812;
DROP TABLE AdminTable;
DROP TABLE CategoryAssociativeTable;
DROP TABLE CategoryTable;
DROP TABLE CertificationTable;
DROP TABLE CourseTable;
DROP TABLE EventTable;
DROP TABLE MaterialAssociativeTable;
DROP TABLE MaterialTypeTable;
DROP TABLE StudentCourseAssociativeTable;
DROP TABLE StudentTable;
DROP TABLE TutorTable;
