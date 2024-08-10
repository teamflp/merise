CREATE DATABASE compte_bancaire;

use compte_bancaire;

DELIMITER //

CREATE PROCEDURE transfertFonds(IN id_source INT, IN id_dest INT, IN mont_transf DECIMAL(10, 2))

BEGIN
    DECLARE montant_c2 DECIMAL(10, 2);

-- Récupérer le montant du compte de DelPierro
SELECT montant INTO montant_c2 FROM compte WHERE id_transaction = id_source;

-- Vérifier si le montant est suffisant pour le transfert
IF montant_c2 >= mont_transf THEN
        -- Commencer la transaction
    START TRANSACTION;

    -- Débiter le compte de DelPierro de 600 unités
    UPDATE compte SET montant = montant - mont_transf WHERE id_transaction = id_source;

    -- Afficher le montant actuel
        SELECT CONCAT('Montant actuel du compte', id_source, ' : ', montant_c2) AS InfoMontant FROM compte WHERE id_transaction = id_source;

    -- Créditer le compte de Meloni de 600 unités
    UPDATE compte SET montant = montant + mont_transf WHERE id_transaction = id_dest;

    -- Valider la transaction
    COMMIT;

    -- Afficher le montant après la transaction
    SELECT CONCAT('Montant après la transaction : ', montant_c2 - mont_transf) AS InfoMontant FROM compte WHERE id_transaction = id_source;

    ELSE
            -- Annuler la transaction
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Solde insuffisant pour effectuer le transfert.';
    END IF;
END //
DELIMITER ;

-- Appel de la procédure
CALL transfertFonds(1, 2, 500);

-- ****************************************************************************************************************

-- COMPTE DE DEPOT

DELIMITER //

CREATE PROCEDURE depotFonds(IN id_compte INT, IN mont_depot DECIMAL(10, 2))

BEGIN
    SELECT mont_depot AS MontantDepotVerifie;

    -- Vérifier si le montant est suffisant pour le transfert
    IF mont_depot > 10 THEN
        -- Commencer la transaction
        START TRANSACTION;

        -- Débiter le compte de DelPierro de 600 unités
        UPDATE compte SET montant = montant + mont_depot WHERE id_transaction = id_compte;

        -- Afficher le montant actuel
        SELECT CONCAT('Dépot de ', mont_depot, ' effectué. Nouveau solde du compte (ID:  ', id_compte,'): ', montant) AS NouveauSolde FROM compte WHERE id_transaction = id_compte;
    ELSE
        -- Si le montant de dépot n'est pas positif, générer une erreur
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le montant de dépot doit etre positif.';
    END IF;
END //
DELIMITER ;

-- Appel de la procédure
CALL depotFonds(2, 1100.00);

DROP PROCEDURE IF EXISTS depotFonds;

SELECT * FROM compte;

-- SHOW GRANTS FOR CURRENT_USER;


-- SELECT VERSION();

-- SET GLOBAL
-- log_bin_trust_function_creators = 1;

CREATE DATABASE compte2 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE compte2;

DELIMITER //

CREATE PROCEDURE ajouter_transaction(
    IN nom VARCHAR(100),
    IN prenom VARCHAR(100),
    IN email VARCHAR(100)
)
BEGIN
    INSERT INTO transactions (nom, prenom, email) VALUES (nom, prenom, email);
    INSERT INTO compte (id_transaction, montant) VALUES (LAST_INSERT_ID(), 0);
    SELECT CONCAT('Transaction créée avec succès. Transaction ID : ', LAST_INSERT_ID()) AS InfoTransaction;

    -- Afficher les comptes créés
    SELECT * FROM transactions;
END //
DELIMITER ;

CALL ajouter_transaction('Ronaldo', 'Cristiano', 'ronaldo@gmail.com');

-- **************************************************************************************************************** --

-- Cette procédure stockée permet de créer des tables avec des colonnes et des clés étrangères

DELIMITER //

