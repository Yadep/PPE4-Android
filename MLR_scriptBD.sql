DROP DATABASE IF EXISTS MLR3;

CREATE DATABASE IF NOT EXISTS STARSUP_BAUMARD;
USE STARSUP_BAUMARD;
# -----------------------------------------------------------------------------
#       TABLE : HEBERGEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HEBERGEMENT
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   IDSPECIALITE SMALLINT NOT NULL  ,
   IDDEPARTEMENT SMALLINT NOT NULL  ,
   ADRESSEHEBERGEMENT CHAR (32) NULL  ,
   VILLE CHAR (32) NULL  
   , PRIMARY KEY (IDHEBERGEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE HEBERGEMENT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_HEBERGEMENT_SPECIALITE
     ON HEBERGEMENT (IDSPECIALITE ASC);

CREATE  INDEX I_FK_HEBERGEMENT_DEPARTEMENT
     ON HEBERGEMENT (IDDEPARTEMENT ASC);

# -----------------------------------------------------------------------------
#       TABLE : GERANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS GERANT
 (
   IDGERANT SMALLINT NOT NULL  ,
   NOMGERANT CHAR (32) NULL  ,
   PRENOMGERANT CHAR (32) NULL  ,
   TELGERANT BIGINT NULL  ,
   ADRESSEGERANT CHAR (32) NULL  
   , PRIMARY KEY (IDGERANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : RESTAURANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS RESTAURANT
 (
   IDRESTAURANT CHAR (32) NOT NULL  ,
   IDTC SMALLINT NOT NULL  ,
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   CHEF CHAR (32) NULL  
   , PRIMARY KEY (IDRESTAURANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE RESTAURANT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_RESTAURANT_HOTEL
     ON RESTAURANT (IDHEBERGEMENT ASC);

CREATE  INDEX I_FK_RESTAURANT_TYPE_CUISINE
     ON RESTAURANT (IDTC ASC);

# -----------------------------------------------------------------------------
#       TABLE : EQUIPEMENTS
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS EQUIPEMENTS
 (
   IDEQUIPEMENT SMALLINT NOT NULL  ,
   NOMEQUIPEMENT CHAR (32) NULL  
   , PRIMARY KEY (IDEQUIPEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SAISON
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SAISON
 (
   IDSAISON SMALLINT NOT NULL  ,
   LIBSAISON CHAR (32) NULL  ,
   ANNEESAISON INTEGER NULL  
   , PRIMARY KEY (IDSAISON) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : DEPARTEMENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DEPARTEMENT
 (
   IDDEPARTEMENT SMALLINT NOT NULL  ,
   NUMDEPARTEMENT SMALLINT NULL  ,
   LIBDEPARTEMENT CHAR (32) NULL  
   , PRIMARY KEY (IDDEPARTEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : SPECIALITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS SPECIALITE
 (
   IDSPECIALITE SMALLINT NOT NULL  ,
   LIBSPECIALITE CHAR (32) NULL  
   , PRIMARY KEY (IDSPECIALITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CAMPING
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CAMPING
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   ADRESSEHEBERGEMENT CHAR (32) NULL  ,
   VILLE CHAR (32) NULL  
   , PRIMARY KEY (IDHEBERGEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : HOTEL
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HOTEL
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   ADRESSEHEBERGEMENT CHAR (32) NULL  ,
   VILLE CHAR (32) NULL  
   , PRIMARY KEY (IDHEBERGEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CONTREVISITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CONTREVISITE
 (
   IDCONTREVSITE SMALLINT NOT NULL  ,
   IDINSPECTEUR SMALLINT NOT NULL  ,
   IDDATEV SMALLINT NOT NULL  ,
   IDVISITE SMALLINT NOT NULL  ,
   COMMENTAIRECV TEXT NULL  ,
   NBETOILEMOINS SMALLINT NULL  
   , PRIMARY KEY (IDCONTREVSITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE CONTREVISITE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_CONTREVISITE_INSPECTEUR
     ON CONTREVISITE (IDINSPECTEUR ASC);

CREATE  INDEX I_FK_CONTREVISITE_DATEV
     ON CONTREVISITE (IDDATEV ASC);

CREATE  INDEX I_FK_CONTREVISITE_VISITE
     ON CONTREVISITE (IDVISITE ASC);

# -----------------------------------------------------------------------------
#       TABLE : VISITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS VISITE
 (
   IDVISITE SMALLINT NOT NULL  ,
   IDINSPECTEUR SMALLINT NULL  ,
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   IDDATEV SMALLINT NULL  ,
   COMMENTAIREV TEXT NULL  ,
   CONTREVISITE TINYINT NULL  ,
   NBETOILEPLUS SMALLINT NULL  
   , PRIMARY KEY (IDVISITE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE VISITE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_VISITE_INSPECTEUR
     ON VISITE (IDINSPECTEUR ASC);

CREATE  INDEX I_FK_VISITE_HEBERGEMENT
     ON VISITE (IDHEBERGEMENT ASC);

CREATE  INDEX I_FK_VISITE_DATEV
     ON VISITE (IDDATEV ASC);

# -----------------------------------------------------------------------------
#       TABLE : DATEV
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS DATEV
 (
   IDDATEV SMALLINT NOT NULL  ,
   IDSAISON SMALLINT NOT NULL  ,
   DATEV DATE NULL  
   , PRIMARY KEY (IDDATEV) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE DATEV
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_DATEV_SAISON
     ON DATEV (IDSAISON ASC);

# -----------------------------------------------------------------------------
#       TABLE : TYPE_CUISINE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE_CUISINE
 (
   IDTC SMALLINT NOT NULL  ,
   LIBELLETC CHAR (32) NULL  
   , PRIMARY KEY (IDTC) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : INSPECTEUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS INSPECTEUR
 (
   IDINSPECTEUR SMALLINT NOT NULL  ,
   IDSPECIALITE SMALLINT NOT NULL  ,
   NOMINSPECTEUR CHAR (32) NULL  ,
   PRENOMINSPECTEUR CHAR (32) NULL  ,
   NUMEROTEL BIGINT NULL  
   , PRIMARY KEY (IDINSPECTEUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE INSPECTEUR
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_INSPECTEUR_SPECIALITE
     ON INSPECTEUR (IDSPECIALITE ASC);

# -----------------------------------------------------------------------------
#       TABLE : CHAMBRE_HOTTE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CHAMBRE_HOTTE
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   NBCHAMBRE INTEGER NULL  ,
   CUISINE TINYINT NULL  ,
   ADRESSEHEBERGEMENT CHAR (32) NULL  ,
   VILLE CHAR (32) NULL  
   , PRIMARY KEY (IDHEBERGEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : AVOIR_GERANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS AVOIR_GERANT
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   IDGERANT SMALLINT NOT NULL  
   , PRIMARY KEY (IDHEBERGEMENT,IDGERANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE AVOIR_GERANT
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_AVOIR_GERANT_HEBERGEMENT
     ON AVOIR_GERANT (IDHEBERGEMENT ASC);

CREATE  INDEX I_FK_AVOIR_GERANT_GERANT
     ON AVOIR_GERANT (IDGERANT ASC);

# -----------------------------------------------------------------------------
#       TABLE : HISTORIQUE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS HISTORIQUE
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   IDSAISON SMALLINT NOT NULL  ,
   ETOILLE SMALLINT NULL  
   , PRIMARY KEY (IDHEBERGEMENT,IDSAISON) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE HISTORIQUE
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_HISTORIQUE_HEBERGEMENT
     ON HISTORIQUE (IDHEBERGEMENT ASC);

CREATE  INDEX I_FK_HISTORIQUE_SAISON
     ON HISTORIQUE (IDSAISON ASC);

# -----------------------------------------------------------------------------
#       TABLE : ATTRIBUER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ATTRIBUER
 (
   IDHEBERGEMENT SMALLINT NOT NULL  ,
   IDEQUIPEMENT SMALLINT NOT NULL  
   , PRIMARY KEY (IDHEBERGEMENT,IDEQUIPEMENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       INDEX DE LA TABLE ATTRIBUER
# -----------------------------------------------------------------------------


CREATE  INDEX I_FK_ATTRIBUER_CAMPING
     ON ATTRIBUER (IDHEBERGEMENT ASC);

CREATE  INDEX I_FK_ATTRIBUER_EQUIPEMENTS
     ON ATTRIBUER (IDEQUIPEMENT ASC);


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE HEBERGEMENT 
  ADD FOREIGN KEY FK_HEBERGEMENT_SPECIALITE (IDSPECIALITE)
      REFERENCES SPECIALITE (IDSPECIALITE) ;


ALTER TABLE HEBERGEMENT 
  ADD FOREIGN KEY FK_HEBERGEMENT_DEPARTEMENT (IDDEPARTEMENT)
      REFERENCES DEPARTEMENT (IDDEPARTEMENT) ;


ALTER TABLE RESTAURANT 
  ADD FOREIGN KEY FK_RESTAURANT_HOTEL (IDHEBERGEMENT)
      REFERENCES HOTEL (IDHEBERGEMENT) ;


ALTER TABLE RESTAURANT 
  ADD FOREIGN KEY FK_RESTAURANT_TYPE_CUISINE (IDTC)
      REFERENCES TYPE_CUISINE (IDTC) ;


ALTER TABLE CAMPING 
  ADD FOREIGN KEY FK_CAMPING_HEBERGEMENT (IDHEBERGEMENT)
      REFERENCES HEBERGEMENT (IDHEBERGEMENT) ;


ALTER TABLE HOTEL 
  ADD FOREIGN KEY FK_HOTEL_HEBERGEMENT (IDHEBERGEMENT)
      REFERENCES HEBERGEMENT (IDHEBERGEMENT) ;


ALTER TABLE CONTREVISITE 
  ADD FOREIGN KEY FK_CONTREVISITE_INSPECTEUR (IDINSPECTEUR)
      REFERENCES INSPECTEUR (IDINSPECTEUR) ;


ALTER TABLE CONTREVISITE 
  ADD FOREIGN KEY FK_CONTREVISITE_DATEV (IDDATEV)
      REFERENCES DATEV (IDDATEV) ;


ALTER TABLE CONTREVISITE 
  ADD FOREIGN KEY FK_CONTREVISITE_VISITE (IDVISITE)
      REFERENCES VISITE (IDVISITE) ;


ALTER TABLE VISITE 
  ADD FOREIGN KEY FK_VISITE_INSPECTEUR (IDINSPECTEUR)
      REFERENCES INSPECTEUR (IDINSPECTEUR) ;


ALTER TABLE VISITE 
  ADD FOREIGN KEY FK_VISITE_HEBERGEMENT (IDHEBERGEMENT)
      REFERENCES HEBERGEMENT (IDHEBERGEMENT) ;


ALTER TABLE VISITE 
  ADD FOREIGN KEY FK_VISITE_DATEV (IDDATEV)
      REFERENCES DATEV (IDDATEV) ;


ALTER TABLE DATEV 
  ADD FOREIGN KEY FK_DATEV_SAISON (IDSAISON)
      REFERENCES SAISON (IDSAISON) ;


ALTER TABLE INSPECTEUR 
  ADD FOREIGN KEY FK_INSPECTEUR_SPECIALITE (IDSPECIALITE)
      REFERENCES SPECIALITE (IDSPECIALITE) ;


ALTER TABLE CHAMBRE_HOTTE 
  ADD FOREIGN KEY FK_CHAMBRE_HOTTE_HEBERGEMENT (IDHEBERGEMENT)
      REFERENCES HEBERGEMENT (IDHEBERGEMENT) ;


ALTER TABLE AVOIR_GERANT 
  ADD FOREIGN KEY FK_AVOIR_GERANT_HEBERGEMENT (IDHEBERGEMENT)
      REFERENCES HEBERGEMENT (IDHEBERGEMENT) ;


ALTER TABLE AVOIR_GERANT 
  ADD FOREIGN KEY FK_AVOIR_GERANT_GERANT (IDGERANT)
      REFERENCES GERANT (IDGERANT) ;


ALTER TABLE HISTORIQUE 
  ADD FOREIGN KEY FK_HISTORIQUE_HEBERGEMENT (IDHEBERGEMENT)
      REFERENCES HEBERGEMENT (IDHEBERGEMENT) ;


ALTER TABLE HISTORIQUE 
  ADD FOREIGN KEY FK_HISTORIQUE_SAISON (IDSAISON)
      REFERENCES SAISON (IDSAISON) ;


ALTER TABLE ATTRIBUER 
  ADD FOREIGN KEY FK_ATTRIBUER_CAMPING (IDHEBERGEMENT)
      REFERENCES CAMPING (IDHEBERGEMENT) ;


ALTER TABLE ATTRIBUER 
  ADD FOREIGN KEY FK_ATTRIBUER_EQUIPEMENTS (IDEQUIPEMENT)
      REFERENCES EQUIPEMENTS (IDEQUIPEMENT) ;

