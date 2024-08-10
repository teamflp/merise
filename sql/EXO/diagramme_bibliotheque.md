### 1. Modèle Conceptuel des Données (MCD)
Le MCD est une représentation graphique des entités et des relations entre elles. Voici les entités et leurs relations pour notre base de données de bibliothèque.

**Entités et Attributs** :

- **Livre** :
    - id (PK)
    - titre
    - date_publication
- **Auteur** :
    - id (PK)
    - nom
    - prenom
- **Genre** :
    - id (PK)
    - nom
- **Emprunt** :
    - id (PK)
    - date_emprunt
    - date_retour
- **Utilisateur** :
    - id (PK)
    - nom
    - prenom

| **Livre**                               | **Auteur**                 | **Genre**       | **Emprunt**                               | **Utilisateur**              |
|-----------------------------------------|----------------------------|-----------------|-------------------------------------------|------------------------------|
| id (PK)<br/> titre<br/>date_publication | id (PK)<br/>nom<br/>prenom | id (PK)<br/>nom | id (PK)<br/> date_emprunt<br/>date_retour | id (PK)<br/> nom <br/>prenom |

### Diagramme :

```mermaid
erDiagram
    Livre {
        int id
        string titre
        date date_publication
    }
    Auteur {
        int id
        string nom
        string prenom
    }
    Genre {
        int id
        string nom
    }
    Emprunt {
        int id
        date date_emprunt
        date date_retour
    }
    Utilisateur {
        int id
        string nom
        string prenom
    }
    Livre ||--|| Auteur : "écrit par"
    Livre ||--|| Genre : "de genre"
    Emprunt ||--|| Livre : "emprunté"
    Emprunt ||--|| Utilisateur : "par"
```


### 2. Modèle Logique des Données (MLD)

Le MLD est une représentation détaillée des entités et de leurs relations, intégrant les clés étrangères.

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

| **livres**                                                                   | **auteurs**                | **genres**      | **emprunts**                                                                         | **utilisateurs**             |
|------------------------------------------------------------------------------|----------------------------|-----------------|--------------------------------------------------------------------------------------|------------------------------|
| id (PK)<br/> titre<br/>auteur_id (FK)<br/>genre_id (FK)<br/>date_publication | id (PK)<br/>nom<br/>prenom | id (PK)<br/>nom | id (PK)<br/> livre_id (FK)<br/>utilisateur_id (FK)<br/> date_emprunt<br/>date_retour | id (PK)<br/> nom <br/>prenom |

### Diagramme :

```mermaid
erDiagram
    livres {
        int id
        string titre
        int auteur_id
        int genre_id
        date date_publication
    }
    auteurs {
        int id
        string nom
        string prenom
    }
    genres {
        int id
        string nom
    }
    emprunts {
        int id
        int livre_id
        int utilisateur_id
        date date_emprunt
        date date_retour
    }
    utilisateurs {
        int id
        string nom
        string prenom
    }
    livres ||--|| auteurs : "écrit par"
    livres ||--|| genres : "de genre"
    emprunts ||--|| livres : "emprunté"
    emprunts ||--|| utilisateurs : "par"
```

### 3. Modèle Physique des Données (MPD)

Le MPD est une représentation détaillée des tables, des types de données, des contraintes d'intégrité et des index.

#### Schéma de la base de données

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


### Diagramme :

```mermaid
erDiagram
  livres {
    int id PK
    varchar(255) titre
    int auteur_id FK
    int genre_id FK
    date date_publication
  }
  auteurs {
    int id PK
    varchar(255) nom
    varchar(255) prenom
  }
  genres {
    int id PK
    varchar(255) nom
  }
  emprunts {
    int id PK
    int livre_id FK
    int utilisateur_id FK
    date date_emprunt
    date date_retour
  }
  utilisateurs {
    int id PK
    varchar(255) nom
    varchar(255) prenom
  }
  livres ||--o{ auteurs : "écrit par"
  livres ||--o{ genres : "de genre"
  emprunts }o--|| livres : "emprunté"
  emprunts }o--|| utilisateurs : "par"
```