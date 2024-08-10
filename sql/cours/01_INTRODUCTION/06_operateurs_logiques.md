### Opérateurs logiques

Les opérateurs logiques permettent de combiner plusieurs conditions pour obtenir un résultat. Il existe trois opérateurs logiques en SQL :

1. **`AND`** : L'opérateur `AND` renvoie `TRUE` si toutes les conditions sont vraies.
2. **`OR`** : L'opérateur `OR` renvoie `TRUE` si au moins l'une des conditions est vraie.
3. **`NOT`** : L'opérateur `NOT` renvoie `TRUE` si la condition est fausse.
4. **`IN`** : L'opérateur `IN` permet de spécifier une liste de valeurs à comparer.
5. **`BETWEEN`** : L'opérateur `BETWEEN` permet de spécifier une plage de valeurs à comparer.
6. **`LIKE`** : L'opérateur `LIKE` permet de comparer une valeur à un motif de chaîne de caractères.
7. **`IS NULL`** : L'opérateur `IS NULL` permet de vérifier si une valeur est nulle.
8. **`IS NOT NULL`** : L'opérateur `IS NOT NULL` permet de vérifier si une valeur n'est pas nulle.
9. **`EXISTS`** : L'opérateur `EXISTS` permet de vérifier si une sous-requête renvoie des résultats.
10. **`ALL`** : L'opérateur `ALL` permet de comparer une valeur à toutes les valeurs d'une sous-requête.
11. **`ANY`** : L'opérateur `ANY` permet de comparer une valeur à au moins une valeur d'une sous-requête.
12. **`SOME`** : L'opérateur `SOME` est synonyme de `ANY`.
13. **`UNIQUE`** : L'opérateur `UNIQUE` permet de vérifier si une colonne contient des valeurs uniques.
14. **`EXCEPT`** : L'opérateur `EXCEPT` permet de comparer les résultats de deux requêtes et de renvoyer les lignes qui n'apparaissent pas dans la deuxième requête.
15. **`INTERSECT`** : L'opérateur `INTERSECT` permet de comparer les résultats de deux requêtes et de renvoyer les lignes qui apparaissent dans les deux requêtes.

Voici un exemple d'utilisation de l'opérateur `AND` :

```sql
SELECT * FROM utilisateurs
WHERE nom = 'Doe' AND prenom = 'John';
``` 

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom est `Doe` et le prénom est `John`.

L'opérateur `OR` peut être utilisé pour combiner des conditions de la manière suivante :

```sql
SELECT * FROM utilisateurs
WHERE nom = 'Doe' OR prenom = 'John';
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom est `Doe` ou le prénom est `John`.

L'opérateur `NOT` peut être utilisé pour inverser une condition de la manière suivante :

```sql
SELECT * FROM utilisateurs
WHERE NOT nom = 'Doe';
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom n'est pas `Doe`.

L'opérateur `IN` peut être utilisé pour spécifier une liste de valeurs à comparer :

```sql
SELECT * FROM utilisateurs
WHERE nom IN ('Doe', 'Smith', 'Johnson');
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom est `Doe`, `Smith` ou `Johnson`.

L'opérateur `BETWEEN` peut être utilisé pour spécifier une plage de valeurs à comparer :

```sql
SELECT * FROM utilisateurs
WHERE age BETWEEN 18 AND 30;
```

Dans cet exemple, la requête renverra tous les utilisateurs dont l'âge est compris entre 18 et 30 ans.

L'opérateur `LIKE` peut être utilisé pour comparer une valeur à un motif de chaîne de caractères :

```sql
SELECT * FROM utilisateurs
WHERE nom LIKE 'D%';
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom commence par `D`.

L'opérateur `IS NULL` peut être utilisé pour vérifier si une valeur est nulle :

```sql
SELECT * FROM utilisateurs
WHERE email IS NULL;
```

Dans cet exemple, la requête renverra tous les utilisateurs dont l'adresse e-mail est nulle.

L'opérateur `IS NOT NULL` peut être utilisé pour vérifier si une valeur n'est pas nulle :

```sql
SELECT * FROM utilisateurs
WHERE email IS NOT NULL;
```

Dans cet exemple, la requête renverra tous les utilisateurs dont l'adresse e-mail n'est pas nulle.

L'opérateur `EXISTS` peut être utilisé pour vérifier si une sous-requête renvoie des résultats :

