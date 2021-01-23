UPDATE AdminTable SET FirstName = ?, LastName = ?, ProfilePictureUrl = ?, Address = ?, BirthDate = ?, PhoneNumber = ?, Email = ?, UserName = ?, Password = ?, Freeze = ? WHERE AdminId = ?;
UPDATE CategoryTable SET CategoryName = ? WHERE CategoryId = ?;
UPDATE CertificationTable SET HKId = ?, CertificateName = ? WHERE CertificateId = ?;
UPDATE HKJobAssociativeTable SET JobId = ?, HKId = ?, Applied = ?, Pending = ?, Accepted = ?, Rating = ? WHERE HKJobId = ?;
UPDATE HouseKeeperTable SET FirstName = ?, LastName = ?, ProfilePictureUrl = ?, Address = ?, BirthDate = ?, PhoneNumber = ?, Email = ?, UserName = ?, Password = ?, Freeze = ? WHERE HKId = ?;
UPDATE HouseOwnerTable SET FirstName = ?, LastName = ?, ProfilePictureUrl = ?, Address = ?, BirthDate = ?, PhoneNumber = ?, Email = ?, UserName = ?, Password = ?, Freeze = ? WHERE HOId = ?;
UPDATE JobCategoryAssociativeTable SET JobId = ?, CategoryId = ? WHERE JobCategoryId = ?;
UPDATE JobLocationAssociativeTable SET JobId = ?, LocationId = ? WHERE JobLocationId = ?;
UPDATE JobTable SET HOId = ?, Title = ?, Salary = ?, Description = ?, DatePosted = ?, DeadlineDate = ? WHERE JobId = ?;
UPDATE LocationTable SET Location = ? WHERE LocationId = ?;

