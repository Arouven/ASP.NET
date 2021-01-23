SELECT AdminId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze FROM AdminTable;
SELECT CategoryId, CategoryName FROM CategoryTable;
SELECT CertificateId, HKId, CertificateName FROM CertificationTable;
SELECT HKJobId, JobId, HKId, Applied, Pending, Accepted, Rating FROM HKJobAssociativeTable;
SELECT HKId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze FROM HouseKeeperTable;
SELECT HOId, FirstName, LastName, ProfilePictureUrl, Address, BirthDate, PhoneNumber, Email, UserName, Password, Freeze FROM HouseOwnerTable;
SELECT JobCategoryId, JobId, CategoryId FROM JobCategoryAssociativeTable;
SELECT JobLocationId, JobId, LocationId FROM JobLocationAssociativeTable;
SELECT JobId, HOId, Title, Salary, Description, DatePosted, DeadlineDate FROM JobTable;
SELECT LocationId, Location FROM LocationTable;

