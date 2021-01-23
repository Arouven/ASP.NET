CREATE TABLE AdminTable (AdminId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (AdminId));
CREATE TABLE CategoryTable (CategoryId int IDENTITY NOT NULL, CategoryName varchar(255) NULL, PRIMARY KEY (CategoryId));
CREATE TABLE CertificationTable (CertificateId int IDENTITY NOT NULL, HKId int NOT NULL, CertificateName varchar(255) NULL, PRIMARY KEY (CertificateId));
CREATE TABLE HKJobAssociativeTable (HKJobId int IDENTITY NOT NULL, JobId int NOT NULL, HKId int NOT NULL, Applied bit NULL, Pending bit NULL, Accepted bit NULL, Rating int DEFAULT 0 NULL, PRIMARY KEY (HKJobId));
CREATE TABLE HouseKeeperTable (HKId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (HKId));
CREATE TABLE HouseOwnerTable (HOId int IDENTITY NOT NULL, FirstName varchar(255) NULL, LastName varchar(255) NULL, ProfilePictureUrl varchar(255) NULL, Address varchar(255) NULL, BirthDate date NULL, PhoneNumber int NULL, Email varchar(255) NULL, UserName varchar(255) NULL, Password varchar(255) NULL, Freeze bit NULL, PRIMARY KEY (HOId));
CREATE TABLE JobCategoryAssociativeTable (JobCategoryId int IDENTITY NOT NULL, JobId int NOT NULL, CategoryId int NOT NULL, PRIMARY KEY (JobCategoryId));
CREATE TABLE JobLocationAssociativeTable (JobLocationId int IDENTITY NOT NULL, JobId int NOT NULL, LocationId int NOT NULL, PRIMARY KEY (JobLocationId));
CREATE TABLE JobTable (JobId int IDENTITY NOT NULL, HOId int NOT NULL, Title varchar(255) NULL, Salary varchar(255) NULL, Description varchar(255) NULL, DatePosted date NULL, DeadlineDate date NULL, PRIMARY KEY (JobId));
CREATE TABLE LocationTable (LocationId int IDENTITY NOT NULL, Location varchar(255) NULL, PRIMARY KEY (LocationId));
ALTER TABLE JobTable ADD CONSTRAINT FKJobTable771792 FOREIGN KEY (HOId) REFERENCES HouseOwnerTable (HOId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE HKJobAssociativeTable ADD CONSTRAINT FKHKJobAssoc564106 FOREIGN KEY (JobId) REFERENCES JobTable (JobId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE HKJobAssociativeTable ADD CONSTRAINT FKHKJobAssoc769404 FOREIGN KEY (HKId) REFERENCES HouseKeeperTable (HKId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE CertificationTable ADD CONSTRAINT FKCertificat165829 FOREIGN KEY (HKId) REFERENCES HouseKeeperTable (HKId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobLocationAssociativeTable ADD CONSTRAINT FKJobLocatio272303 FOREIGN KEY (JobId) REFERENCES JobTable (JobId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobLocationAssociativeTable ADD CONSTRAINT FKJobLocatio643065 FOREIGN KEY (LocationId) REFERENCES LocationTable (LocationId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobCategoryAssociativeTable ADD CONSTRAINT FKJobCategor688377 FOREIGN KEY (JobId) REFERENCES JobTable (JobId) ON UPDATE Cascade ON DELETE Cascade;
ALTER TABLE JobCategoryAssociativeTable ADD CONSTRAINT FKJobCategor877825 FOREIGN KEY (CategoryId) REFERENCES CategoryTable (CategoryId) ON UPDATE Cascade ON DELETE Cascade;

