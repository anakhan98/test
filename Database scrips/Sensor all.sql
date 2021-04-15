
	CREATE TABLE Sensor(
	Temperature INT  NOT NULL,
	[Date] DATE ,
	Latitude DECIMAL NOT NULL,
	Longitude DECIMAL NOT NULL,
	DriverID INT NOT NULL,
	TruckRN VARCHAR(50) NOT NULL,
	CONSTRAINT FK_Driver FOREIGN KEY (DriverID) REFERENCES Driver(DriverId),
	CONSTRAINT FK_Truck FOREIGN KEY (TruckRN) REFERENCES Truck(TruckRegNo)

	);

	
Insert into Sensor (Temperature, [Date], Latitude,Longitude,DriverID, TruckRN ) Values(9,'03-17-2021', 2.514677,168.94221,1,'Ka123456')


Select * from Sensor






CREATE OR ALTER PROCEDURE usp_AddSensor(
@Temperature INT,
	@Date DATE,
	@Latitude DECIMAL ,
	@Longitude DECIMAL ,
	@DriverID INT,
	@TruckRN VARCHAR(50)
)
AS

BEGIN TRY
	INSERT INTO Sensor (Temperature, [Date], Latitude,Longitude,DriverID, TruckRN )  VALUES
	
	(@Temperature, @Date, @Latitude,@Longitude,@DriverID, @TruckRN ) 		  
END TRY
BEGIN CATCH
	RETURN -83
END CATCH

GO

EXECUTE dbo.usp_AddSensor @Temperature = 22, @Date= '04-15-2021', @Latitude = 12.1234,@Longitude = 13.12343,@DriverID=2 , @TruckRN= 'Ka123456'

SELECT * FROM Sensor;





