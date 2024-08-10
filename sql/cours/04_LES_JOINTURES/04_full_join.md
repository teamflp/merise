# FULL JOIN en SQL

## Introduction

Le `FULL JOIN`, également appelé `FULL OUTER JOIN`, est une clause SQL utilisée pour combiner des enregistrements de deux tables en fonction d'une condition spécifiée. Contrairement aux `INNER JOIN`, `LEFT JOIN` ou `RIGHT JOIN`, qui ne renvoient que les enregistrements correspondant à des conditions spécifiques, le `FULL JOIN` renvoie **tous les enregistrements** des deux tables, qu'il y ait ou non une correspondance.

## Syntaxe

La syntaxe de base d'un `FULL JOIN` est la suivante :

```sql
SELECT colonne1, colonne2, ...
FROM table1
FULL JOIN table2
ON table1.colonne = table2.colonne;
```

- `colonne1, colonne2, ...` : Les colonnes que vous souhaitez sélectionner dans les tables combinées.
- `table1 et table2` : Les tables à combiner.
- `table1.colonne = table2.colonne` : La condition de jointure qui détermine comment les tables doivent être combinées.

## Fonctionnement du FULL JOIN
Lorsque vous utilisez un `FULL JOIN`, SQL exécute une combinaison des résultats de `LEFT JOIN` et `RIGHT JOIN`. Autrement dit, il renvoie :

- Toutes les lignes de la table de gauche (`table1`) et les lignes correspondantes de la table de droite (`table2`).
- Toutes les lignes de la table de droite (`table2`) et les lignes correspondantes de la table de gauche (`table1`).  
- Si une ligne n'a pas de correspondance dans l'autre `table`, les colonnes de cette table contiendront `NULL`.

### Exemples

Voici un exemple d'utilisation de la clause `FULL JOIN` :

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

-- FULL JOIN entre les tables utilisateurs et commandes

SELECT utilisateurs.id, utilisateurs.nom, Commandes.commande_id, commandes.produit
FROM utilisateurs
FULL JOIN commandes
ON utilisateurs.id = Commandes.client_id;
```

`MySQL` ne prend pas en charge la clause `FULL JOIN` ou `FULL OUTER JOIN`. Contrairement à d'autres systèmes de gestion de bases de données relationnelles (comme `PostgreSQL` ou `SQL` `Server`), `MySQL` ne supporte pas directement cette fonctionnalité.

Cependant, vous pouvez contourner cette limitation en utilisant une combinaison de LEFT JOIN et de UNION avec un RIGHT JOIN.
```sql
SELECT utilisateurs.id, utilisateurs.nom, Commandes.commande_id, commandes.produit
FROM utilisateurs
LEFT JOIN commandes
ON utilisateurs.id = Commandes.client_id
UNION
SELECT utilisateurs.id, utilisateurs.nom, Commandes.commande_id, commandes.produit
FROM utilisateurs
RIGHT JOIN commandes
ON utilisateurs.id = Commandes.client_id;
```

Explication de la requête :

1. Nous créons deux tables `utilisateurs` et `commandes` avec des données factices.
2. Nous utilisons un `FULL JOIN` pour combiner les tables `utilisateurs` et `commandes` en fonction de la condition de jointure `utilisateurs.id = Commandes.client_id`.
3. Nous sélectionnons les colonnes `id` et `nom` de la table `utilisateurs` et les colonnes `commande_id` et `produit` de la table `commandes`.
4. Nous utilisons l'opérateur `UNION` pour combiner les résultats des `LEFT JOIN` et `RIGHT JOIN`.
5. Nous obtenons le résultat combiné de toutes les lignes des deux tables, avec ou sans correspondance.
6. Si une ligne n'a pas de correspondance dans l'autre table, les colonnes de cette table contiendront `NULL`.

Résultat : 

| id | nom           | commande_id | produit |
|----|---------------|-------------|---------|
| 1  | Alice Dupont  | 3           | Phone   |
| 2  | Alice Dupont  | 1           | TV      |
| 3  | Bob Martin    | 2           | Laptop  |
| 4  | Claire Dubois | null        | null    |

Dans cet exemple, nous combinons les tables `utilisateurs` et `commandes` en utilisant un `FULL JOIN`. Nous sélectionnons les colonnes `id` et `nom` de la table `utilisateurs` et les colonnes `commande_id` et `produit` de la table `commandes`. Nous utilisons la colonne `id` de la table `utilisateurs` et la colonne `client_id` de la table `commandes` comme condition de jointure.

**Remarque** : Si vous utilisez un `FULL JOIN` avec des tables de grande taille, assurez-vous d'avoir des index sur les colonnes utilisées pour la jointure afin d'optimiser les performances de la requête.

## Utilisation Courante
Le `FULL JOIN` est particulièrement utile lorsque vous souhaitez obtenir une vue complète de deux ensembles de données, même lorsque des enregistrements ne correspondent pas exactement. Cela peut être utile pour :

- `Analyses de données` : Lorsque vous devez comprendre les écarts entre deux ensembles de données.
- `Rapports complets` : Pour afficher toutes les données disponibles, même si certaines paires ne correspondent pas.

## Conclusion

Le `FULL JOIN` est une clause SQL qui permet de combiner les enregistrements de deux tables en fonction d'une condition spécifiée. Contrairement aux autres types de jointures, le `FULL JOIN` renvoie tous les enregistrements des deux tables, qu'il y ait ou non une correspondance. Cela en fait un outil puissant pour combiner des données provenant de différentes sources.
