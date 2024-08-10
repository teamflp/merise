# EXERCICE : Requêtes SQL sur une bibliothèque

Contexte de l'exercice
-----------------------
Vous travaillez pour une entreprise qui gère une bibliothèque en ligne. Vous avez accès à une base de données contenant des informations sur les livres, les auteurs, les genres, les utilisateurs et les emprunts de livres.

L'entreprise souhaite obtenir des informations spécifiques sur les données de la base de données pour améliorer ses services et mieux comprendre les habitudes de ses utilisateurs. Vous devez donc écrire des requêtes SQL pour répondre à ces questions.

Pour ce fait, elle vous demande également de réaliser les diagrammes suivants :

- Modèle Conceptuel des Données (MCD) : Une représentation graphique des entités et des relations entre elles. 
- Modèle Logique des Données (MLD) : Une représentation détaillée des entités et de leurs relations, intégrant les clés étrangères.
- Modèle Physique des Données (MPD) : Une représentation détaillée des tables, des types de données, des contraintes d'intégrité et des index.
Pour les diagrammes, voir le fichier [diagramme_bibliotheque.pdf](diagramme_bibliotheque.pdf).

### Schéma de la base de données
- **livres** : Contient des informations sur les livres.
    - `id` (INT) : Identifiant unique du livre.
    - `titre` (VARCHAR) : Titre du livre.
    - `auteur_id` (INT) : Identifiant de l'auteur du livre.
    - `genre_id` (INT) : Identifiant du genre du livre.
    - `date_publication` (DATE) : Date de publication du livre.


- **auteurs** : Contient des informations sur les auteurs.
    - `id` (INT) : Identifiant unique de l'auteur.
    - `nom` (VARCHAR) : Nom de l'auteur.
    - `prenom` (VARCHAR) : Prénom de l'auteur.


- **genres** : Contient des informations sur les genres littéraires.
    - `id` (INT) : Identifiant unique du genre.
    - `nom` (VARCHAR) : Nom du genre.


- **emprunts** : Contient des informations sur les emprunts de livres par les utilisateurs.
    - `id` (INT) : Identifiant unique de l'emprunt.
    - `livre_id` (INT) : Identifiant du livre emprunté.
    - `utilisateur_id` (INT) : Identifiant de l'utilisateur qui a emprunté le livre.
    - `date_emprunt` (DATE) : Date de l'emprunt.
    - `date_retour` (DATE) : Date de retour du livre (NULL si non retourné).


- **utilisateurs** : Contient des informations sur les utilisateurs.
    - `id` (INT) : Identifiant unique de l'utilisateur.
    - `nom` (VARCHAR) : Nom de l'utilisateur.
    - `prenom` (VARCHAR) : Prénom de l'utilisateur.

### Questions de l'exercice

1. Réalisez les diagrammes demandés et répondez aux questions suivantes.
- MCD : Modèle Conceptuel des Données
- MLD : Modèle Logique des Données
- MPD : Modèle Physique des Données

Pour chaque question, écrivez une requête SQL pour obtenir les informations demandées.

2. **Liste des livres par auteur :**
   Écrire une requête pour afficher la liste des titres de livres et leurs auteurs, triée par nom d'auteur puis par titre de livre.


3. **Livres empruntés et non retournés :**
   Écrire une requête pour afficher la liste des titres de livres actuellement empruntés et non encore retournés, avec le nom et prénom des utilisateurs qui les ont empruntés.


4. **Top 3 des genres les plus populaires :**
   Écrire une requête pour afficher les trois genres de livres les plus empruntés, avec le nombre d'emprunts pour chaque genre.


5. **Temps moyen d'emprunt des livres :**
   Écrire une requête pour calculer le temps moyen (en jours) d'emprunt des livres, uniquement pour ceux qui ont été retournés.


6. **Auteur le plus prolifique :**
   Écrire une requête pour afficher le nom de l'auteur qui a publié le plus de livres.


7. **Livres jamais empruntés :**
   Écrire une requête pour afficher la liste des titres de livres qui n'ont jamais été empruntés.
