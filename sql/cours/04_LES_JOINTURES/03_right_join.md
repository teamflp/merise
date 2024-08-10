# RIGHT JOIN : Explication et Utilisation

La clause `RIGHT JOIN` en SQL est utilisée pour combiner des enregistrements de deux tables en fonction d'une condition de jointure, tout en s'assurant que tous les enregistrements de la table de droite (la table après le mot clé `RIGHT JOIN`) sont inclus dans le résultat, même s'il n'y a pas de correspondance dans la table de gauche.

## Syntaxe de la clause RIGHT JOIN

```sql
SELECT colonne(s)
FROM table1
RIGHT JOIN table2
ON table1.colonne_commune = table2.colonne_commune;
```

Explication de la syntaxe :

- `SELECT` : Mot-clé indiquant que nous voulons sélectionner des données.
- `colonne(s)` : Liste des colonnes à sélectionner.
- `FROM` : Mot-clé indiquant la table à interroger.
- `table1` : Nom de la première table à interroger.
- `RIGHT JOIN` : Mot-clé indiquant que nous voulons combiner les enregistrements de la table de droite avec ceux de la table de gauche.
- `table2` : Nom de la deuxième table à interroger.
- `ON` : Mot-clé indiquant la condition de jointure.
- `table1.colonne_commune = table2.colonne_commune` : Condition de jointure spécifiant les colonnes sur lesquelles les deux tables doivent être jointes.

Exemple d'utilisation de la clause RIGHT JOIN :

- Sélectionner toutes les colonnes de la table `commandes` et les colonnes `nom` et `ville` de la table `utilisateurs` :

```sql
SELECT commandes.*, utilisateurs.nom, utilisateurs.ville
FROM commandes
RIGHT JOIN utilisateurs
ON commandes.client_id = utilisateurs.id;
```

Résultat :

| id   | produit | client_id | nom           | ville     |
|------|---------|-----------|---------------|-----------|
| 1    | Phone   | 1         | Alice Dupont  | Paris     |
| 2    | TV      | 1         | Alice Dupont  | Paris     |
| 3    | Laptop  | 2         | Bob Martin    | Lyon      |
| NULL | NULL    | 3         | Claire Dubois | Marseille |

Analysons ce code en détails :

- Les deux premières lignes du résultat proviennent des correspondances entre les `ID` de départements dans les deux tables.
- La troisième ligne du résultat provient de la correspondance entre les `ID` de départements dans les deux tables.
- La quatrième ligne du résultat provient de l'enregistrement de la table `utilisateurs` qui n'a pas de correspondance dans la table `commandes`.

## Comparaison avec LEFT JOIN
La différence principale entre RIGHT JOIN et LEFT JOIN réside dans le fait que RIGHT JOIN retourne tous les enregistrements de la table de droite et les enregistrements correspondants de la table de gauche, alors que LEFT JOIN retourne tous les enregistrements de la table de gauche et les enregistrements correspondants de la table de droite.

### Exemple de LEFT JOIN pour comparaison

```sql
SELECT utilisateurs.*, commandes.produit
FROM utilisateurs
LEFT JOIN commandes
ON utilisateurs.id = commandes.client_id;
```

Résultat :

| id | nom           | age | email              | ville     | produit |
|----|---------------|-----|--------------------|-----------|---------|
| 1  | Alice Dupont  | 25  | paterne@gmail.com  | Paris     | Phone   |
| 2  | Alice Dupont  | 30  | paterne@gmail.com  | Paris     | TV      | 
| 3  | Bob Martin    | 25  | bob@exemple.com    | Lyon      | Laptop  |
| 4  | Claire Dubois | 35  | claire@exemple.com | Marseille | NULL    |


Explication du résultat :

Ici, tous les enregistrements de la table `utilisateurs` sont inclus dans le résultat, même si certains enregistrements de la table `commandes` n'ont pas de correspondance.

### Conclusion

Conclusion
La clause `RIGHT JOIN` est très utile lorsque vous souhaitez vous assurer que tous les enregistrements d'une table spécifique (la table de droite) apparaissent dans les résultats de votre requête, même s'il n'y a pas de correspondance avec la table de gauche. C'est une fonctionnalité puissante pour extraire des données de manière flexible tout en préservant les informations importantes d'une table donnée.