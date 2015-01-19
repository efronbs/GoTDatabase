--DoT SQL statements initializing DB
--Doesn't include constraints or ID increments yet

CREATE TABLE Episodes(
	E_Id		INT	NOT NULL,
	Boob_Count	INT	NOT NULL,
	PRIMARY KEY (E_Id)
);

CREATE TABLE Characters(
	C_Id	INT			NOT NULL,
	Name	VARCHAR(?)	NOT NULL,
	Social_Status	VARCHAR(?),
	Dies_In	INT,
	PRIMARY KEY (C_Id),
	FOREIGN KEY (Dies_In) REFERENCES Episodes(E_Id)
);

CREATE TABLE Regions(
	R_Name	VARCHAR(?)	NOT NULL,
	Capital	VARCHAR(?),	--NOT NULL,?
	--Cities	How should we do this attribute?
	Climate	VARCHAR(?),
	PRIMARY KEY (R_Name)
);

CREATE TABLE Battles(
	B_Name	VARCHAR(?)	NOT NULL,
	Winner	VARCHAR(?),
	-- [House_Name	VARCHAR(?),] *I don't think we need this; HouseBattle table does this*
	Region VARCHAR(?) NOT NULL,
	E_Id	INT	NOT NULL,
	PRIMARY KEY (B_Name),
	FOREIGN KEY (Region) REFERENCES Regions(R_Name),
	FOREIGN KEY (E_Id) REFERENCES Episodes(E_Id)
);

CREATE TABLE Houses(
	H_Name	VARCHAR(?)	NOT NULL,
	Slogan	VARCHAR(?),
	--Symbol	how should we do this one?
	PRIMARY KEY (H_Name)
);

CREATE TABLE CharacterRelationships(
	C_Id		INT		NOT NULL,
	OtherC_Id	INT		NOT NULL,
	Kind	VARCHAR(?),
	Start_E		INT		NOT NULL,
	End_E		INT		NOT NULL,
	PRIMARY KEY (C_Id, OtherC_Id, Start_E, End_E),
	FOREIGN KEY (C_Id) REFERENCES Characters(C_Id),
	FOREIGN KEY (OtherC_Id) REFERENCES Characters(C_Id),
	FOREIGN KEY (Start_E) REFERENCES Episodes(E_Id),
	FOREIGN KEY (End_E) REFERENCES Episodes(E_Id)
);

CREATE TABLE AppearsIn(
	C_Id	INT		NOT NULL,
	E_Id	INT		NOT NULL,
	PRIMARY KEY (C_Id, E_Id),
	FOREIGN KEY (C_Id) REFERENCES Characters(C_Id),
	FOREIGN KEY (E_Id) REFERENCES Episodes(E_Id)
);

CREATE TABLE MemberOf(
	C_Id	INT			NOT NULL,
	House	VARCHAR(?)	NOT NULL,
	PRIMARY KEY (C_Id, House),
	FOREIGN KEY (C_Id) REFERENCES Characters(C_Id),
	FOREIGN KEY (House) REFERENCES Houses(H_Name)
);

CREATE TABLE HouseRegion(
	House	VARCHAR(?)	NOT NULL,
	Region	VARCHAR(?)	NOT NULL,
	Status	VARCHAR(?),
	PRIMARY KEY (House, Region),
	FOREIGN KEY (House) REFERENCES Houses(H_Name),
	FOREIGN KEY (Region) REFERENCES Regions(R_Name)
);

CREATE TABLE HouseBattles(
	Battle	VARCHAR(?)	NOT NULL,
	House	VARCHAR(?)  NOT NULL,
	PRIMARY KEY (Battle, House),
	FOREIGN KEY (Battle) REFERENCES Battles(B_Name),
	FOREIGN KEY (House) REFERENCES Houses(H_Name)
);





