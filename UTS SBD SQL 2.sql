CREATE TABLE Author 
    ( 
     Email     VARCHAR (50)  NOT NULL , 
     FirstName VARCHAR (50)  NOT NULL , 
     LastName  VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Author 
    ADD CONSTRAINT Author_PK PRIMARY KEY ( Email ) ;
 
CREATE TABLE Paper 
    ( 
     PaperID      INTEGER  NOT NULL , 
     Title        VARCHAR (50)  NOT NULL , 
     Abstract     TEXT  NOT NULL , 
     FileName     VARCHAR (50)  NOT NULL , 
     ContactEmail VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Paper 
    ADD CONSTRAINT Paper_PK PRIMARY KEY ( PaperID ) ;
 
CREATE TABLE Paper_Author 
    ( 
     AuthorEmail   VARCHAR (50)  NOT NULL , 
     PaperID       INTEGER  NOT NULL 
    ) 
;
 
ALTER TABLE Paper_Author 
    ADD CONSTRAINT Paper_Author_PK PRIMARY KEY ( AuthorEmail, PaperID ) ;
 
CREATE TABLE Review 
    ( 
     PaperID               INTEGER  NOT NULL , 
     ReviewEmail           VARCHAR (50)  NOT NULL , 
     TechnicalMerit        INTEGER  NOT NULL , 
     Readability           INTEGER  NOT NULL , 
     Originality           INTEGER  NOT NULL , 
     Relevance             INTEGER  NOT NULL , 
     OverallRecommendation VARCHAR (50)  NOT NULL , 
     CommentsCommittee     TEXT  NOT NULL , 
     CommentsAuthor        TEXT  NOT NULL 
    ) 
;
 
ALTER TABLE Review 
    ADD CONSTRAINT Review_PK PRIMARY KEY ( PaperID, ReviewEmail ) ;
 
CREATE TABLE Reviewer 
    ( 
     Email       VARCHAR (50)  NOT NULL , 
     FirstName   VARCHAR (50)  NOT NULL , 
     LastName    VARCHAR (50)  NOT NULL , 
     Phone       VARCHAR (50)  NOT NULL , 
     Affiliation VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Reviewer 
    ADD CONSTRAINT Reviewer_PK PRIMARY KEY ( Email ) ;
 
CREATE TABLE Reviewer_Topic 
    ( 
     ReviewerEmail  VARCHAR (50)  NOT NULL , 
     Topic          VARCHAR (50)  NOT NULL 
    ) 
;
 
ALTER TABLE Reviewer_Topic 
    ADD CONSTRAINT Reviewer_Topic_PK PRIMARY KEY ( ReviewerEmail, Topic ) ;
 
ALTER TABLE Paper_Author 
    ADD CONSTRAINT Paper_Author_Author_FK FOREIGN KEY 
    ( 
     AuthorEmail
    ) 
    REFERENCES Author 
    ( 
     Email
    ) 
;
 
ALTER TABLE Paper 
    ADD CONSTRAINT Paper_Author_FK FOREIGN KEY 
    ( 
     ContactEmail
    ) 
    REFERENCES Author 
    ( 
     Email
    ) 
;
 
ALTER TABLE Paper_Author 
    ADD CONSTRAINT Paper_Author_Paper_FK FOREIGN KEY 
    ( 
     PaperID
    ) 
    REFERENCES Paper 
    ( 
     PaperID
    ) 
;
 
ALTER TABLE Review 
    ADD CONSTRAINT Review_Paper_FK FOREIGN KEY 
    ( 
     PaperID
    ) 
    REFERENCES Paper 
    ( 
     PaperID
    ) 
;
 
ALTER TABLE Review 
    ADD CONSTRAINT Review_Reviewer_FK FOREIGN KEY 
    ( 
     ReviewEmail
    ) 
    REFERENCES Reviewer 
    ( 
     Email
    ) 
;
 
ALTER TABLE Reviewer_Topic 
    ADD CONSTRAINT Reviewer_Topic_Reviewer_FK FOREIGN KEY 
    ( 
     ReviewerEmail
    ) 
    REFERENCES Reviewer 
    ( 
     Email
    ) 
;
 