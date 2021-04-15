
CREATE TABLE Driver(
FirstName varchar(100)  NOT NULL,
LastName varchar(100)  NOT NULL,
LicenseNumber varchar(100)  NOT NULL,
LicenseExpiryDate Date NOT NULL,
DriverId INT Identity(1,1) Primary Key NOT NULL,

);

Insert into Driver (FirstName, LastName, LicenseNumber,LicenseExpiryDate) Values('Patrick',  'Andrews', 'KA47123', '12-12-2021')


Select * from Driver





CREATE OR ALTER PROCEDURE usp_AddDriver
(

@FName VARCHAR(100),
@Lname VARCHAR(100),
@LiNum VARCHAR(100),
@ExDate  DATE
)
AS
BEGIN TRY
		IF NOT EXISTS (SELECT LicenseNumber FROM Driver WHERE LicenseNumber=@LiNum)
		BEGIN
			INSERT INTO Driver (FirstName, LastName, LicenseNumber,LicenseExpiryDate) VALUES (@FName,@LName,@LiNum,@ExDate)
		END
		ELSE
		BEGIN
			RETURN -99
		END	
END TRY

BEGIN CATCH
	RETURN -98
END catch
GO

EXECUTE dbo.usp_AddDriver @FName='Naresh',@LName='M',@LiNum='KA471234',@ExDate='04-25-2022'


SELECT * FROM Driver;







CREATE OR ALTER PROCEDURE usp_UpdateDLExpiry
( @ID  INT,
@expdate DATE
)
AS
BEGIN TRY
		
		UPDATE dbo.Driver
		SET LicenseExpiryDate = @expdate
		where DriverId = @ID

	
			
END TRY

BEGIN CATCH
	return -65
END catch
GO

EXECUTE dbo.usp_UpdateDLExpiry @ID=1, @expdate='2027-04-15' ;


SELECT * FROM Driver

