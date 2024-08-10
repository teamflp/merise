# SELECT : Extraire des Données avec SQL

La clause `SELECT` est utilisée pour récupérer des données à partir d'une ou plusieurs tables dans une base de données. Voici un exemple d'utilisation de la clause `SELECT` :
L'instruction `SELECT` est l'une des commandes les plus fondamentales et les plus puissantes en SQL. Elle permet de récupérer des données stockées dans une base de données et de les présenter sous la forme souhaitée. Dans ce cours, nous allons explorer les différentes facettes de l'instruction `SELECT`, y compris les filtres, les jointures, et les fonctions d'agrégation.

## Structure de Base de SELECT

La syntaxe de base pour une requête `SELECT` est la suivante :

```sql
SELECT colonnes, columnes, ...
FROM table
WHERE conditions;
```

- `SELECT` : Mot-clé indiquant que nous voulons sélectionner des données.
- `colonne1, colonne2, ...` : Liste des colonnes à sélectionner.
- `FROM` : Mot-clé indiquant la table à interroger.
- `table` : Nom de la table à interroger.

Vous pouvez spécifier le nom des colonnes à sélectionner ou utiliser `*` pour sélectionner toutes les colonnes de la table.

### Exemples

Voici un exemple d'utilisation de la clause `SELECT` :

- Sélectionner toutes les colonnes de la table `utilisateurs` :

```sql
SELECT * FROM utilisateurs;
```

| id | nom           | age | email              | ville     |
|----|---------------|-----|--------------------|-----------|
| 1  | Alice Dupont  | 25  | alice@exemple.com  | Paris     |
| 2  | Bob Martin    | 30  | bob@exemple.com    | Lyon      |
| 3  | Claire Dubois | 35  | claire@exemple.com | Marseille |

Analysons ce code en détails : 
- `SELECT` est le mot-clé qui indique que nous voulons sélectionner des données.
- `*` est utilisé pour sélectionner toutes les colonnes de la table.
- `FROM` est le mot-clé qui indique la table à interroger.
- `utilisateurs` est le nom de la table à interroger.

Dans cet exemple, on note que `*` est utilisé pour sélectionner toutes les colonnes de la table `utilisateurs`.

La clause `SELECT` peut également être utilisée pour sélectionner des colonnes spécifiques de la table. Voici un exemple :

- Sélectionner les colonnes `nom`, `age` et `email` de la table `utilisateurs` :

```sql
SELECT nom, age, email FROM utilisateurs;
```

| id | nom           | age | email              |   
|----|---------------|-----|--------------------|
| 1  | Alice Dupont  | 25  | alice@exemple.com  | 
| 2  | Bob Martin    | 30  | bob@exemple.com    |
| 3  | Claire Dubois | 35  | claire@exemple.com |

La clause SELECT s'utilise toujours avec la clause `FROM`. Elle permet de spécifier les colonnes à sélectionner et la table à interroger pour obtenir les résultats souhaités.

### Conclusion

La clause `SELECT` est essentielle pour récupérer des données à partir d'une base de données. Elle vous permet de spécifier les colonnes à sélectionner et la table à interroger pour obtenir les résultats souhaités.
    




