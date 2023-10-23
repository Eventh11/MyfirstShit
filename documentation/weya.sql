DROP DATABASE IF EXISTS WEYA;

CREATE DATABASE IF NOT EXISTS WEYA;
USE WEYA;
# -----------------------------------------------------------------------------
#       TABLE : MESSAGERIE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MESSAGERIE
 (
   IDMES CHAR(32) NOT NULL  ,
   NUMUTL INTEGER(2) NOT NULL  ,
   NUMUTL_EMETTEUR INTEGER(2) NOT NULL  ,
   DATEMES DATETIME NULL  ,
   TEXTMES TEXT NULL  
   , PRIMARY KEY (IDMES) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MESSAGERIE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MESSAGERIE_UTILISATEUR
     ON MESSAGERIE (NUMUTL ASC);

CREATE  INDEX I_FK_MESSAGERIE_UTILISATEUR1
     ON MESSAGERIE (NUMUTL_EMETTEUR ASC);

# -----------------------------------------------------------------------------
#       TABLE : CENTREINTERET
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CENTREINTERET
 (
   IDCNTRINTERET INTEGER(2) NOT NULL  ,
   LIBCNTRINTERET CHAR(255) NULL  
   , PRIMARY KEY (IDCNTRINTERET) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : UTILISATEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS UTILISATEUR
 (
   NUMUTL INTEGER(2) NOT NULL  ,
   NUMSEX INTEGER(1) NOT NULL  ,
   IDLANGUE INTEGER(2) NOT NULL  ,
   IDPAYS INTEGER(2) NOT NULL  ,
   IDPAYS_RESIDENCE INTEGER(2) NOT NULL  ,
   LOGINUTL CHAR(100) NULL  ,
   MDPUTL CHAR(255) NULL  ,
   NOMUTL CHAR(255) NULL  ,
   PRENOMUTL CHAR(255) NULL  ,
   AGEUTL SMALLINT(3) NULL  ,
   IMGUTL LONGBLOB NULL  ,
   VILUTL CHAR(255) NULL  
   , PRIMARY KEY (NUMUTL) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE UTILISATEUR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_UTILISATEUR_SEXE
     ON UTILISATEUR (NUMSEX ASC);

CREATE  INDEX I_FK_UTILISATEUR_LANGUE
     ON UTILISATEUR (IDLANGUE ASC);

CREATE  INDEX I_FK_UTILISATEUR_PAYS
     ON UTILISATEUR (IDPAYS ASC);

CREATE  INDEX I_FK_UTILISATEUR_PAYS1
     ON UTILISATEUR (IDPAYS_RESIDENCE ASC);

# -----------------------------------------------------------------------------
#       TABLE : PAYS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PAYS
 (
   IDPAYS INTEGER(2) NOT NULL  ,
   LIBPAYS CHAR(255) NULL  
   , PRIMARY KEY (IDPAYS) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SEXE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SEXE
 (
   NUMSEX INTEGER(1) NOT NULL  ,
   LIBSEX CHAR(1) NULL  
   , PRIMARY KEY (NUMSEX) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TYPEMEDIA
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPEMEDIA
 (
   IDTYPMEDIA INTEGER(2) NOT NULL  ,
   LIBTYPMEDIA CHAR(100) NULL  
   , PRIMARY KEY (IDTYPMEDIA) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : MEDIA
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MEDIA
 (
   IDMEDIA INTEGER(2) NOT NULL  ,
   IDTYPMEDIA INTEGER(2) NOT NULL  ,
   LIBMEDIA CHAR(255) NULL  
   , PRIMARY KEY (IDMEDIA) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MEDIA
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MEDIA_TYPEMEDIA
     ON MEDIA (IDTYPMEDIA ASC);

# -----------------------------------------------------------------------------
#       TABLE : STORY
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS STORY
 (
   NUMSTRY CHAR(32) NOT NULL  ,
   NUMUTL INTEGER(2) NOT NULL  ,
   TEXTESTRY TEXT NULL  ,
   TITRESTRY CHAR(255) NULL  
   , PRIMARY KEY (NUMSTRY) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE STORY
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_STORY_UTILISATEUR
     ON STORY (NUMUTL ASC);

# -----------------------------------------------------------------------------
#       TABLE : LANGUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LANGUE
 (
   IDLANGUE INTEGER(2) NOT NULL  ,
   LIBLANGUE CHAR(255) NULL  
   , PRIMARY KEY (IDLANGUE) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ABONNEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ABONNEMENT
 (
   NUMABONN INTEGER(1) NOT NULL  ,
   TITREABONN CHAR(255) NULL  ,
   PRIXABONN DECIMAL(10,2) NULL  ,
   PERIODABONN INTEGER(2) NULL  , 
   PRIMARY KEY (NUMABONN) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : APPARTENIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS APPARTENIR
 (
   NUMSTRY CHAR(32) NOT NULL  ,
   IDMEDIA INTEGER(2) NOT NULL  
   , PRIMARY KEY (NUMSTRY,IDMEDIA) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE APPARTENIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_APPARTENIR_STORY
     ON APPARTENIR (NUMSTRY ASC);

CREATE  INDEX I_FK_APPARTENIR_MEDIA
     ON APPARTENIR (IDMEDIA ASC);

# -----------------------------------------------------------------------------
#       TABLE : AVOIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVOIR
 (
   NUMUTL INTEGER(2) NOT NULL  ,
   NUMABONN INTEGER(1) NOT NULL  ,
   DATEDEB DATE NULL  ,
   VALID BOOL NULL  
   , PRIMARY KEY (NUMUTL,NUMABONN) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AVOIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AVOIR_UTILISATEUR
     ON AVOIR (NUMUTL ASC);

CREATE  INDEX I_FK_AVOIR_ABONNEMENT
     ON AVOIR (NUMABONN ASC);

# -----------------------------------------------------------------------------
#       TABLE : MAITRISER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS MAITRISER
 (
   IDLANGUE INTEGER(2) NOT NULL  ,
   NUMUTL INTEGER(2) NOT NULL  
   , PRIMARY KEY (IDLANGUE,NUMUTL) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE MAITRISER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_MAITRISER_LANGUE
     ON MAITRISER (IDLANGUE ASC);

CREATE  INDEX I_FK_MAITRISER_UTILISATEUR
     ON MAITRISER (NUMUTL ASC);

# -----------------------------------------------------------------------------
#       TABLE : PEUTAVOIR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PEUTAVOIR
 (
   NUMUTL INTEGER(2) NOT NULL  ,
   IDCNTRINTERET INTEGER(2) NOT NULL  
   , PRIMARY KEY (NUMUTL,IDCNTRINTERET) 
 ) engine="innoDB",
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE PEUTAVOIR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_PEUTAVOIR_UTILISATEUR
     ON PEUTAVOIR (NUMUTL ASC);

CREATE  INDEX I_FK_PEUTAVOIR_CENTREINTERET
     ON PEUTAVOIR (IDCNTRINTERET ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE MESSAGERIE 
  ADD FOREIGN KEY FK_MESSAGERIE_UTILISATEUR (NUMUTL)
      REFERENCES UTILISATEUR (NUMUTL) ;


ALTER TABLE MESSAGERIE 
  ADD FOREIGN KEY FK_MESSAGERIE_UTILISATEUR1 (NUMUTL_EMETTEUR)
      REFERENCES UTILISATEUR (NUMUTL) ;


ALTER TABLE UTILISATEUR 
  ADD FOREIGN KEY FK_UTILISATEUR_SEXE (NUMSEX)
      REFERENCES SEXE (NUMSEX) ;


ALTER TABLE UTILISATEUR 
  ADD FOREIGN KEY FK_UTILISATEUR_LANGUE (IDLANGUE)
      REFERENCES LANGUE (IDLANGUE) ;


ALTER TABLE UTILISATEUR 
  ADD FOREIGN KEY FK_UTILISATEUR_PAYS (IDPAYS)
      REFERENCES PAYS (IDPAYS) ;


ALTER TABLE UTILISATEUR 
  ADD FOREIGN KEY FK_UTILISATEUR_PAYS1 (IDPAYS_RESIDENCE)
      REFERENCES PAYS (IDPAYS) ;


ALTER TABLE MEDIA 
  ADD FOREIGN KEY FK_MEDIA_TYPEMEDIA (IDTYPMEDIA)
      REFERENCES TYPEMEDIA (IDTYPMEDIA) ;


ALTER TABLE STORY 
  ADD FOREIGN KEY FK_STORY_UTILISATEUR (NUMUTL)
      REFERENCES UTILISATEUR (NUMUTL) ;


ALTER TABLE APPARTENIR 
  ADD FOREIGN KEY FK_APPARTENIR_STORY (NUMSTRY)
      REFERENCES STORY (NUMSTRY) ;


ALTER TABLE APPARTENIR 
  ADD FOREIGN KEY FK_APPARTENIR_MEDIA (IDMEDIA)
      REFERENCES MEDIA (IDMEDIA) ;


ALTER TABLE AVOIR 
  ADD FOREIGN KEY FK_AVOIR_UTILISATEUR (NUMUTL)
      REFERENCES UTILISATEUR (NUMUTL) ;


ALTER TABLE AVOIR 
  ADD FOREIGN KEY FK_AVOIR_ABONNEMENT (NUMABONN)
      REFERENCES ABONNEMENT (NUMABONN) ;


ALTER TABLE MAITRISER 
  ADD FOREIGN KEY FK_MAITRISER_LANGUE (IDLANGUE)
      REFERENCES LANGUE (IDLANGUE) ;


ALTER TABLE MAITRISER 
  ADD FOREIGN KEY FK_MAITRISER_UTILISATEUR (NUMUTL)
      REFERENCES UTILISATEUR (NUMUTL) ;


ALTER TABLE PEUTAVOIR 
  ADD FOREIGN KEY FK_PEUTAVOIR_UTILISATEUR (NUMUTL)
      REFERENCES UTILISATEUR (NUMUTL) ;


ALTER TABLE PEUTAVOIR 
  ADD FOREIGN KEY FK_PEUTAVOIR_CENTREINTERET (IDCNTRINTERET)
      REFERENCES CENTREINTERET (IDCNTRINTERET) ;

