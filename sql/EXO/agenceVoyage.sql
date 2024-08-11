USE agenceVoyage;

-- Gestion des clients
-- Gestion des réservations de voyage
-- Gestion des réservations des vols
-- Gestion des réservations des hôtels
-- Gestion des avis des clients

-- Les clienst peuvent réserver des voyages qui incluent des vols et des hôtels, et chaque réservation doit etre suivie attentivement pour garantir la satisfaction du client.
-- Les clients peuvent également laisser des avis sur les services proposés par l'agence de voyage.

-- Nom de la base de données: agenceVoyage

-- Les entités:
-- 1. Clients
-- 2. Réservations
-- 3. Vols
-- 4. Hôtels
-- 5. Avis_clients
-- 6  Destination
-- 7  Vol_reservation
-- 8  Hotel_reservation
-- 9  Tarifs

-- Les relations:
-- 1. Un client peut effectuer plusieurs réservations
-- 2. Une réservation est effectuée par un seul client
-- 3. Une réservation peut inclure plusieurs vols
-- 4. Un vol peut être réservé par plusieurs clients
-- 5. Une réservation peut inclure plusieurs hôtels
-- 6. Un hôtel peut être réservé par plusieurs clients
-- 7. Un client peut laisser plusieurs avis
-- 8. Un avis est laissé par un seul client
-- 9. Un vol est réservé pour une destination
-- 10. Un hôtel est réservé pour une destination
-- 11. Un tarif est associé à un vol

-- Les attributs:
-- 1. Clients: id, nom, prenom, email, telephone
-- 2. Réservations: id, date_reservation, id_client
-- 3. Vols: id, date_depart, date_arrivee, id_destination
-- 4. Hôtels: id, nom, adresse, id_destination
-- 5. Avis_clients: id, commentaire, id_client
-- 6. Destination: id, nom_destination
-- 7. Vol_reservation: id, id_vol, id_reservation
-- 8. Hotel_reservation: id, id_hotel, id_reservation
-- 9. Tarifs: id, prix, id_vol

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS agenceVoyage;

USE agenceVoyage;

