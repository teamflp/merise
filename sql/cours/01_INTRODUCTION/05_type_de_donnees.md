### Types de données

Les bases de données relationnelles stockent les données dans des tables, où chaque colonne est associée à un type de données spécifique. Les types de données définissent la nature des valeurs que chaque colonne peut contenir, qu'il s'agisse d'entiers, de chaînes de caractères, de dates, etc.

Voici quelques types de données couramment utilisés dans les bases de données relationnelles :

1. **Entier (INT)** : Stocke des nombres entiers, tels que `1`, `2`, `3`, `-1`, `-2`, etc.
2. **Décimal (DECIMAL)** : Stocke des nombres décimaux avec une précision spécifiée, tels que `3.14`, `2.718`, etc. Utilisé pour représenter des valeurs monétaires ou autres mesures nécessitant des décimales.
3. **Chaîne de caractères (VARCHAR)** : Stocke des chaînes de caractères de longueur variable, telles que `"Hello, World!"`, `"SQL"`, etc. La taille maximale est définie lors de la création de la colonne.
4. **Date (DATE)** : Stocke des dates au format `AAAA-MM-JJ`, telles que `'2022-01-01'`, `'2022-12-31'`.
5. **Date et heure (DATETIME)** : Stocke des dates et heures au format `AAAA-MM-JJ HH:MM:SS`, telles que `'2022-01-01 12:00:00'`, `'2022-12-31 23:59:59'`.
6. **Booléen (BOOLEAN)** : Stocke des valeurs booléennes représentant des états logiques, telles que `TRUE` (vrai) ou `FALSE` (faux).
7. **Clé primaire (PRIMARY KEY)** : Identifie de manière unique chaque enregistrement dans une table. Ce n'est pas un type de données en soi, mais une contrainte qui peut être appliquée à une colonne ou un ensemble de colonnes.
8. **Clé étrangère (FOREIGN KEY)** : Établit une relation entre deux tables en associant la clé primaire d'une table à une colonne dans une autre table. C'est également une contrainte plutôt qu'un type de données.
9. **Auto-incrément (AUTO_INCREMENT)** : Gère automatiquement l'incrémentation des valeurs pour une colonne entière, généralement utilisée avec les clés primaires.
10. **NULL** : Indique qu'une colonne peut contenir des valeurs nulles. Ce n'est pas un type de données mais une condition qui peut être appliquée aux colonnes.
11. **Index** : Améliore les performances des requêtes en accélérant la recherche de données dans une table. Ce n'est pas un type de données mais une structure qui optimise l'accès aux données.
12. **Contrainte de clé étrangère (FOREIGN KEY CONSTRAINT)** : Assure l'intégrité référentielle entre les tables en garantissant qu'une valeur dans une colonne de clé étrangère existe dans une colonne de clé primaire correspondante.
13. **Contrainte de vérification (CHECK CONSTRAINT)** : Vérifie que les valeurs d'une colonne respectent une condition spécifique, comme des bornes numériques.
14. **Contrainte de clé primaire (PRIMARY KEY CONSTRAINT)** : Assure que les valeurs d'une ou de plusieurs colonnes sont uniques et non nulles.
15. **Contrainte de clé unique (UNIQUE CONSTRAINT)** : Assure que les valeurs d'une colonne ou d'un groupe de colonnes sont uniques.
16. **Contrainte de non-null (NOT NULL CONSTRAINT)** : Assure qu'une colonne ne peut pas contenir de valeurs nulles.
17. **Contrainte de défaut (DEFAULT CONSTRAINT)** : Définit une valeur par défaut pour une colonne si aucune valeur n'est spécifiée lors de l'insertion.

Les types de données et les contraintes jouent un rôle essentiel dans la définition de la structure des tables et garantissent l'intégrité des données dans une base de données relationnelle.

---

### Exemple de définition de table avec types de données

Voici un exemple de définition de table en SQL avec des types de données et des contraintes :

```sql
CREATE TABLE utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    email VARCHAR(100) UNIQUE,
    actif BOOLEAN DEFAULT TRUE
);
```

Dans cet exemple :

- `id` est une clé primaire de type entier (`INT`) avec auto-incrémentation.
- `nom` et `prenom` sont des chaînes de caractères (`VARCHAR`) de longueur maximale 50 caractères, non nulles.
- `date_naissance` est une date (`DATE`) représentant la date de naissance de l'utilisateur.
- `email` est une chaîne de caractères (`VARCHAR`) de longueur maximale 100 caract
- `actif` est un booléen (`BOOLEAN`) avec une valeur par défaut de `TRUE`.
- `email` est une clé unique, garantissant que chaque adresse e-mail est unique dans la table.

Cette définition de table illustre comment les types de données et les contraintes peuvent être utilisés pour définir la structure d'une table dans une base de données relationnelle.