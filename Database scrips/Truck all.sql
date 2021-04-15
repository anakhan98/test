
CREATE TABLE Truck(
TruckRegNo varchar(50) Primary Key  NOT NULL,
TruckFitExp Date  NOT NULL,
TruckModel varchar(100)  NOT NULL,
TruckHaulCapacity Decimal NOT NULL,

);


Insert into Truck (TruckRegNo, TruckFitExp, TruckModel,TruckHaulCapacity) Values('Ka123456',  '10-10-2021', 'Tata Prime', 20)


Select * from Truck




CREATE OR ALTER PROCEDURE usp_AddTruck(
@TruckModel AS VARCHAR(100),
@TruckRegister_Number varchar(50), 
@TruckExpiryDate Date ,
@TruckHaulingCapacity decimal
)
AS

BEGIN TRY
	INSERT INTO Truck(TruckModel,TruckRegNo,TruckFitExp,TruckHaulCapacity) VALUES
	
	(@TruckModel,@TruckRegister_Number,@TruckExpiryDate,@TruckHaulingCapacity)		  
END TRY
BEGIN CATCH
	RETURN -82
END CATCH

GO

EXECUTE dbo.usp_AddTruck @TruckModel="Ford",@TruckRegister_Number="FD12345",@TruckExpiryDate="2-2-2024",@TruckHaulingCapacity=210;

SELECT * FROM Truck;



CREATE OR ALTER PROCEDURE usp_UpdateTruckFitExp
( 
@TruckRegNo varchar(50),
@TruckFitExp DATE
)
AS
BEGIN TRY
		
		UPDATE Truck
		SET TruckFitExp = @TruckFitExp
		where TruckRegNo = @TruckRegNo

	
			
END TRY

BEGIN CATCH
	return -65
END catch
GO

EXECUTE dbo.usp_UpdateTruckFitExp @TruckRegNo=FD12345, @TruckFitExp='2027-04-15' ;


SELECT * FROM Truck