-- Création des tables
CREATE TABLE IF NOT EXISTS clients (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(100) NOT NULL,
   prenom VARCHAR(100) NOT NULL,
   email VARCHAR(100) NOT NULL,
   telephone VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS destination (
       id INT AUTO_INCREMENT PRIMARY KEY,
       ville VARCHAR(100) NOT NULL,
       pays VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_reservation DATE NOT NULL,
    id_client INT,
    destination_id INT,
    FOREIGN KEY (id_client) REFERENCES clients(id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE IF NOT EXISTS vols (
id INT AUTO_INCREMENT PRIMARY KEY,
numero_vol VARCHAR(50) NOT NULL,
compagnie_aerienne VARCHAR(100) NOT NULL,
heure_depart DATETIME NOT NULL,
heure_arrivee DATETIME NOT NULL
);

CREATE TABLE IF NOT EXISTS hotels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nom_hotel VARCHAR(100) NOT NULL,
  adresse TEXT NOT NULL,
  ville VARCHAR(100) NOT NULL,
  pays VARCHAR(100) NOT NULL,
  classement INT CHECK (classement BETWEEN 1 AND 5)
);

CREATE TABLE IF NOT EXISTS avis_clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT,
    hotel_id INT,
    commentaire TEXT,
    evaluation INT CHECK (evaluation BETWEEN 1 AND 5),
    FOREIGN KEY (client_id) REFERENCES clients(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE IF NOT EXISTS vol_reservation (
   id INT AUTO_INCREMENT PRIMARY KEY,
   vol_id INT,
   reservation_id INT,
   FOREIGN KEY (vol_id) REFERENCES vols(id),
   FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);

CREATE TABLE IF NOT EXISTS hotel_reservation (
     id INT AUTO_INCREMENT PRIMARY KEY,
     hotel_id INT,
     reservation_id INT,
     FOREIGN KEY (hotel_id) REFERENCES hotels(id),
     FOREIGN KEY (reservation_id) REFERENCES reservations(id)
);

CREATE TABLE IF NOT EXISTS tarifs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  prix DECIMAL(10, 2) NOT NULL,
  description VARCHAR(255)
);

-- INSERTION DES CLIENTS EN BASE DE DONNEES

INSERT INTO clients (nom, prenom, email, telephone)
VALUES
    ('Dupont', 'Jean', 'jean@gmail.com', '0601020304'),
    ('Durand', 'Marie', 'marie@gmail.com', '0601020305'),
    ('Martin', 'Pierre', 'pierre@gmail.com', '0601020306'),
    ('Lefevre', 'Sophie', 'sophie@gmail.com', '0601020307'),
    ('Leroy', 'Luc', 'luc@gmail.com', '0601020308'),
    ('Moreau', 'Julie', 'julie@gmail.com', '0601020309'),
    ('Girard', 'Paul', 'paul@gmail.com', '0601020310'),
    ('Roux', 'Celine', 'celine@gmail.com', '0601020311'),
    ('Lemoine', 'Laurent', 'laurent@gmail.com', '0601020312'),
    ('Fournier', 'Isabelle', 'isabelle@gmail.com', '0601020313');

SELECT * FROM clients;

-- INSERTION DES DESTINATIONS EN BASE DE DONNEES
INSERT INTO destination (ville, pays)
VALUES
    ('Paris', 'France'),
    ('Londres', 'Angleterre'),
    ('New York', 'Etats-Unis'),
    ('Tokyo', 'Japon'),
    ('Sydney', 'Australie'),
    ('Rome', 'Italie'),
    ('Berlin', 'Allemagne'),
    ('Madrid', 'Espagne'),
    ('Moscou', 'Russie'),
    ('Le Caire', 'Egypte');

SELECT * FROM destination;

-- INSERTION DES RESERVATIONS EN BASE DE DONNEES

INSERT INTO reservations (date_reservation, id_client, destination_id)
VALUES
    ('2021-10-01', 1, 1),
    ('2021-10-02', 2, 2),
    ('2021-10-03', 3, 3),
    ('2021-10-04', 4, 4),
    ('2021-10-05', 5, 5),
    ('2021-10-06', 6, 6),
    ('2021-10-07', 7, 7),
    ('2021-10-08', 8, 8),
    ('2021-10-09', 9, 9),
    ('2021-10-10', 10, 10);

SELECT * FROM reservations;

-- INSERTION DES VOLS EN BASE DE DONNEES
INSERT INTO vols (numero_vol, compagnie_aerienne, heure_depart, heure_arrivee)
VALUES
    ('VOL123', 'Air France', '2021-10-01 10:00:00', '2021-10-01 12:00:00'),
    ('VOL456', 'Delta Air Lines', '2021-10-02 10:00:00', '2021-10-02 12:00:00'),
    ('VOL789', 'American Airlines', '2021-10-03 10:00:00', '2021-10-03 12:00:00'),
    ('VOL101', 'Japan Airlines', '2021-10-04 10:00:00', '2021-10-04 12:00:00'),
    ('VOL112', 'Qantas', '2021-10-05 10:00:00', '2021-10-05 12:00:00'),
    ('VOL131', 'Alitalia', '2021-10-06 10:00:00', '2021-10-06 12:00:00'),
    ('VOL415', 'Lufthansa', '2021-10-07 10:00:00', '2021-10-07 12:00:00'),
    ('VOL617', 'Iberia', '2021-10-08 10:00:00', '2021-10-08 12:00:00'),
    ('VOL819', 'Aeroflot', '2021-10-09 10:00:00', '2021-10-09 12:00:00'),
    ('VOL202', 'EgyptAir', '2021-10-10 10:00:00', '2021-10-10 12:00:00');

SELECT * FROM vols;

-- INSERTION DES HOTELS EN BASE DE DONNEES

INSERT INTO hotels (nom_hotel, adresse, ville, pays, classement)
VALUES
    ('Hotel Sunrise', '12 rue des Étoiles, 75001 Paris', 'Paris', 'France', 3),
    ('Hotel Ibis', '24 rue de la Concorde, 75005', 'Paris', 'France', 2),
    ('Hotel London', '45 Oxford Street, London W1D 1BS', 'Londres', 'Angleterre', 4),
    ('Hotel New York', '123 Broadway, New York, NY 10001', 'New York', 'Etats-Unis', 5),
    ('Hotel Tokyo', '1-1-1 Marunouchi, Chiyoda-ku, Tokyo', 'Tokyo', 'Japon', 5),
    ('Hotel Sydney', '100 George Street, Sydney NSW 2000', 'Sydney', 'Australie', 4),
    ('Hotel Roma', 'Via del Corso, 00186 Roma RM', 'Rome', 'Italie', 3),
    ('Hotel Berlin', 'Unter den Linden 77, 10117 Berlin', 'Berlin', 'Allemagne', 4),
    ('Hotel Madrid', 'Gran Via, 32, 28013 Madrid', 'Madrid', 'Espagne', 3),
    ('Hotel Moscow', 'Tverskaya Street, 1, Moscow', 'Moscou', 'Russie', 4);

SELECT * FROM hotels;

-- INSERTION DES AVIS CLIENTS EN BASE DE DONNEES

INSERT INTO avis_clients (client_id, hotel_id, commentaire, evaluation)
VALUES
    (1, 1, 'Excellent hôtel avec un service exceptionnel.', 5),
    (2, 2, 'Très bon hôtel avec un service confortable.', 4),
    (3, 3, 'Hôtel idéal pour les vacances en Londres.', 5),
    (4, 4, 'Le meilleur hôtel de New York, je recommande.', 5),
    (5, 5, 'Superbe hôtel à Tokyo, je reviendrai.', 5),
    (6, 6, 'Hôtel très bien situé à Rome, je suis satisfait.', 4),
    (7, 7, 'Hôtel agréable à Berlin, je recommande.', 4),
    (8, 8, 'Le meilleur hôtel de Madrid, je reviendrai.', 5),
    (9, 9, 'Hôtel confortable à Moscou, je suis satisfait.', 4),
    (10, 10, 'Excellent hôtel avec un service exceptionnel.', 5);

SELECT * FROM avis_clients;

-- INSERTION DES RESERVATIONS DE VOLS EN BASE DE DONNEES

INSERT INTO vol_reservation (vol_id, reservation_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

SELECT * FROM vol_reservation;

-- INSERTION DES RESERVATIONS D'HOTELS EN BASE DE DONNEES

INSERT INTO hotel_reservation (hotel_id, reservation_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

SELECT * FROM hotel_reservation;

-- INSERTION DES TARIFS DES VOLS EN BASE DE DONNEES

INSERT INTO tarifs (prix, description)
VALUES
    (100.00, 'Economique'),
    (200.00, 'Premium économique'),
    (500.00, 'Business'),
    (1000.00, 'Première classe'),
    (1500.00, 'Tout inclus'),
    (1200.00, 'Vol et hotel'),
    (800.00, 'Vol et voiture'),
    (2500.00, 'Hotel de luxe'),
    (800.00, 'Aventure'),
    (3000.00, 'Croisière');

SELECT * FROM tarifs;

-- ************************* QUESTIONS ***************************************************************************************

-- 1. Quels sont les détails d'une réservation pour un client donné ?

SELECT clients.nom, clients.prenom, reservations.date_reservation, destination.ville AS Destination, destination.pays
FROM reservations
         JOIN clients ON reservations.id_client = clients.id
         JOIN destination ON reservations.destination_id = destination.id
WHERE clients.id = 2;

-- 2. Quels sont tous les vols et leurs compagnies aériennes ?

SELECT numero_vol, compagnie_aerienne FROM vols;

-- 3. Quels les horaires de départ et d'arrivée pour un vol spécifique
SELECT numero_vol Vol, heure_depart Depart, heure_arrivee Arrivee
FROM vols
WHERE id = 5;


-- 4. Quelles les informations de contact pour un client spécifique ?

SELECT * FROM clients WHERE id = 6;


-- 5. Quels sont les vols programmés pour partir aujourd'hui ?

SELECT numero_vol Vol, compagnie_aerienne Compagnie, heure_depart Depart
FROM vols
WHERE DATE(heure_depart) = CURDATE(); -- CURDATE() permet d'afficher la date d'aujourd'hui

-- 6. Quels sont les hotels réservés dans une réservation spécifique ?

SELECT hotels.nom_hotel, hotels.ville, hotels.pays, hotels.adresse, hotels.classement
FROM hotel_reservation
         JOIN hotels ON hotel_reservation.hotel_id = hotels.id
WHERE  hotel_reservation.reservation_id = 5;

-- 7. Quels sont les tarifs disponibles pour les réservations

SELECT * FROM tarifs;

-- 8. Quelle est la moyenne des évaluation des clients pour un hotel spécifique?
SELECT hotels.nom_hotel, AVG(avis_clients.evaluation) AS Moyenne_Evaluation
FROM avis_clients
         JOIN hotels ON avis_clients.hotel_id = hotels.id
WHERE hotels.id = 4
GROUP BY hotels.nom_hotel;


-- 9. Quels sont les vols reliant deux destinations spécifiques?

SELECT vols.numero_vol, vols.compagnie_aerienne
FROM vol_reservation
JOIN vols
    ON vol_reservation.vol_id = vols.id
JOIN reservations
    ON vol_reservation.reservation_id = reservations.id
WHERE reservations.destination_id  = 4
    AND reservations.destination_id
IN (SELECT id FROM destination WHERE ville = 'Paris');

