INSERT INTO AdminTable(AdminId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO CategoryTable(CategoryId, CategoryName) VALUES (?, ?);
INSERT INTO CertificationTable(CertificateId, HKId, CertificateName) VALUES (?, ?, ?);
INSERT INTO HKJobAssociativeTable(HKJobId, JobId, HKId, Applied, Pending, Accepted, Rating) VALUES (?, ?, ?, ?, ?, ?, ?);
INSERT INTO HouseKeeperTable(HKId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO HouseOwnerTable(HOId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
INSERT INTO JobCategoryAssociativeTable(JobCategoryId, JobId, CategoryId) VALUES (?, ?, ?);
INSERT INTO JobLocationAssociativeTable(JobLocationId, JobId, LocationId) VALUES (?, ?, ?);
INSERT INTO JobTable(JobId, HOId, Title, Salary, Description, DatePosted, DeadlineDate) VALUES (?, ?, ?, ?, ?, ?, ?);
INSERT INTO LocationTable(LocationId, Location) VALUES (?, ?);

