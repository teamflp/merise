# TRANSACTION ET VERROUILLAGES

-- Les transactions et vérrouillages Sont des concepts en gestion de base de données, pour assurer la cohérence des données dans un environnement où plusieurs
-- utilisateurs ou processus peuvent accéder nsimultanément à la meme base de données.

-- TRANSACTIONS : est un ensemble d'instructions SQL qui doivent être exécutées ensemble ou pas du tout.

-- Une transaction possède 4 proprités appelées ACID :
    
    # Atomicité : une transaction est une unité indivisible, soit toutes les instructions sont exécutées, soit aucune.
    # Cohérence : une transaction doit laisser la base de données dans un état cohérent.
    # Isolation : une transaction doit être isolée des autres transactions.
    # Durabilité : une transaction doit être durable, c'est-à-dire que les modifications apportées par une transaction doivent être persistantes.

CREATE DATABASE compte_bancaire;
USE compte_bancaire;

CREATE TABLE transactions (
    id INT AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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