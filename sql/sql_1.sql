-- CREATE DATABASE nom_de_la_base;
-- CREATE TABLE nom_de_la_table (); Entité a des attributs( colonnes)
-- USE nom_de_la_base; Permet de selectionner la base de données
-- SHOW DATABASES : permet de voir les bases de données
-- SHOW TABLES: permet de voir les tables
-- INSERT INTO / Permet d'ajouter des données dans une table
-- UPDATE : Permet de modifier des données dans une table
-- DELETE : Permet de supprimer des données dans une table
-- DROP DATABASE : Permet de supprimer définitivement une base de données
-- DROP TABLE : Permet de supprimer définitivement une table
-- DROP COLUMN : Permet de supprimer une colonne
-- TRUNCATE TABLE : Permet de vider ou réinitialiser une table
-- EXPLAIN : Permet de voir comment la requête est exécutée
-- ALTER TABLE : Permet de modifier une table
    -- ADD COLUMN : Permet d'ajouter une colonne
    -- MODIFY COLUMN : Permet de modifier une colonne
-- GROUP BY nom_colonne ASC ou DESC : Permet de regrouper les données par ordre croissant ou décroissant
-- LIMIT : Permet de limiter le nombre de données affichées
-- INNER JOIN
-- UPPER() : Permet de mettre en majuscule

-- use dwwm;

-- Utilisation de la fonction jointure CROSS JOIN : permet de faire une jointure entre deux tables

-- SELECT * FROM stagiaires CROSS JOIN notes CROSS JOIN matieres

-- SELECT stagiaires.nom, stagiaires.prenom, notes.note FROM stagiaires CROSS JOIN notes

-- La fonction UPPER() : permet de mettre en majuscule

-- SELECT UPPER(nom) AS NOM, prenom FROM stagiaires;
-- La fonction LOWER() : permet de mettre en minuscule
-- création d'une colonne email dans la table stagiaires

-- ALTER TABLE stagiaires ADD COLUMN role VARCHAR(100);

-- UPDATE stagiaires SET role = 'Stagiaire' WHERE id = 1;

-- UPDATE stagiaires SET role = 'Stagiaire' WHERE id = 1;

-- La fonction CONCAT() : permet de concaténer deux colonnes
-- SELECT CONCAT(nom,' ', prenom) AS email FROM stagiaires; -- affiche les noms et prénoms concaténés
-- SELECT id, CONCAT(nom,' ', prenom, ' est un stagiaire', role) AS info_stagiaire FROM stagiaires; -- affiche les noms et prénoms concaténés avec l'id du stagiaire

-- L a clause CASE : permet de faire des conditions
-- Les 2 formes de la clause CASE :
    -- 1. la forme simple   : Elle permet de comparer une colonne à une valeur
        -- Syntaxe:


UPDATE  stagiaires
SET role = CASE
    WHEN id = 1 THEN 'Stagiaire'
    WHEN id = 2 THEN 'Formateur'
    WHEN id = 3 THEN 'Formateur'
    WHEN id = 4 THEN 'formateur'
    WHEN id = 5 THEN 'Stagiaire'
    WHEN id = 6 THEN 'Stagiaire'
    WHEN id = 7 THEN 'Stagiaire'
    WHEN id = 8 THEN 'Stagiaire'
    WHEN id = 9 THEN 'Stagiaire'
    ELSE 'Stagiaire'
END
WHERE id IN (1, 2, 3, 4, 5, 6, 7, 8, 9);

-- INSERT INTO :

    INSERT INTO stagiaires (nom, prenom, telephone, email, age, role)
    -- VALUES ('DelPierro', 'Alessandro', '0606060606', 'alessandro@gmail.com', 45, CASE WHEN id=10 THEN 'Stagiaire' ELSE 'Formateur' END);
    VALUES ('Meloni', 'Giorgia', '0606060606', 'melon@gmail.com', 60, CASE WHEN 10 % 2 THEN 'Stagiaire' ELSE 'Formateur' END);

