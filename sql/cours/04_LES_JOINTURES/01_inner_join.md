# INNER JOIN

L'**INNER JOIN** est le type de jointure le plus couramment utilisé. Il permet de combiner des enregistrements de deux tables en fonction d'une condition spécifiée, et ne retourne que les enregistrements qui ont des correspondances dans les deux tables.

## Syntaxe

```sql
SELECT colonnes
FROM table1
INNER JOIN table2
ON table1.colonne_commune = table2.colonne_commune;
```

Explications :
- **table1** et **table2** sont les noms des tables à joindre.
- **colonne_commune** est la colonne sur laquelle les tables sont jointes.

## Exemple pratique
Supposons que vous avez deux tables : **utilisateurs** et **commandes**.

La table **utilisateurs** contient les informations des utilisateurs, et la table **commandes** contient les informations des commandes passées par les utilisateurs.

Voici les données de la table **utilisateurs** :

```sql
-- Table utilisateurs
CREATE TABLE utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50),
    age INT,
    email VARCHAR(50),
    ville VARCHAR(50)
);
-- Table commandes
CREATE TABLE commandes (
    commande_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    produit VARCHAR(50),
    FOREIGN KEY (client_id) REFERENCES utilisateurs(id)
);

-- Insérer des données dans la table commandes
INSERT INTO commandes (client_id, produit) VALUES
(1, 'TV'),
(2, 'Laptop'),
(1, 'Phone');
```

**Résumé des tables créées**
Table utilisateurs :

- `id` : Identifiant unique du client (clé primaire).
- `nom` : Nom du client.
- `age` : Âge du client.
- `email` : Adresse e-mail du client.
- `ville` : Ville du client.

Table commandes :

- `commande_id` : Identifiant unique de la commande (clé primaire).
- `client_id` : Identifiant du client associé à la commande (clé étrangère référencée dans clients).
- `produit` : Nom du produit commandé.

## Obtenir la liste des utilisateurs
```sql
SELECT * FROM utilisateurs;
```

| id | nom           | age | email              | ville     |
|----|---------------|-----|--------------------|-----------|
| 1  | Alice Dupont  | 25  | alice@exemple.com  | Paris     |
| 2  | Bob Martin    | 30  | bob@exemple.com    | Lyon      |
| 3  | Claire Dubois | 35  | claire@exemple.com | Marseille |

## Obtenir la liste des commandes
```sql
SELECT * FROM commandes;
```

Et voici les données de la table **commandes** :

| commande_id | client_id | produit |
|-------------|-----------|---------|
| 1           | 1         | TV      |
| 2           | 2         | Laptop  |
| 3           | 1         | Phone   |


Pour obtenir une liste des clients et des produits qu'ils ont commandés, vous pouvez utiliser `INNER JOIN` comme suit :

```sql
SELECT utilisateurs.nom, commandes.produit
FROM utilisateurs
INNER JOIN commandes
ON utilisateurs.id = commandes.client_id;
```

| nom           | produit |
|---------------|---------|
| Alice Dupont  | TV      |
| Bob Martin    | Laptop  |
| Alice Dupont  | Phone   |

Dans cet exemple, nous avons joint les tables **utilisateurs** et **commandes** sur la colonne `id` de la table **utilisateurs** et la colonne `client_id` de la table **commandes**. Nous avons sélectionné les colonnes `nom` de la table **utilisateurs** et `produit` de la table **commandes**.

Les résultats affichent le nom de l'utilisateur et le produit qu'il a commandé.

## Conclusion   

L'**INNER JOIN** est un outil puissant pour combiner des enregistrements de deux tables en fonction d'une condition spécifiée. Il vous permet de récupérer des données de plusieurs tables en une seule requête SQL.























































































































































































