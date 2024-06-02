CREATE DATABASE RelationUmainMaratien;
GO
USE RelationUmainMaratien;
GO
CREATE TABLE Continent (
    ContinentID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100) NOT NULL
);
CREATE TABLE Terrien (
    TerrienID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100) NOT NULL,
    ContinentID INT,
    FOREIGN KEY (ContinentID) REFERENCES Continent(ContinentID)
);
CREATE TABLE BaseMartienne (
    BaseID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100) NOT NULL
);
CREATE TABLE Martien (
    MartienID INT PRIMARY KEY IDENTITY(1,1),
    Nom NVARCHAR(100) NOT NULL,
    TerrienID INT,
    BaseID INT,
    SuperieurID INT,
    FOREIGN KEY (TerrienID) REFERENCES Terrien(TerrienID),
    FOREIGN KEY (BaseID) REFERENCES BaseMartienne(BaseID),
    FOREIGN KEY (SuperieurID) REFERENCES Martien(MartienID)
);
/*insert*/

INSERT INTO Continent (Nom) VALUES ('Europe'), ('Asie'), ('Afrique'), ('Amérique du Nord');

INSERT INTO Terrien (Nom, ContinentID) VALUES 
('Siwar said', 1),
('Alex alex', 2),
('Ameli Dupont', 3),
('Adam Adam', 4);

INSERT INTO BaseMartienne (Nom) VALUES ('Base 1'), ('Base 2'), ('Base 3'), ('Base 4');

INSERT INTO Martien (Nom, TerrienID, BaseID, SuperieurID) VALUES 
('Martien 1', 1, 1, 2),
('Martien 2', 2, 2, 3),
('Martien 3', 3, 3, 4),
('Martien 4', 4, 4, 5);

SELECT 
    M.Nom AS NomMartien,
    T.Nom AS NomReferentTerrien,
    C.Nom AS ContinentReferent,
    B.Nom AS BaseMartienne
FROM Martien M
JOIN Terrien T ON M.TerrienID = T.TerrienID
JOIN Continent C ON T.ContinentID = C.ContinentID    
JOIN BaseMartienne B ON M.BaseID = B.BaseID;