-- DELETE avec la clause CASE:
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM stagiaires
WHERE id = CASE
    WHEN id = 5 THEN 5
    WHEN id = 2 AND role = 'Formateur' THEN 2
    ELSE 0 -- Valeur par defaut qui ne correspond à aucun id
END;

-- SELECT avec CASE:
    SELECT nom, prenom, age, CASE
        WHEN age < 20 THEN 'Mineur'
        WHEN age >= 20 AND age < 30 THEN 'Jeune'
        WHEN age >= 30 AND age < 40 THEN 'Adulte'
        ELSE 'Senior'
    END AS categorie_age
    FROM stagiaires;

-- Afficher les stagiaires qui ont un age supérieur à 30 ans en utilisant case
    SELECT nom, prenom, age, CASE
        WHEN age > 30 THEN 'Senior'
        ELSE 'Junior'
    END AS categorie_age
    FROM stagiaires;



-- Créer 2 tables : users et commandes
    -- Créer une base de données : ecommerce
    -- Attributs de la table users : id, nom, prenom, email, telephone
    -- Attributs de la table commandes : id, id_user, date_commande, montant
    -- Insérer des données dans les tables users et commandes (5 utilisateurs et 10 commandes)
    -- Faire une jointure entre les deux tables : INNER JOIN
    -- Utiliser la clause CASE pour afficher les utilisateurs qui ont passé des commandes supérieures à 1000 euros
    -- Utiliser la clause GROUP BY pour regrouper les utilisateurs par montant de commande
    -- Utiliser la clause HAVING pour afficher les utilisateurs qui ont passé des commandes supérieures à 500 euros
    -- modifier uses pour ajouter une colonne roles et mettre à jour les roles des utilisateurs (2 admin et 3 user)
    -- Utiliser la clause CASE pour afficher les utilisateurs qui ont le role administrateurs
    -- Utiliser la clause CASE pour afficher les utilisateurs qui ont le role utilisateurs



-- SELECT LOWER(nom) AS NOM, prenom FROM stagiaires;

-- SELECT * FROM stagiaires;

-- CREATION DE LA BASE DE DONNEES

-- CREATE DATABASE ecommerce;
-- USE ecommerce;

SELECT DATE_FORMAT(date_publication, '%d/%m/%Y') AS date_emprunt FROM livres;

