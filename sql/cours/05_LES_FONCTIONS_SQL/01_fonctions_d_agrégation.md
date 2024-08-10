# Les fonctions d'agrégation SQL

Les fonctions d'agrégation en SQL sont des fonctions qui effectuent une opération sur un ensemble de valeurs pour retourner une valeur unique. Elles sont très utiles pour analyser et résumer des données. Les fonctions d'agrégation les plus couramment utilisées sont `COUNT`, `SUM`, `AVG`, `MIN`, et `MAX`.

## 1. COUNT()

### Description

La fonction `COUNT()` est utilisée pour compter le nombre de lignes qui correspondent à un certain critère. Elle peut être appliquée à tous les types de données.

### Syntaxe

```sql
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
```

- `column_name` : Le nom de la colonne à compter.
- `table_name` : Le nom de la table à interroger.
- `condition` : La condition à appliquer pour filtrer les lignes.
- `COUNT()` : La fonction d'agrégation qui compte les lignes.

### Exemple

```sql
SELECT COUNT(*) AS total_utilisateurs
FROM utilisateurs;
```

Résultat :

| total_utilisateurs |
| --- |
| 3 |

Dans cet exemple, la fonction `COUNT(*)` compte le nombre total d'utilisateurs dans la table `utilisateurs`.

## 2. SUM()

### Description

La fonction SUM() calcule la somme totale d'une colonne numérique. Elle est souvent utilisée pour obtenir des totaux financiers ou autres.

### Syntaxe

```sql
SELECT SUM(column_name)
FROM table_name
WHERE condition;
```

- `column_name` : Le nom de la colonne à additionner.
- `table_name` : Le nom de la table à interroger.
- `condition` : La condition à appliquer pour filtrer les lignes.
- `SUM()` : La fonction d'agrégation qui calcule la somme.

La table commandes:

```sql
SELECT * FROM commandes;
```

| commande_id | client_id | produit | prix    |
|-------------|-----------|---------|---------|
| 1           | 1         | TV      | 600.00  |
| 2           | 2         | Laptop  | 1500.00 |
| 3           | 3         | Phone   | 1200.00 |

### Exemple

```sql
SELECT SUM(prix) AS total_commandes
FROM commandes
WHERE prix > 600.00;
```

Résultat :

| total_commandes |
|-----------------|
| 1700.00         |

Dans cet exemple, la fonction `SUM(prix)` calcule le total des commandes dont le prix est supérieur à 600.00.

## 3. AVG()

### Description

La fonction `AVG()` retourne la moyenne d'une colonne numérique. C'est utile pour calculer des moyennes sur des ensembles de données.

### Syntaxe

```sql
SELECT AVG(column_name)
FROM table_name
WHERE condition;
```

- `column_name` : Le nom de la colonne pour laquelle calculer la moyenne.
- `table_name` : Le nom de la table à interroger.
- `condition` : La condition à appliquer pour filtrer les lignes.
- `AVG()` : La fonction d'agrégation qui calcule la moyenne. Elle ignore les valeurs `NULL` lors du calcul de la moyenne.

### Exemple

```sql
SELECT ROUND(AVG(prix), 2) AS prix_moyen
FROM commandes;
```

Dans ce code, la fonction `AVG(prix)` calcule la moyenne des prix des commandes dans la table `commandes`. La fonction `ROUND()` est utilisée pour arrondir le résultat à deux décimales.

Résultat :

| prix_moyen |
|------------|
| 1100.00    |

## 4. MIN() et MAX()

### Description

Les fonctions `MIN()` et `MAX()` retournent respectivement la valeur minimale et maximale d'une colonne. Elles sont utiles pour trouver les valeurs extrêmes dans un ensemble de données.

### Syntaxe

```sql
SELECT MIN(column_name)
FROM table_name
WHERE condition;
```

- `column_name` : Le nom de la colonne pour laquelle trouver la valeur minimale ou maximale.
- `table_name` : Le nom de la table à interroger.
- `condition` : La condition à appliquer pour filtrer les lignes.
- `MIN()` : La fonction d'agrégation qui retourne la valeur minimale.
- `MAX()` : La fonction d'agrégation qui retourne la valeur maximale.

Exemple

```sql
SELECT MIN(prix) AS prix_min
FROM commandes;
```

Résultat :

| prix_min |
| --- |
| 600.00 |

Dans cet exemple, la fonction `MIN(prix)` retourne le prix minimum parmi toutes les commandes de la table `commandes`.

## 5. MAX()

La fonction `MAX()` retourne la plus grande valeur d'une colonne. Comme `MIN()`, elle peut être utilisée sur des valeurs numériques, de date, ou de texte.

Syntaxe

```sql
SELECT MAX(column_name)
FROM table_name
WHERE condition;
```

Exemple :

```sql
SELECT MAX(prix) AS prix_max
FROM commandes;
```

Résultat :

| prix_max |
| --- |
| 1500.00 |

Dans cet exemple, la fonction `MAX(prix)` retourne le prix maximum parmi toutes les commandes de la table `commandes`.

## 6. Utilisation combinée des fonctions d'agrégation

Il est possible d'utiliser plusieurs fonctions d'agrégation dans une même requête SQL pour obtenir un aperçu plus complet des données.

```sql
SELECT COUNT(*) AS total_commandes,
       SUM(prix) AS total_ventes,
       ROUND(AVG(prix), 2) AS prix_moyen,
       MIN(prix) AS prix_min,
       MAX(prix) AS prix_max
FROM commandes;
```

Dans cet exemple, nous combinons les fonctions `COUNT()`, `SUM()`, `AVG()`, `MIN()`, et `MAX()` pour obtenir des statistiques détaillées sur les commandes de la table `commandes`.

Résultat :

| total_commandes | total_ventes | prix_moyen | prix_min | prix_max |
| --- | --- | --- | --- | --- |
| 3 | 3300.00 | 1100.00 | 600.00 | 1500.00 |

## Conclusion

Les fonctions d'agrégation en SQL sont des outils puissants pour analyser et résumer les données. Elles permettent de calculer des statistiques utiles sur les enregistrements d'une table. En utilisant des fonctions telles que `COUNT`, `SUM`, `AVG`, `MIN`, et `MAX`, vous pouvez obtenir des informations précieuses sur vos données et prendre des décisions éclairées en conséquence.