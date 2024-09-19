## Manipulation des Dates en SQL

Liens vers les cours précédents : [Fonctions de Chaîne en SQL](https://www.sqltutorial.org/sql-string-functions/)

### Introduction

Les fonctions de manipulation de dates en SQL sont essentielles pour travailler avec les données temporelles. Elles permettent de formater, comparer, et calculer des valeurs basées sur des dates et des heures, facilitant ainsi le traitement de données complexes.

Dans ce cours, nous allons couvrir les fonctions les plus couramment utilisées pour manipuler les dates en SQL, à savoir `NOW()`, `DATE_FORMAT`, et `DATEDIFF`.

### 1. La fonction `NOW()`

#### Description

La fonction `NOW()` retourne la date et l'heure actuelles du système sur lequel SQL est exécuté. Elle est souvent utilisée pour obtenir l'heure courante lors de l'insertion ou de la mise à jour d'enregistrements.

#### Syntaxe

```sql
SELECT NOW();
```

#### Exemple

```sql
SELECT NOW() AS date_actuelle;
```

Résultat :

| date_actuelle       |
|---------------------|
| 2022-01-01 12:00:00 |

```sql
INSERT INTO commandes (date_commande) VALUES (NOW());
```

Résultat :

| id_commande | date_commande       |
|-------------|---------------------|
| 1           | 2022-01-01 12:00:00 |

#### Remarque

La fonction `NOW()` retourne la date et l'heure actuelles au format `YYYY-MM-DD HH:MM:SS`. Si vous avez besoin de formats de date différents, vous pouvez utiliser la fonction `DATE_FORMAT()` pour personnaliser l'affichage.

### 2. La fonction `DATE_FORMAT`

#### Description

`DATE_FORMAT` est utilisée pour formater une date selon un format spécifique. Elle est utile pour afficher les dates dans un format lisible ou spécifique à une culture ou une région.

#### Syntaxe

```sql
SELECT DATE_FORMAT(date_colonne, '%d/%m/%Y %H:%i:%s');
```

Le deuxième paramètre de `DATE_FORMAT` spécifie le format de sortie, où:

- `%d` représente le jour en deux chiffres (01 à 31)
- `%m` représente le mois en deux chiffres (01 à 12)
- `%Y` représente l'année sur quatre chiffres
- `%H` représente l'heure au format 24 heures (00 à 23)
- `%i` représente les minutes (00 à 59)
- `%s` représente les secondes (00 à 59)

#### Exemple

Afficher la date actuelle dans un format personnalisé.

```sql
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y') AS date_formatee;
```

Résultat :

| date_formater |
|---------------|
| 11/08/2024    |

Cet exemple retourne les dates des commandes dans un format français typique (`jour`/`mois`/`année`).

Afficher la date et l'heure actuelles dans un format personnalisé.

```sql
SELECT DATE_FORMAT(NOW(), '%d/%m/%Y %H:%i:%s') AS date_formatee;
```

Résultat :

| date_formater       |
|---------------------|
| 11/08/2024 12:58:00 |

#### Remarque

La fonction `DATE_FORMAT` est utile pour afficher les dates dans un format personnalisé, mais elle ne modifie pas la date stockée dans la base de données. Si vous avez besoin de calculer des différences entre dates ou de manipuler des dates, vous pouvez utiliser d'autres fonctions telles que `DATEDIFF`.

### 3. La fonction `DATEDIFF`

#### Description

`DATEDIFF` calcule la différence entre deux dates en nombre de jours. C'est une fonction utile pour déterminer l'écart entre deux événements, comme la durée entre une date de commande et une date de livraison.

#### Syntaxe

```sql
SELECT DATEDIFF(date1, date2);
```

Cette fonction retourne un nombre entier qui représente le nombre de jours entre `date1` et `date2`. Si `date1` est antérieure à `date2`, la valeur sera négative.

#### Exemple d'utilisation

Calculer la différence en jours entre la date de commande et la date de livraison prévue.

```sql
SELECT 
    DATEDIFF(date_livraison, date_commande) 
AS jours_livraison
FROM commandes;
```

Résultat :

| jours_livraison |
|-----------------|
| 3               |

Dans cet exemple, la fonction `DATEDIFF` calcule la différence en jours entre la date de livraison et la date de commande pour chaque commande dans la table `commandes`.

### Autres Fonctions Utiles

En plus des fonctions mentionnées ci-dessus, voici quelques autres fonctions SQL couramment utilisées pour manipuler les dates :

- `CURDATE()` : Retourne la date actuelle sans l'heure.

```sql
SELECT CURDATE() AS date_actuelle;
```

Résultat :

| date_actuelle |
|---------------|
| 2024-08-11    |

- `CURTIME()` : Retourne l'heure actuelle sans la date.

```sql
SELECT CURTIME() AS heure_actuelle;
```

Résultat :

| heure_actuelle |
| --- |
| 12:58:00 |

`DATE_ADD()` : Ajoute un intervalle spécifié à une date.

```sql
SELECT DATE_ADD(date_commande, INTERVAL 3 DAY) AS date_livraison
FROM commandes;
```

Résultat :

| date_livraison |
|----------------|
| 2024-08-14     |

Dans cet exemple, la fonction `DATE_ADD` ajoute 3 jours à la date de commande pour calculer la date de livraison prévue.

Supposons que la date de commande soit le 11 août 2024. La fonction `DATE_ADD` ajoute 3 jours à cette date, ce qui donne le 14 août 2024 comme date de livraison prévue.

`DATE_SUB()` : Soustrait un intervalle spécifié à une date.

```sql
SELECT DATE_SUB(date_livraison, INTERVAL 2 DAY) AS date_expedition
FROM commandes;
```

Résultat :

| date_expedition |
|-----------------|
| 2024-08-12      |

Dans cet exemple, la fonction `DATE_SUB` soustrait 2 jours de la date de livraison pour calculer la date d'expédition prévue.

On déduit que la date de livraison soit le 14 août 2024. La fonction `DATE_SUB` soustrait 2 jours de cette date, ce qui donne le 12 août 2024 comme date d'expédition prévue.

`YEAR()`, `MONTH()`, `DAY()` : Extrait respectivement l'année, le mois ou le jour d'une date.

### Conclusion

La manipulation des dates en SQL est une compétence essentielle pour tout utilisateur de base de données. En utilisant des fonctions comme `NOW()`, `DATE_FORMAT`, `DATE_ADD` et `DATEDIFF`, vous pouvez formater, calculer, et comparer des valeurs de date de manière efficace. Ces outils sont particulièrement utiles pour la gestion des transactions, le reporting, et l'analyse des données temporelles.

N'hésitez pas à expérimenter ces fonctions avec vos propres données pour vous familiariser davantage avec leur utilisation.

Lien vers le cours original : [Manipulation des Dates en SQL](https://www.sqltutorial.org/sql-date-functions/)