CREATE PROCEDURE CreateTable(
    IN tableName VARCHAR(100),
    IN columns TEXT,   -- Colonne : type (formaté comme 'nom_colonne:type:taille')
    IN foreignKeys TEXT -- Clés étrangères (formaté comme 'colonne:table_referencée(colonne_referencée)')
)
BEGIN
    DECLARE createTableSQL TEXT DEFAULT '';
    DECLARE colDefinition TEXT DEFAULT '';
    DECLARE foreignKeyDefinition TEXT DEFAULT '';
    DECLARE col TEXT;
    DECLARE colName TEXT;
    DECLARE colType TEXT;
    DECLARE colSize TEXT;

    -- Ajout automatique de la colonne ID
    SET colDefinition = 'id INT AUTO_INCREMENT PRIMARY KEY';

    -- Gestion des colonnes
    WHILE LOCATE(',', columns) > 0 DO
            SET col = SUBSTRING_INDEX(columns, ',', 1);
            SET columns = SUBSTRING(columns, LOCATE(',', columns) + 1);

            SET colName = TRIM(SUBSTRING_INDEX(col, ':', 1));
            SET colType = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(col, ':', 2), ':', -1));
            SET colSize = TRIM(SUBSTRING_INDEX(col, ':', -1));

            IF colType = 'varchar' THEN
                SET colType = CONCAT('VARCHAR(', colSize, ')');
            ELSEIF colType = 'int' THEN
                SET colType = 'INT';
            ELSEIF colType = 'text' THEN
                SET colType = 'TEXT';
            ELSEIF colType = 'decimal' THEN
                SET colType = CONCAT('DECIMAL(', colSize, ')');
            ELSEIF colType = 'date' THEN
                SET colType = 'DATE';
            END IF;

            SET colDefinition = CONCAT(colDefinition, ', ', colName, ' ', colType);
        END WHILE;

    -- Ajouter la dernière colonne après la boucle
    SET colName = TRIM(SUBSTRING_INDEX(columns, ':', 1));
    SET colType = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(columns, ':', 2), ':', -1));
    SET colSize = TRIM(SUBSTRING_INDEX(columns, ':', -1));

    IF colType = 'varchar' THEN
        SET colType = CONCAT('VARCHAR(', colSize, ')');
    ELSEIF colType = 'int' THEN
        SET colType = 'INT';
    ELSEIF colType = 'text' THEN
        SET colType = 'TEXT';
    ELSEIF colType = 'decimal' THEN
        SET colType = CONCAT('DECIMAL(', colSize, ')');
    ELSEIF colType = 'date' THEN
        SET colType = 'DATE';
    END IF;

    SET colDefinition = CONCAT(colDefinition, ', ', colName, ' ', colType);

    -- Ajout des clés étrangères
    IF foreignKeys IS NOT NULL AND foreignKeys != '' THEN
        WHILE LOCATE(',', foreignKeys) > 0 DO
                SET col = SUBSTRING_INDEX(foreignKeys, ',', 1);
                SET foreignKeys = SUBSTRING(foreignKeys, LOCATE(',', foreignKeys) + 1);

                SET colName = TRIM(SUBSTRING_INDEX(col, ':', 1));
                SET colType = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(col, ':', 2), '(', 1));
                SET colSize = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(col, '(', -1), ')', 1));

                SET foreignKeyDefinition = CONCAT(foreignKeyDefinition, ', FOREIGN KEY (', colName, ') REFERENCES ', colType, '(', colSize, ')');
            END WHILE;

        -- Ajouter la dernière clé étrangère après la boucle
        SET colName = TRIM(SUBSTRING_INDEX(foreignKeys, ':', 1));
        SET colType = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(foreignKeys, ':', 2), '(', 1));
        SET colSize = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(foreignKeys, '(', -1), ')', 1));

        SET foreignKeyDefinition = CONCAT(foreignKeyDefinition, ', FOREIGN KEY (', colName, ') REFERENCES ', colType, '(', colSize, ')');
    END IF;

    -- Création de la commande SQL complète
    SET createTableSQL = CONCAT('CREATE TABLE IF NOT EXISTS ', tableName, ' (', colDefinition, foreignKeyDefinition, ');');

    -- Debug : afficher la commande SQL complète
    SELECT createTableSQL AS debug_sql;

    -- Préparer et exécuter la commande SQL
    PREPARE stmt FROM createTableSQL;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Informer l'utilisateur que les opérations ont été effectuées
    SELECT CONCAT('Table "', tableName, '" créée ou déjà existante.') AS Result;
END //

DELIMITER ;


-- Appel de la procédure

CALL CreateTable('clients', 'nom:varchar:100, prenom:varchar:100, email:varchar:100', 'id_transaction:transactions(id)');
CALL CreateTable('comptes', 'montant:decimal:10, id_transaction:int', 'id_transaction:transactions(id)');
CALL CreateTable('transactions', 'nom:varchar:100, prenom:varchar:100, email:varchar:100', '');