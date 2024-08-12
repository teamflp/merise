## Création de Vues

Une vue en SQL est une table virtuelle qui permet de présenter des données issues d'une ou plusieurs tables physiques. Contrairement à une table classique qui stocke physiquement des données, une vue stocke une requête SQL qui peut être exécutée pour générer les données lorsqu'elles sont demandées.

Syntaxe de base pour créer une vue en SQL :

```sql
CREATE VIEW nom_de_la_vue AS
SELECT colonne1, colonne2, ...
FROM nom_de_la_table
WHERE condition;
```

Exemple de création d'une vue simple :

```sql
CREATE VIEW vue_clients AS
SELECT *
FROM utilisateurs
WHERE id = 2;
```

Une fois la vue créée, elle peut être utilisée comme une table dans les requêtes SQL :

```sql
SELECT * FROM vue_clients;
```

Résultat :

| id | nom        | age | email           | ville |
|----|------------|-----|-----------------|-------|
| 2  | Bob Martin | 25  | bob@exemple.com | Lyon  |

Remarque : Les vues peuvent être mises à jour, mais cela dépend des fonctionnalités de la base de données et des restrictions de mise à jour définies lors de la création de la vue.

