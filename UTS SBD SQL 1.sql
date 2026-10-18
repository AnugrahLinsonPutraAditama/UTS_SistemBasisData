CREATE TABLE Bill 
    ( 
     BillID         INTEGER  NOT NULL , 
     BillName       VARCHAR (50)  NOT NULL , 
     DateOfVote     DATE , 
     PassedOrFailed VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Bill 
    ADD CONSTRAINT Bill_PK PRIMARY KEY ( BillID ) ;
 
CREATE TABLE Statee 
    ( 
     StateName VARCHAR (50)  NOT NULL , 
     Region    VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Statee 
    ADD CONSTRAINT Statee_PK PRIMARY KEY ( StateName ) ;
 
CREATE TABLE Congress_Person 
    ( 
     CongID           INTEGER  NOT NULL , 
     Name             VARCHAR (50)  NOT NULL , 
     District         INTEGER  NOT NULL , 
     StartDate        DATE  NOT NULL , 
     Party            VARCHAR (50)  NOT NULL , 
     StateName        VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Congress_Person 
    ADD CONSTRAINT Congress_Person_PK PRIMARY KEY ( CongID ) ;
 
CREATE TABLE Sponsor 
    ( 
     CongID                 INTEGER  NOT NULL , 
     BillID                 INTEGER  NOT NULL 
    ) 
;
 
ALTER TABLE Sponsor 
    ADD CONSTRAINT Sponsor_PK PRIMARY KEY ( CongID, BillID ) ;
 
CREATE TABLE Vote 
    ( 
     CongID                 INTEGER  NOT NULL , 
     BillID                 INTEGER  NOT NULL , 
     Vote                   VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Vote 
    ADD CONSTRAINT Vote_PK PRIMARY KEY ( CongID, BillID ) ;
 
ALTER TABLE Congress_Person 
    ADD CONSTRAINT Congress_Person_Statee_FK FOREIGN KEY 
    ( 
     StateName
    ) 
    REFERENCES Statee 
    ( 
     StateName
    ) 
;
 
ALTER TABLE Sponsor 
    ADD CONSTRAINT Sponsor_Bill_FK FOREIGN KEY 
    ( 
     BillID
    ) 
    REFERENCES Bill 
    ( 
     BillID
    ) 
;
 
ALTER TABLE Sponsor 
    ADD CONSTRAINT Sponsor_Congress_Person_FK FOREIGN KEY 
    ( 
     CongID
    ) 
    REFERENCES Congress_Person 
    ( 
     CongID
    ) 
;
 
ALTER TABLE Vote 
    ADD CONSTRAINT Vote_Bill_FK FOREIGN KEY 
    ( 
     BillID
    ) 
    REFERENCES Bill 
    ( 
     BillID
    ) 
;
 
ALTER TABLE Vote 
    ADD CONSTRAINT Vote_Congress_Person_FK FOREIGN KEY 
    ( 
     CongID
    ) 
    REFERENCES Congress_Person 
    ( 
     CongID
    ) 
;
 