CREATE TABLE users (
    id INT AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE commandes (
    id INT AUTO_INCREMENT,
    id_user INT,
    date_commande DATE,
    montant DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (id_user) REFERENCES users(id)
);

-- On rentre les données dans la table users et commandes.


INSERT INTO users (nom, prenom, email)
VALUES
('DelPierro', 'Alessandro', 'admin@gmail.com'),
('Meloni', 'Giorgia', 'admin@gmail.com'),
('Pirlo', 'Andrea', 'admin@gmail.com'),
('Buffon', 'Gianluigi', 'admin@gmail.com'),
('Nesta', 'Alessandro', 'admin@gmail.com');

-- On rentre les données dans la table commandes
TRUNCATE TABLE commandes;

INSERT INTO commandes (id_user, date_commande, montant)
VALUES
    (1, STR_TO_DATE('01-01-2021', '%d-%m-%Y'), 1000),
    (2, STR_TO_DATE('02-01-2021', '%d-%m-%Y'), 2000),
    (3, STR_TO_DATE('03-01-2021', '%d-%m-%Y'), 3000),
    (4, STR_TO_DATE('04-01-2021', '%d-%m-%Y'), 4000),
    (5, STR_TO_DATE('05-01-2021', '%d-%m-%Y'), 5000),
    (1, STR_TO_DATE('06-01-2021', '%d-%m-%Y'), 6000),
    (2, STR_TO_DATE('07-01-2021', '%d-%m-%Y'), 7000),
    (3, STR_TO_DATE('08-01-2021', '%d-%m-%Y'), 8000),
    (4, STR_TO_DATE('09-01-2021', '%d-%m-%Y'), 9000),
    (5, STR_TO_DATE('10-01-2021', '%d-%m-%Y'), 10000);


SELECT * FROM users;

SELECT * FROM commandes;

SELECT nom, prenom, montant, DATE_FORMAT(date_commande, '%d/%m/%Y') AS Commandé_le FROM users INNER JOIN commandes ON users.id = commandes.id_user;

SELECT nom, prenom, montant, date_commande FROM users INNER JOIN commandes ON users.id = commandes.id_user WHERE montant > 1000;

-- Une fonction en SQL est une instruction qui permet de réaliser une tâche spécifique.

-- Les types de fonctions SQL:
    -- LENGTH() : permet de connaitre la longueur d'une chaine de caractères
    -- SUBSTRING() : permet de récupérer une partie d'une chaine de caractères
    -- REPLACE  : permet de remplacer une chaine de caractères par une autre
    -- TRIM() : permet de supprimer les espaces en début et en fin de chaine de caractères
    -- LEFT() : permet de récupérer les n premiers caractères d'une chaine de caractères
    -- RIGHT() : permet de récupérer les n derniers caractères d'une chaine de caractères
    -- REVERSE() : permet de renverser une chaine de caractères
    -- DATE : permet de récupérer la date
    -- CURDATE() : permet de récupérer la date courante
    -- NOW() : permet de récupérer la date et l'heure courante
    -- DAY() : permet de récupérer le jour
    -- MONTH() : permet de récupérer le mois
    -- YEAR() : permet de récupérer l'année
    -- HOUR() : permet de récupérer l'heure
    -- DATE_FORMAT() : permet de formater la date
    -- STR_TO_DATE() : permet de convertir une chaine de caractères en date
    -- CEIL() : permet d'arrondir un nombre à l'entier supérieur
    -- FLOOR() : permet d'arrondir un nombre à l'entier inférieur

-- LES FONCTIONS DE CHAINES DE CARACTERES :
    -- LENGTH() : permet de connaitre la longueur d'une chaine de caractères
    -- SUBSTRING() : permet de récupérer une partie d'une chaine de caractères
    -- REPLACE  : permet de remplacer une chaine de caractères par une autre
    -- TRIM() : permet de supprimer les espaces en début et en fin de chaine de caractères
    -- LEFT() : permet de récupérer les n premiers caractères d'une chaine de caractères
    -- RIGHT() : permet de récupérer les n derniers caractères d'une chaine de caractères
    -- REVERSE() : permet de renverser une chaine de caractères
    -- CONCAT() : permet de concaténer plusieurs chaînes de caractères
    -- UPPER() : permet de mettre en majuscule
    -- LOWER() : permet de mettre en minuscule
    -- UCASE() : permet de mettre en majuscule la première lettre de chaque mot de la chaine

-- LES FONCTIONS DE DATE ET HEURE :
    -- DATE : permet de récupérer la date
    -- CURDATE() : permet de récupérer la date courante
    -- NOW() : permet de récupérer la date et l'heure courante
    -- DAY() : permet de récupérer le jour
    -- MONTH() : permet de récupérer le mois
    -- YEAR() : permet de récupérer l'année
    -- HOUR() : permet de récupérer l'heure
    -- DATE_FORMAT() : permet de formater la date
    -- STR_TO_DATE() : permet de convertir une chaine de caractères en date

-- ********************************************************************************************************************
use dwwm;
-- LA FONCTION LENGTH() : permet de connaitre la longueur d'une chaine de caractères. La fonction LENGTH()acceote un seul argument qui est une chaine de caractère.
-- Exemple :
SELECT LENGTH('Bonjour') AS longueur; -- affiche 7

SELECT * FROM stagiaires;

SELECT LENGTH(nom) FROM stagiaires; -- affiche la longueur des noms des stagiaires

SELECT nom, prenom, LENGTH(CONCAT(nom, prenom)) AS Longeur FROM stagiaires; -- affiche la longueur des noms et prénoms concaténés

-- LA FONCTION SUBSTRING() : permet de récupérer une partie d'une chaine de caractères et accepte 3 arguments : la chaine de caractères, la position de départ et le nombre de caractères à récupérer.

-- Exemple :

SELECT SUBSTRING('Bonjour', 3, 6) AS sous_chaine; -- affiche Bonj

SELECT SUBSTRING(nom, 1, 3) FROM stagiaires; -- affiche les 3 premiers caractères des noms des stagiaires

SELECT nom, prenom, CONCAT(SUBSTRING(nom, 2, 3), SUBSTRING(prenom, 2, 3)) AS sous_chaine FROM stagiaires; -- affiche les 3 premiers caractères des noms et prénoms des stagiaires concaténés

SELECT nom, prenom, note, CONCAT(SUBSTRING(nom, 1, 3), SUBSTRING(prenom, 1, 3), note) AS sous_chaine FROM stagiaires INNER JOIN notes ON stagiaires.id = notes.id_stagiaire; -- affiche les 3 premiers caractères des noms et prénoms des stagiaires concaténés avec les notes

-- 'Bonjour' : chaine de caractères
-- 1 : position de départ
-- 3 : nombre de caractères à récupérer

-- LA FONCTION REPLACE() : permet de remplacer une chaine de caractères par une autre et accepte 3 arguments : la chaine de caractères, la chaine à remplacer et la chaine de remplacement.

-- Exemple :

SELECT REPLACE('Ciao tout le monde', 'Ciao', 'Bonjour') AS chaine_remplacee; -- affiche Bonjour tout le monde

SELECT nom, prenom, REPLACE(nom, 'a', ' A') AS nom_remplace, REPLACE(prenom, 'a', ' A') FROM stagiaires; -- affiche les noms des stagiaires avec les 'a' remplacés par des 'A'

-- 'Hello tout le monde' : chaine de caractères
-- 'Hello' : chaine à remplacer
-- 'Bonjour' : chaine de remplacement

-- LA FONCTION TRIM() : permet de supprimer les espaces en début et en fin de chaine de caractères.

-- Exemple :
 SELECT (' Bonjour '); -- affiche Bonjour

    SELECT TRIM(' Bonjour ') AS chaine_sans_espaces; -- affiche Bonjour

    SELECT * FROM stagiaires;

    SELECT TRIM(nom) AS nom_sans_espaces FROM stagiaires; -- affiche les noms des stagiaires sans espaces

INSERT INTO stagiaires(nom, prenom, email, telephone, age) VALUES (TRIM(' DelPierro '), TRIM(' Mateo '), TRIM(' mateo@gmail.com '), TRIM(' 0606060606 '), 45);

-- LA FONCTION LEFT() : permet de récupérer les n premiers caractères d'une chaine de caractères et accepte 2 arguments : la chaine de caractères et le nombre de caractères à récupérer.
-- RIGHT() : permet de récupérer les n derniers caractères d'une chaine de caractères et accepte 2 arguments : la chaine de caractères et le nombre de caractères à récupérer.

-- Example :

SELECT LEFT('Bonjour', 4) AS chaine_gauche; -- affiche Bon

SELECT LEFT(NOM, 5) FROM stagiaires; -- affiche les 4 premiers caractères des noms des stagiaires

SELECT RIGHT(prenom, 3) FROM stagiaires; -- affiche les 3 derniers caractères des prénoms des stagiaires

-- SUBSTRING(), REPLACE() et LENGTH()
SELECT s.nom, s.prenom, s.age, SUBSTRING(REPLACE(TRIM(s.nom), 'a', 'A'), 1, 5) AS nomMod, LENGTH(TRIM(s.prenom)) AS L_prenom, CONCAT(TRIM(s.nom), ' ', TRIM(s.prenom)) AS NomprenConcat, LEFT(s.email, 3) AS EmailDebut, CONCAT(LEFT(s.telephone, 3), REPEAT('*', 4), RIGHT(s.telephone, LENGTH(s.telephone) - 7)) AS TelMasque, CASE WHEN s.age >= 18 THEN 'Majeur' ELSE 'Mineur' END AS Statut, n.note FROM stagiaires s INNER JOIN notes n ON s.id = n.id_stagiaire;


-- LA FONCTION REVERSE() : permet de renverser une chaine de caractères et accepte un seul argument qui est une chaine de caractères.

-- Exemple :

SELECT REVERSE('Bonjour papa') AS Inverse;

SELECT REVERSE(CONCAT(nom, ' ', prenom)) AS nom_inverse FROM stagiaires; -- affiche les noms et prénoms des stagiaires inversés

SELECT CONCAT(REVERSE(prenom), ' ', REVERSE(nom)) AS nom_inverse FROM stagiaires; -- affiche les noms et prénoms des stagiaires inversés

SELECT REVERSE('Bonjour') AS chaine_inverse; -- affiche ruojnoB


-- LES FONCTIONS DE DATE ET HEURE :
    -- DATE : permet de récupérer la date
    -- CURDATE() : permet de récupérer la date courante
    -- NOW() : permet de récupérer la date et l'heure courante
    -- DAY() : permet de récupérer le jour
    -- TIME() : permet de récupérer l'heure
    -- DAY() : permet de récupérer le jour
    -- MONTH() : permet de récupérer le mois
    -- YEAR() : permet de récupérer l'année
    -- HOUR() : permet de récupérer l'heure
    -- DATE_FORMAT() : permet de formater la date
    -- STR_TO_DATE() : permet de convertir une chaine de caractères en date

-- LA FONCTION DATE : permet de récupérer la date

-- Exemple :

-- DATE :
SELECT DATE('2024-07-30 14:11:30') AS date; -- affiche 2024-07-30

-- NOW() :
SELECT NOW() AS date; -- affiche la date courante

-- CURDATE() :
SELECT CURDATE() AS date; -- affiche la date courante

-- LA FONCTION DAY() : permet de récupérer le jour
SELECT DAY('2024-07-30') AS jour; -- affiche le jour
SELECT TIME('2024-07-30 14:11:30') AS Heure;
SELECT MONTH('2024-07-30') AS Mois;
SELECT YEAR('2024-07-30') AS Année;
SELECT HOUR('2024-07-30 14:11:30') AS HEURE;
SELECT MINUTE('2024-07-30 14:11:30') AS Minute;
SELECT SECOND('2024-07-30 14:11:30') AS Second;

SELECT DATE_ADD('2024-07-30', INTERVAL 1103565 DAY) AS date_plus_un_jour; -- affiche 2024-07-31

-- DATE_FORMAT() : permet de formater la date
SELECT DATE_FORMAT('2024-07-30', '%W %d %M %Y') AS date_format; -- affiche 30/07/2024

use ecommerce;

SELECT * FROM commandes;

SELECT * FROM users;

SELECT nom, prenom, montant, DATE_FORMAT(date_commande, '(%d-%m-%Y)') AS Commandé_le FROM users INNER JOIN commandes ON users.id = commandes.id_user;

-- LA FONCTION STR_TO_DATE() : permet de convertir une chaine de caractères en date
SELECT STR_TO_DATE('30/07/2024', '%d/%m/%Y') AS date; -- affiche 2024-07-30

-- CREATION D'UTILISATEUR EN BASE DE DONNEES : INSERT, UPDATE, DELETE
   -- CREATE USER 'nom_utilisateur'@'localhost' IDENTIFIED BY 'mot_de_passe';
-- GRANT ALL PRIVILEGES ON dwwm.* TO 'paterne'@'localhost'; attribue tous les privilèges à l'utilisateur paterne sur la base de données dwwm

-- GRANT SELECT, INSERT, UPDATE, DELETE ON dwwm.* TO 'paterne'@'localhost'; attribue les privilèges de sélection, d'insertion, de mise à jour et de suppression à l'utilisateur paterne sur la base de données dwwm

-- PRIVILEGES D'ADMINISTRATION
    -- GRANT CREATE, DROP, ALTER, INDEX ON dwwm.* TO 'paterne'@'localhost'; attribue tous les privilèges à l'utilisateur paterne sur toutes les bases de données

-- REVOQUER LES PRIVILEGES
    -- REVOKE ALL PRIVILEGES ON dwwm.* FROM 'paterne'@'localhost'; révoque tous les privilèges de l'utilisateur paterne sur la base de données dwwm

-- FLUSH PRIVILEGES; -- permet de recharger les privilèges

-- VOIR LES UTILISATEURS CONNECTES DANS MYSQL
    SELECT * FROM information_schema.processlist; -- affiche les utilisateurs connectés et les requêtes en cours
    SHOW PROCESSLIST; -- affiche les utilisateurs connectés et les requêtes en cours

    SELECT CURRENT_USER() AS UtilisateurConnecte; -- affiche l'utilisateur connecté
    SHOW GRANTS FOR 'paterne'@'localhost'; -- affiche les privilèges de l'utilisateur paterne
    REVOKE ALL ON dwwm.* FROM 'paterne'@'localhost'; -- rétire tous les privilèges de l'utilisateur paterne sur la base de données dwwm
    FLUSH PRIVILEGES; -- permet de recharger les privilèges

-- TRANSACTION ET VERROUILLAGES --
-- Sont des concepts en gestion de base de données, pour assurer la cohérence des données dans un environnement où plusieurs
-- utilisateurs ou processus peuvent accéder nsimultanément à la meme base de données.

-- TRANSACTIONS : est un ensemble d'instructions SQL qui doivent être exécutées ensemble ou pas du tout.

-- Une transaction possède 4 proprités appelées ACID :
    -- Atomicité : une transaction est une unité indivisible, soit toutes les instructions sont exécutées, soit aucune.
    -- Cohérence : une transaction doit laisser la base de données dans un état cohérent.
    -- Isolation : une transaction doit être isolée des autres transactions.
    -- Durabilité : une transaction doit être durable, c'est-à-dire que les modifications apportées par une transaction doivent être persistantes.

CREATE DATABASE compte_bancaire;
USE compte_bancaire;

CREATE TABLE transactions (
    id INT AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE compte (
    id INT AUTO_INCREMENT,
    id_transaction INT,
    montant DECIMAL(10, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (id_transaction) REFERENCES transactions(id)
);

INSERT INTO transactions (nom, prenom, email)
VALUES ('DelPierro', 'Alessandro', 'alessandro@gmail.com'),
       ('Meloni', 'Giorgia', 'meloni@gmail.com');

SELECT * FROM transactions;

-- SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO compte (id_transaction, montant) VALUES (1, 1000), (2, 1500);

SELECT * FROM compte;

-- Supposons transférer 200 euros du compte de DelPierro vers le compte de Meloni

-- TRANSACTION

-- démarre la transaction
-- START TRANSACTION;

-- UPDATE compte SET montant = montant - 200 WHERE id_transaction = 1;
-- UPDATE compte SET montant = montant + 200 WHERE id_transaction = 2;

--- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ --

CREATE DATABASE compte_bancaire;
USE compte_bancaire;

DELIMITER

CREATE PROCEDURE transfert_fonds(IN id_sour INT, IN id_dest INT, IN mont_transf DECIMAL(10, 2))

BEGIN
    DECLARE montant_c2 DECIMAL(10, 2);

    -- Récupérer le montant du compte de DelPierro
    SELECT montant INTO montant_c2 FROM compte WHERE id_transaction = id_sour;

    -- Vérifier si le montant est suffisant pour le transfert
    IF montant_c2 >= mont_transf THEN
        -- Commencer la transaction
        START TRANSACTION;

        -- Débiter le compte de DelPierro de 600 unités
        UPDATE compte SET montant = montant - mont_transf WHERE id_transaction = id_source;

        -- Créditer le compte de Meloni de 600 unités
        UPDATE compte SET montant = montant + mont_transf WHERE id_transaction = id_dest;

        -- Valider la transaction
        COMMIT;
    ELSE
        -- Annuler la transaction
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solde insuffisant pour effectuer le transfert.';
    END IF;
END

DELIMITER ;

-- Appel de la procédure
CALL transfert_fonds(1, 2, 200);

-- ****************************************************************************************************************

SELECT * FROM compte;

DROP PROCEDURE IF EXISTS transf_fonds;

SELECT DATABASE();

SHOW PROCEDURE STATUS WHERE Db = 'compte_bancaire'; -- Permet de voir l'état de la base de données

SHOW CREATE PROCEDURE transf_fonds;

SELECT * FROM transactions;






