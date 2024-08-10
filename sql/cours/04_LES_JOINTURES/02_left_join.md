# LEFT JOIN : Explication de LEFT JOIN et comment il diffère de INNER JOIN

## Introduction

Le `LEFT JOIN`, également appelé `LEFT OUTER JOIN`, est une commande SQL utilisée pour combiner des enregistrements de deux tables ou plus en fonction d'une condition spécifiée. Il est particulièrement utile lorsque vous souhaitez obtenir tous les enregistrements d'une table de gauche (la première table) même si certaines correspondances dans la table de droite (la deuxième table) sont absentes.

## Syntaxe de `LEFT JOIN`

La syntaxe de base pour utiliser un `LEFT JOIN` est la suivante :

```sql
SELECT colonne1, colonne2, ...
FROM table1
LEFT JOIN table2
ON table1.colonne_commune = table2.colonne_commune;
```

- `SELECT` : Mot-clé indiquant que nous voulons sélectionner des données.
- `colonne1, colonne2, ...` : Liste des colonnes à sélectionner.
- `FROM` : Mot-clé indiquant la table à interroger.
- `table1` : Nom de la première table à interroger.
- `LEFT JOIN` : Mot-clé indiquant que nous voulons combiner les enregistrements de la table de gauche avec ceux de la table de droite.
- `table2` : Nom de la deuxième table à interroger.
- `ON` : Mot-clé indiquant la condition de jointure.

La condition `ON` spécifie la colonne sur laquelle les deux tables doivent être jointes. Dans cet exemple, `table1.colonne_commune` est la colonne de la table de gauche et `table2.colonne_commune` est la colonne de la table de droite.

## Exemple d'utilisation de `LEFT JOIN`

Voici un exemple d'utilisation de la commande `LEFT JOIN` :

- Sélectionner toutes les colonnes de la table `utilisateurs` et les colonnes `nom` et `ville` de la table `commandes` :

```sql
SELECT utilisateurs.*, commandes.produit, commandes.prix
FROM utilisateurs
LEFT JOIN commandes
ON utilisateurs.id = commandes.client_id;
```

Résultat :

| id | nom           | age | email              | ville     | produit | prix |
|----|---------------|-----|--------------------|-----------|---------|------|
| 1  | Alice Dupont  | 25  | paterne@gmail.com  | Paris     | Phone   | 1200 |
| 2  | Alice Dupont  | 30  | paterne@gmail.com  | Paris     | TV      | 600  |
| 3  | Bob Martin    | 25  | bob@exemple.com    | Lyon      | Laptop  | 1500 |
| 4  | Claire Dubois | 35  | claire@exemple.com | Marseille | NULL    | NULL |

Analysons ce code en détails :

- `SELECT` est le mot-clé qui indique que nous voulons sélectionner des données.
- `utilisateurs.*, commandes.produit` est utilisé pour sélectionner toutes les colonnes de la table `utilisateurs` et les colonnes `nom` et `ville` de la table `commandes`.
- `FROM` est le mot-clé qui indique la table à interroger.
- `utilisateurs` est le nom de la première table à interroger.
- `LEFT JOIN` est le mot-clé qui indique que nous voulons combiner les enregistrements de la table de gauche avec ceux de la table de droite.
- `commandes` est le nom de la deuxième table à interroger.
- `ON` est le mot-clé qui indique la condition de jointure.
- `utilisateurs.id = commandes.client_id` est la condition de jointure qui spécifie que les enregistrements des deux tables doivent être combinés lorsque l'`id` de la table `utilisateurs` est égal au `client_id` de la table `commandes`.

Dans cet exemple, nous avons utilisé `LEFT JOIN` pour obtenir tous les enregistrements de la table `utilisateurs` même si certains enregistrements de la table `commandes` n'ont pas de correspondance.

## Différence entre LEFT JOIN et INNER JOIN
La principale différence entre `LEFT JOIN` et `INNER JOIN` réside dans le nombre de résultats retournés lorsque les conditions de la jointure ne sont pas remplies.

- `INNER JOIN` : Retourne uniquement les lignes où il y a une correspondance dans les deux tables. Si une ligne dans la table de gauche n'a pas de correspondance dans la table de droite, cette ligne est exclue du résultat.

- `LEFT JOIN` : Retourne toutes les lignes de la table de gauche, même s'il n'y a pas de correspondance dans la table de droite. Pour les lignes sans correspondance, les colonnes de la table de droite contiendront `NULL`.

## Quand utiliser LEFT JOIN ?
Vous devez utiliser un `LEFT JOIN` lorsque vous voulez vous assurer que toutes les lignes de la table de gauche apparaissent dans le résultat, même si certaines n'ont pas de correspondance dans la table de droite. C'est particulièrement utile pour les rapports où vous souhaitez inclure des éléments manquants pour les analyser ou les corriger.

## Conclusion

Le `LEFT JOIN` est une commande puissante pour combiner des tables tout en préservant les données de la table de gauche, même en l'absence de correspondances. Il diffère du `INNER JOI`N en ce qu'il ne filtre pas les lignes sans correspondance, les rendant visibles dans le résultat final avec des valeurs NULL pour les colonnes de la table de droite.