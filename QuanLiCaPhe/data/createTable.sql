Create Database QuanLiXe
USE QuanLiXe
GO

CREATE TABLE Account (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	UserName NVARCHAR(100) UNIQUE NOT NULL,
	DisplayName NVARCHAR(100),
	Password NVARCHAR(100),
	Role NVARCHAR (100)
);
GO

CREATE TABLE Manufactures (
	ManufacturesId INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(100) UNIQUE NOT NULL,
	Icon NVARCHAR(200)
);
GO

CREATE TABLE Owners (
	OwnerId INT IDENTITY(1,1) PRIMARY KEY,
	FullName NVARCHAR(100) NOT NULL,
	Address NVARCHAR(200),
	Email NVARCHAR(100) UNIQUE NOT NULL,
	PhoneNumber NVARCHAR(12)
);
GO

CREATE TABLE Vehicles (
	VehiclesId INT IDENTITY(1,1) PRIMARY KEY,
	LiscensePlate NVARCHAR(20) UNIQUE NOT NULL,
	VehicleName NVARCHAR(200) NOT NULL,
	ManufacturesId INT NOT NULL,
	OwnerId INT,
	SpecificationsId INT NOT NULL,
	Color NVARCHAR(20)

	FOREIGN KEY (ManufacturesId) REFERENCES dbo.Manufactures(ManufacturesId),
	FOREIGN KEY (OwnerId) REFERENCES dbo.Owners(OwnerId),
);
GO

CREATE TABLE Specifications (
	SpecificationsId INT IDENTITY(1,1) PRIMARY KEY,
	EngineType NVARCHAR(100),
	FuelType NVARCHAR(100),
	Weigth FLOAT DEFAULT 0,
	TopSpeed FLOAT DEFAULT 0,
	Acceleration FLOAT DEFAULT 0,
	EngineDisplacement NVARCHAR(100),
	VehiclesId INT ,
	FOREIGN KEY (VehiclesId) REFERENCES dbo.Vehicles(VehiclesId)
);
GO


