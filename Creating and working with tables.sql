CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY IDENTITY(1,1),
    VehicleName NVARCHAR(50) NOT NULL,
    VehicleType VARCHAR(20),
    Manufacturer VARCHAR(50),
    PurchaseDate DATE,
    Mileage INT,
    IsActive BIT DEFAULT 1
);--Create Table

INSERT INTO Vehicles (VehicleName, VehicleType, Manufacturer, PurchaseDate, Mileage)
VALUES ('Honda City', 'Sedan', 'Honda', '2022-01-15', 120000);--Insert Data

INSERT INTO Vehicles (VehicleName, VehicleType, Manufacturer, PurchaseDate, Mileage) VALUES
('Livo', 'Sedan', 'Honda', '2013-04-23', 10000),
('CT100', 'Sedan', 'Bajaj', '2020-08-18', 8000);--Insert Multiple Data

SELECT * FROM Vehicles;--Select All Data

SELECT VehicleName, Mileage FROM Vehicles;--Select Perticular Columns

UPDATE Vehicles SET Mileage = 10000 WHERE VehicleID = 2;--Update Data

UPDATE Vehicles SET Mileage = 8000, PurchaseDate = '2016-04-23' WHERE VehicleID = 4;--Update Multiple Data

DELETE FROM Vehicles WHERE VehicleID = 2;--Delete Data

DELETE FROM Vehicles;--Delete All Data

ALTER TABLE Vehicles ADD RegistrationNumber NVARCHAR(20);--Adding a Column

ALTER TABLE Vehicles ALTER COLUMN Mileage INT NOT NULL;--Modifying a Column

ALTER TABLE Vehicles DROP COLUMN RegistrationNumber;--Dropping a Column

DROP TABLE Vehicles;-- Dropping a Table

TRUNCATE TABLE Vehicles;--Truncating a Table