```sql
SELECT * FROM utilisateurs
WHERE EXISTS (SELECT * FROM emprunts WHERE utilisateurs.id = emprunts.utilisateur_id);
```

Dans cet exemple, la requête renverra tous les utilisateurs qui ont emprunté des livres.

L'opérateur `ALL` peut être utilisé pour comparer une valeur à toutes les valeurs d'une sous-requête :

```sql
SELECT * FROM utilisateurs
WHERE age > ALL (SELECT age FROM utilisateurs WHERE nom = 'Doe');
```

Dans cet exemple, la requête renverra tous les utilisateurs dont l'âge est supérieur à l'âge de tous les utilisateurs dont le nom est `Doe`.

L'opérateur `ANY` peut être utilisé pour comparer une valeur à au moins une valeur d'une sous-requête :

```sql
SELECT * FROM utilisateurs
WHERE age > ANY (SELECT age FROM utilisateurs WHERE nom = 'Doe');
```

Dans cet exemple, la requête renverra tous les utilisateurs dont l'âge est supérieur à l'âge d'au moins un utilisateur dont le nom est `Doe`.

L'opérateur `UNIQUE` peut être utilisé pour vérifier si une colonne contient des valeurs uniques :

```sql
SELECT * FROM utilisateurs
WHERE UNIQUE (SELECT nom FROM utilisateurs);
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom est unique.

L'opérateur `EXCEPT` peut être utilisé pour comparer les résultats de deux requêtes et renvoyer les lignes qui n'apparaissent pas dans la deuxième requête :

```sql
SELECT * FROM utilisateurs
EXCEPT
SELECT * FROM utilisateurs WHERE nom = 'Doe';
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom n'est pas `Doe`.

L'opérateur `INTERSECT` peut être utilisé pour comparer les résultats de deux requêtes et renvoyer les lignes qui apparaissent dans les deux requêtes :

```sql
SELECT * FROM utilisateurs
INTERSECT
SELECT * FROM utilisateurs WHERE nom = 'Doe';
```

Dans cet exemple, la requête renverra tous les utilisateurs dont le nom est `Doe`.

Les opérateurs logiques sont largement utilisés pour filtrer les données dans les requêtes SQL et permettent de spécifier des conditions complexes pour obtenir les résultats souhaités.

---

### Exercice

1. Écrivez une requête SQL pour afficher les utilisateurs dont le nom est `Doe` et le prénom est `John`.

2. Écrivez une requête SQL pour afficher les utilisateurs dont le nom est `Doe` ou le prénom est `John`.

3. Écrivez une requête SQL pour afficher les utilisateurs dont le nom n'est pas `Doe`.

4. Écrivez une requête SQL pour afficher les utilisateurs dont le nom commence par `D`.

5. Écrivez une requête SQL pour afficher les utilisateurs dont le nom contient `oe`.

---

### Réponses

1. **Utilisateurs avec nom `Doe` et prénom `John` :**

```sql
SELECT * FROM utilisateurs
WHERE nom = 'Doe' AND prenom = 'John';
```
2. **Utilisateurs avec nom `Doe` ou prénom `John` :**

```sql
SELECT * FROM utilisateurs
WHERE nom = 'Doe' OR prenom = 'John';
```

3. **Utilisateurs dont le nom n'est pas `Doe` :**

```sql
SELECT * FROM utilisateurs
WHERE nom <> 'Doe';
```

4. **Utilisateurs dont le nom commence par `D` :**

```sql
SELECT * FROM utilisateurs
WHERE nom LIKE 'D%';
```

5. **Utilisateurs dont le nom contient `oe` :**

```sql
SELECT * FROM utilisateurs
WHERE nom LIKE '%oe%';
```

Les opérateurs logiques `AND`, `OR`, `NOT`, `IN`, `BETWEEN`, `LIKE`, `IS NULL`, `IS NOT NULL`, `EXISTS`, `ALL`, `ANY`, `SOME`, `UNIQUE`, `EXCEPT` et `INTERSECT` sont des outils puissants pour filtrer les données dans les requêtes SQL et permettent de spécifier des conditions complexes pour obtenir les résultats souhaités.


### Conclusion

Les opérateurs logiques sont des outils essentiels pour filtrer les données dans les requêtes SQL. Ils permettent de combiner plusieurs conditions pour obtenir des résultats précis et répondre à des questions complexes. En comprenant comment utiliser les opérateurs logiques, vous serez en mesure d'écrire des requêtes SQL efficaces et de manipuler les données de manière plus avancée.
