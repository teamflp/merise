CREATE DATABASE AltaEpress;
USE AltaEpress;

-- CREATION DES TABLES :
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS types_de_trains (
    type_de_train_id INT PRIMARY KEY,
    description TEXT
);

CREATE TABLE IF NOT EXISTS gares (
    gare_id INT PRIMARY KEY,
    nom_de_la_gare VARCHAR(100),
    adresse VARCHAR(100),
    ville VARCHAR(100),
    etat VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS nom_de_la_gare (
    nom_de_la_gare_id INT PRIMARY KEY,
    nom VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS trains (
    numero_de_train INT PRIMARY KEY,
    type_de_train INT,
    capacite INT,
    FOREIGN KEY (type_de_train) REFERENCES types_de_trains(type_de_train_id)
);

CREATE TABLE IF NOT EXISTS horaires (
    id INT PRIMARY KEY,
    numero_de_train INT,
    gare_id INT,
    heure_de_depart DATETIME,
    heure_d_arrivee DATETIME,
    FOREIGN KEY (numero_de_train) REFERENCES trains(numero_de_train),
    FOREIGN KEY (gare_id) REFERENCES gares(gare_id)
);

CREATE TABLE IF NOT EXISTS passagers (
    passager_id INT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_de_naissance DATE,
    email VARCHAR(100),
    telephone VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS reservations (
    id INT PRIMARY KEY,
    passager_id INT,
    numero_de_train INT,
    date_de_reservation DATE,
    FOREIGN KEY (passager_id) REFERENCES passagers(passager_id),
    FOREIGN KEY (numero_de_train) REFERENCES trains(numero_de_train)
);

CREATE TABLE IF NOT EXISTS billets (
    ticket_id INT PRIMARY KEY,
    reservation_id INT,
    emplacement VARCHAR(100),
    prix DECIMAL,
    FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);

CREATE TABLE IF NOT EXISTS itineraires (
    itineraire_id INT PRIMARY KEY,
    gare_de_depart_id INT,
    gare_d_arrivee_id INT,
    distance DECIMAL,
    FOREIGN KEY (gare_de_depart_id) REFERENCES gares(gare_id),
    FOREIGN KEY (gare_d_arrivee_id) REFERENCES gares(gare_id)
);

CREATE TABLE IF NOT EXISTS commentaires_passagers (
    commentaire_id INT PRIMARY KEY,
    passager_id INT,
    numero_de_train INT,
    commentaire VARCHAR(100),
    evaluation INT,
    FOREIGN KEY (passager_id) REFERENCES passagers(passager_id),
    FOREIGN KEY (numero_de_train) REFERENCES trains(numero_de_train)
);

-- INSERTION DES DONNEES DANS LES DIFFERENTES TABLES

-- Insertion pour la table gares
INSERT INTO gares (gare_id, nom_de_la_gare, adresse, ville, etat)
VALUES
      (1, 'Gare Centrale Berlin', 'Platz der Republik', 'Berlin', 'Berlin'),
      (2, 'Gare Centrale Vienne', 'Alfred-Adler-Straße 107', 'Vienne', 'Vienne'),
      (3, 'Gare Nord Berlin', 'Invalidenstraße 125', 'Berlin', 'Berlin'),
      (4, 'Gare Est Berlin', 'Am Ostbahnhof 9', 'Berlin', 'Berlin'),
      (5, 'Gare Sud Vienne', 'Sonnwendgasse 21', 'Vienne', 'Vienne'),
      (6, 'Gare Ouest Berlin', 'Wilmersdorfer Straße', 'Berlin', 'Berlin'),
      (7, 'Gare Ouest Vienne', 'Felberstraße 1', 'Vienne', 'Vienne'),
      (8, 'Gare Mitte Berlin', 'Friedrichstraße 142', 'Berlin', 'Berlin'),
      (9, 'Gare Sud Berlin', 'Yorckstraße 12', 'Berlin', 'Berlin'),
      (10, 'Gare Centrale Potsdam', 'Friedrich-Engels-Straße 4', 'Potsdam', 'Brandenburg');


-- Insertion pour la table nom_de_la_gare
INSERT INTO nom_de_la_gare (nom_de_la_gare_id, nom)
VALUES
    (1, 'Gare Centrale Berlin'),
    (2, 'Gare Centrale Vienne'),
    (3, 'Gare Nord Berlin'),
    (4, 'Gare Est Berlin'),
    (5, 'Gare Sud Vienne'),
    (6, 'Gare Ouest Berlin'),
    (7, 'Gare Ouest Vienne'),
    (8, 'Gare Mitte Berlin'),
    (9, 'Gare Sud Berlin'),
    (10, 'Gare Centrale Potsdam');

-- Insertion pour la table types_de_trains
INSERT INTO types_de_trains (type_de_train_id, description)
VALUES
    (1, 'TGV'),
    (2, 'ICE'),
    (3, 'Regional Express'),
    (4, 'Night Train'),
    (5, 'Intercity'),
    (6, 'Freight Train'),
    (7, 'High-speed Rail'),
    (8, 'Suburban Train'),
    (9, 'Metro'),
    (10, 'Express');

-- Insertion pour la table trains
INSERT INTO trains (numero_de_train, type_de_train, capacite)
VALUES
    (1, 1, 300),
    (2, 2, 250),
    (3, 3, 200),
    (4, 4, 150),
    (5, 5, 350),
    (6, 6, 100),
    (7, 7, 400),
    (8, 8, 500),
    (9, 9, 600),
    (10, 10, 450);

-- Insertion pour la table horaires
INSERT INTO horaires (id, numero_de_train, gare_id, heure_de_depart, heure_d_arrivee)
VALUES
      (1, 1, 1, '2024-08-02 08:00:00', '2024-08-02 12:00:00'),
      (2, 2, 2, '2024-08-02 09:00:00', '2024-08-02 13:00:00'),
      (3, 3, 3, '2024-08-02 10:00:00', '2024-08-02 14:00:00'),
      (4, 4, 4, '2024-08-02 11:00:00', '2024-08-02 15:00:00'),
      (5, 5, 5, '2024-08-02 12:00:00', '2024-08-02 16:00:00'),
      (6, 6, 6, '2024-08-02 13:00:00', '2024-08-02 17:00:00'),
      (7, 7, 7, '2024-08-02 14:00:00', '2024-08-02 18:00:00'),
      (8, 8, 8, '2024-08-02 15:00:00', '2024-08-02 19:00:00'),
      (9, 9, 9, '2024-08-02 16:00:00', '2024-08-02 20:00:00'),
      (10, 10, 10, '2024-08-02 17:00:00', '2024-08-02 21:00:00');

-- Insertion pour la table passagers
INSERT INTO passagers (passager_id, nom, prenom, date_de_naissance, email, telephone) VALUES
      (1, 'Dupont', 'Jean', '1980-01-01', 'jean.dupont@example.com', '0123456789'),
      (2, 'Martin', 'Sophie', '1990-02-02', 'sophie.martin@example.com', '0987654321'),
      (3, 'Bernard', 'Pierre', '1985-03-03', 'pierre.bernard@example.com', '1122334455'),
      (4, 'Dubois', 'Marie', '1975-04-04', 'marie.dubois@example.com', '5566778899'),
      (5, 'Thomas', 'Luc', '1988-05-05', 'luc.thomas@example.com', '6677889900'),
      (6, 'Petit', 'Emma', '1992-06-06', 'emma.petit@example.com', '7788990011'),
      (7, 'Durand', 'Paul', '1983-07-07', 'paul.durand@example.com', '8899001122'),
      (8, 'Leroy', 'Julie', '1986-08-08', 'julie.leroy@example.com', '9900112233'),
      (9, 'Moreau', 'Nicolas', '1995-09-09', 'nicolas.moreau@example.com', '0011223344'),
      (10, 'Simon', 'Laura', '1981-10-10', 'laura.simon@example.com', '1122335566');

-- Insertion pour la table reservations
INSERT INTO reservations (id, passager_id, numero_de_train, date_de_reservation)
VALUES
     (1, 1, 1, '2024-08-01'),
     (2, 2, 2, '2024-08-01'),
     (3, 3, 3, '2024-08-01'),
     (4, 4, 4, '2024-08-01'),
     (5, 5, 5, '2024-08-01'),
     (6, 6, 6, '2024-08-01'),
     (7, 7, 7, '2024-08-01'),
     (8, 8, 8, '2024-08-01'),
     (9, 9, 9, '2024-08-01'),
     (10, 10, 10, '2024-08-01');

-- Insertion pour la table billets
INSERT INTO billets (ticket_id, reservation_id, emplacement, prix)
VALUES
   (1, 1, 'A1', 100.00),
   (2, 2, 'A2', 120.00),
   (3, 3, 'A3', 90.00),
   (4, 4, 'B1', 150.00),
   (5, 5, 'B2', 130.00),
   (6, 6, 'B3', 140.00),
   (7, 7, 'C1', 160.00),
   (8, 8, 'C2', 110.00),
   (9, 9, 'C3', 125.00),
   (10, 10, 'D1', 135.00);

-- Insertion pour la table itineraires
INSERT INTO itineraires (itineraire_id, gare_de_depart_id, gare_d_arrivee_id, distance)
VALUES
    (1, 1, 2, 680.0),
    (2, 3, 4, 150.0),
    (3, 5, 6, 300.0),
    (4, 7, 8, 220.0),
    (5, 9, 10, 100.0),
    (6, 2, 3, 200.0),
    (7, 4, 5, 500.0),
    (8, 6, 7, 400.0),
    (9, 8, 9, 50.0),
    (10, 10, 1, 760.0);

-- Insertion pour la table commentaires_passagers
INSERT INTO commentaires_passagers (commentaire_id, passager_id, numero_de_train, commentaire, evaluation)
VALUES
   (1, 1, 1, 'Très bon service', 5),
   (2, 2, 2, 'Confort moyen', 3),
   (3, 3, 3, 'Ponctuel', 4),
   (4, 4, 4, 'Trop de bruit', 2),
   (5, 5, 5, 'Excellent', 5),
   (6, 6, 6, 'Bien mais peut mieux faire', 4),
   (7, 7, 7, 'Voyage agréable', 5),
   (8, 8, 8, 'Siège inconfortable', 3),
   (9, 9, 9, 'Service à bord impeccable', 5),
   (10, 10, 10, 'Bon rapport qualité/prix', 4);

-- -----------------------------------------------------------------------

-- REPONSES

### Requêtes SQL à effectuer

-- 1. Quels sont les détails d'une réservation pour un passager spécifique ?

SELECT reservations.id AS reservation_id,
       passagers.nom AS nom_passager,
       passagers.prenom AS prenom_passager,
       trains.numero_de_train,
       types_de_trains.description AS type_de_train,
       reservations.date_de_reservation
FROM reservations
         JOIN passagers ON reservations.passager_id = passagers.passager_id
         JOIN trains ON reservations.numero_de_train = trains.numero_de_train
         JOIN types_de_trains ON trains.type_de_train = types_de_trains.type_de_train_id
WHERE passagers.passager_id = 4 AND passagers.passager_id = 4;


-- 2. Quels sont tous les trains et leurs types ?

SELECT trains.numero_de_train, types_de_trains.description AS type_de_train
FROM trains
JOIN types_de_trains ON trains.type_de_train = types_de_trains.type_de_train_id;



-- 3. Quels sont les horaires de départ et d'arrivée pour un train spécifique ?

SELECT horaires.heure_de_depart, horaires.heure_d_arrivee
FROM horaires
WHERE horaires.numero_de_train = 1;


-- 4. Quelles sont les informations de contact pour un passager spécifique ?

SELECT nom, prenom, email, telephone
FROM passagers
WHERE passager_id = 3;


-- 5. Quels sont les trains programmés pour partir aujourd'hui ?

SELECT trains.numero_de_train, horaires.heure_de_depart
FROM horaires
JOIN trains ON horaires.numero_de_train = trains.numero_de_train
WHERE DATE(heure_de_depart) = CURDATE();


-- 6. Quelles sont les gares desservies par un train spécifique ?

SELECT gares.nom_de_la_gare
FROM horaires
JOIN gares ON horaires.gare_id = gares.gare_id
WHERE horaires.numero_de_train = 5;

-- 7. Quels sont les tarifs disponibles pour les billets ?

SELECT billets.ticket_id, billets.emplacement, billets.prix
FROM billets;

-- 8. Quelle est la moyenne des évaluations des passagers pour un train spécifique ?

SELECT AVG(commentaires_passagers.evaluation) AS moyenne_evaluation
FROM commentaires_passagers
WHERE commentaires_passagers.numero_de_train = 9;

-- 9. Quels sont les trains reliant deux gares spécifiques ?

SELECT DISTINCT t.numero_de_train, tt.description AS type_de_train, gd.nom_de_la_gare AS gare_depart, ga.nom_de_la_gare AS gare_arrivee
FROM horaires h1
JOIN horaires h2 ON h1.numero_de_train = h2.numero_de_train
JOIN trains t ON h1.numero_de_train = t.numero_de_train
JOIN types_de_trains tt ON t.type_de_train = tt.type_de_train_id
JOIN gares gd ON h1.gare_id = gd.gare_id
JOIN gares ga ON h2.gare_id = ga.gare_id
WHERE h1.gare_id = 1 AND h2.gare_id = 2;

-- Ou

SELECT t.numero_de_train, tt.description AS type_de_train, gd.nom_de_la_gare AS gare_depart, ga.nom_de_la_gare AS gare_arrivee
FROM itineraires i
JOIN horaires h ON i.gare_de_depart_id = h.gare_id
JOIN trains t ON h.numero_de_train = t.numero_de_train
JOIN types_de_trains tt ON t.type_de_train = tt.type_de_train_id
JOIN gares gd ON i.gare_de_depart_id = gd.gare_id
JOIN gares ga ON i.gare_d_arrivee_id = ga.gare_id
WHERE i.gare_de_depart_id = 1 AND i.gare_d_arrivee_id = 2; -- Remplacez 1 et 2 par les IDs des gares spécifiques


