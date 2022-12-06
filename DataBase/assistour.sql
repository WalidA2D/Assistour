DROP DATABASE IF EXISTS assistour;

CREATE DATABASE IF NOT EXISTS assistour;
USE assistour;
# -----------------------------------------------------------------------------
#       TABLE : TRANSPORTEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TRANSPORTEUR
 (
   IDTRANS BIGINT(4) NOT NULL  ,
   NOM CHAR(32) NULL  
   , PRIMARY KEY (IDTRANS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DATE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATE
 (
   DATE DATE NOT NULL  
   , PRIMARY KEY (DATE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ADHERANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADHERANT
 (
   NUMADH BIGINT(4) NOT NULL  ,
   NOMADH CHAR(255) NULL  ,
   PRENOMADH CHAR(32) NULL  ,
   ADRESSEADH VARCHAR(255) NULL  ,
   CODEPOSTALAHD INT(5) NULL  ,
   VILLEADH CHAR(255) NULL  ,
   TELEPHONEADH VARCHAR(10) NULL  
   , PRIMARY KEY (NUMADH) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : GARAGE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GARAGE
 (
   IDGAR BIGINT(4) NOT NULL   ,
   NOM CHAR(32) NULL  ,
   ADRESSE VARCHAR(128) NULL  ,
   MARQUE CHAR(32) NULL  ,
   FORFAIT INT(4) NULL ,
   TEL VARCHAR(10) NULL  , 
   AVANCEACCEPTE BOOLEAN NULL, 
   PRIMARY KEY (IDGAR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : TECHNICIENASSISTANCE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TECHNICIENASSISTANCE
 (
   IDTA BIGINT(4) NOT NULL  ,
   NOMTA CHAR(32) NULL  ,
   PRENOMTA CHAR(32) NULL  
   , PRIMARY KEY (IDTA) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : HOTEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HOTEL
 (
   IDHOT BIGINT(4) NOT NULL  ,
   NOM CHAR(32) NULL  ,
   ADRESSE VARCHAR(128) NULL  ,
   TEL VARCHAR(10) NULL  ,
   PRIXNUITEE int(4) NULL  
   , PRIMARY KEY (IDHOT) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       TABLE : TYPETRANSPORT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPETRANSPORT
 (
   IDTT BIGINT(4) NOT NULL  ,
   LIBELLE CHAR(32) NULL  ,
   PRIMARY KEY (IDTT)
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       TABLE : TYPECONTRAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPECONTRAT
 (
   IDTYPECONTRAT BIGINT(4) NOT NULL   ,
   NOMTYPECONTRAT CHAR(255) NULL  
   , PRIMARY KEY (IDTYPECONTRAT) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       TABLE : CONTRAT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTRAT
 (
   IDCON BIGINT(4) NOT NULL  ,
   NUMADH BIGINT(4) NOT NULL  ,
   IDTYPECONTRAT BIGINT(4) NOT NULL   ,
   PRIXNEGOCIE INT(4) NULL  ,
   IMMATRICULATION VARCHAR(255) NULL  ,
   MARQUE VARCHAR(255) NULL  ,
   TYPE VARCHAR(255) NULL  ,
   MODELE VARCHAR(255) NULL  ,
   DATEMISEENCIRCULATION DATE NULL  
   , PRIMARY KEY (IDCON),
   FOREIGN KEY(IDTYPECONTRAT) REFERENCES TYPECONTRAT(IDTYPECONTRAT) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       TABLE : DOSSIERSINISTRE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DOSSIERSINISTRE
 (
   IDDS INTEGER(4) NOT NULL  ,
   IDTA BIGINT(4) NOT NULL  ,
   IDCON BIGINT(4) NOT NULL  ,
   IDGAR BIGINT(4) NOT NULL  ,
   DATES DATE NULL  ,
   HEURES CHAR(32) NULL  ,
   CAUSE CHAR(32) NULL  ,
   DIAGNOSTIC CHAR(100) NULL  ,
   LIEU CHAR(32) NULL  ,
   NBPERSONNES INTEGER(2) NULL  
   , PRIMARY KEY (IDDS),
   FOREIGN KEY(IDCON) REFERENCES CONTRAT(IDCON) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ETAPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ETAPE
 (
   IDDS INTEGER(4) NOT NULL  ,
   NUMEROORDRE BIGINT(4) NOT NULL  ,
   IDTT BIGINT(4) NOT NULL,
   IDTRANS BIGINT(4) NOT NULL  ,
   VILLEDEPART CHAR(32) NULL  ,
   VILLEARRIVEE CHAR(32) NULL  ,
   PRIX DECIMAL(13,2) NULL  
   , PRIMARY KEY (IDDS,NUMEROORDRE) ,
   FOREIGN KEY(IDTT) REFERENCES TYPETRANSPORT(IDTT)
 ) 
 comment = "";



# -----------------------------------------------------------------------------
#       TABLE : HEBERGER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HEBERGER
 (
   DATE DATE NOT NULL  ,
   IDHOT BIGINT(4) NOT NULL  ,
   IDDS INTEGER(4) NOT NULL  ,
   NBNUITEE BIGINT(4) NULL  
   , PRIMARY KEY (DATE,IDHOT,IDDS) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : PROPOSER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS PROPOSER
 (
  IDTT BIGINT(4) NOT NULL  ,
  IDTRANS BIGINT(4) NOT NULL  ,
  PRIMARY KEY (IDTT,IDTRANS),
  FOREIGN KEY(IDTRANS) REFERENCES TRANSPORTEUR(IDTRANS) 
 )
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------



ALTER TABLE CONTRAT 
  ADD FOREIGN KEY FK_CONTRAT_ADHERANT (NUMADH)
      REFERENCES ADHERANT (NUMADH) ;


ALTER TABLE DOSSIERSINISTRE 
  ADD FOREIGN KEY FK_DOSSIERSINISTRE_TECHNICIENASSISTANCE (IDTA)
      REFERENCES TECHNICIENASSISTANCE (IDTA) ;


ALTER TABLE DOSSIERSINISTRE 
  ADD FOREIGN KEY FK_DOSSIERSINISTRE_GARAGE (IDGAR)
      REFERENCES GARAGE (IDGAR) ;


ALTER TABLE ETAPE 
  ADD FOREIGN KEY FK_ETAPE_TRANSPORTEUR (IDTRANS)
      REFERENCES TRANSPORTEUR (IDTRANS) ;


ALTER TABLE ETAPE 
  ADD FOREIGN KEY FK_ETAPE_DOSSIERSINISTRE (IDDS)
      REFERENCES DOSSIERSINISTRE (IDDS) ;


ALTER TABLE HEBERGER 
  ADD FOREIGN KEY FK_HEBERGER_DATE (DATE)
      REFERENCES DATE (DATE) ;


ALTER TABLE HEBERGER 
  ADD FOREIGN KEY FK_HEBERGER_HOTEL (IDHOT)
      REFERENCES HOTEL (IDHOT) ;


ALTER TABLE HEBERGER 
  ADD FOREIGN KEY FK_HEBERGER_DOSSIERSINISTRE (IDDS)
      REFERENCES DOSSIERSINISTRE (IDDS) ;