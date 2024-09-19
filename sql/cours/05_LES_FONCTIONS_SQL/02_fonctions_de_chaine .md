Les fonctions de chaîne en SQL sont essentielles pour manipuler et transformer des données textuelles. Elles permettent d'accomplir une variété de tâches, telles que la concaténation de chaînes, l'extraction de sous-chaînes, la modification de contenu, et bien plus encore. Dans ce chapitre, nous allons explorer trois fonctions couramment utilisées : `CONCAT`, `SUBSTRING`, et `REPLACE`.

### 1. Fonction `CONCAT`

La fonction `CONCAT` est utilisée pour joindre deux ou plusieurs chaînes de caractères en une seule. Elle prend en entrée les chaînes que vous souhaitez combiner et retourne une nouvelle chaîne résultante.

Syntaxe

```sql
SELECT CONCAT(string1, string2, ...)
FROM table_name
WHERE condition;
```

#### Exemple

```sql
SELECT CONCAT(prenom, ' ', nom) AS nom_complet
FROM utilisateurs;
```

Dans cet exemple, la fonction `CONCAT` est utilisée pour combiner les colonnes `prenom` et `nom` de la table `utilisateurs` en une seule chaîne représentant le nom complet de chaque utilisateur.

Résultat :

| nom_complet |
| --- |
| Alice Dupont |
| Bob Martin |
| Claire Dubois |

#### Remarque

Si l'une des chaînes passées à `CONCAT` est `NULL`, la fonction retournera `NULL` pour toute la chaîne concaténée dans certaines versions de SQL. Pour éviter cela, vous pouvez utiliser `CONCAT_WS` (concatenate with separator), qui ignore les valeurs `NULL` et ajoute un séparateur spécifié.

### 2. Fonction `SUBSTRING`

La fonction `SUBSTRING` est utilisée pour extraire une sous-chaîne d'une chaîne de caractères. Elle est particulièrement utile lorsque vous avez besoin d'une partie spécifique d'une chaîne, comme un code postal, un domaine d'adresse e-mail, ou tout autre extrait de texte.

#### Syntaxe

```sql
SELECT SUBSTRING(string, start, length) AS sub_string
FROM table_name
WHERE condition;
```

- `string` : La chaîne de caractères à partir de laquelle extraire la sous-chaîne.
- `start` : La position de départ de l'extraction.
- `length` : La longueur de la sous-chaîne à extraire.
- `SUBSTRING()` : La fonction qui extrait la sous-chaîne.
- `AS sub_string` : L'alias de la colonne résultante.
- `table_name` : Le nom de la table à interroger.
- `condition` : La condition à appliquer pour filtrer les lignes.

#### Exemple

```sql
SELECT SUBSTRING(email, 1, 5) AS domaine_email
FROM utilisateurs;
```

Dans cet exemple, la fonction `SUBSTRING` est utilisée pour extraire les cinq premiers caractères de la colonne `email` de la table `utilisateurs`, représentant le domaine de l'adresse e-mail de chaque utilisateur.

Résultat :

| domaine_email |
| --- |
| bob@e |
| clair |
| pater |

### 3. Fonction `REPLACE`

#### Description

La fonction `REPLACE` permet de remplacer toutes les occurrences d'une sous-chaîne par une autre chaîne dans une chaîne donnée. C'est une fonction puissante pour nettoyer ou formater des données textuelles.

#### Syntaxe

```sql
SELECT REPLACE(chaine, ancienne_sous_chaine, nouvelle_sous_chaine) AS new_string
FROM table_name
WHERE condition;

SELECT * FROM utilisateurs;
```

- **chaine** : La chaîne de caractères d'origine.
- **ancienne_sous_chaine** : La sous-chaîne à rechercher et à remplacer.
- **nouvelle_sous_chaine** : La sous-chaîne qui remplacera l'ancienne.

#### Exemple

```sql
SELECT REPLACE(nom, 'a', 'o') AS nom_modifie
FROM utilisateurs;
```

Dans cet exemple, la fonction `REPLACE` est utilisée pour remplacer toutes les occurrences de la lettre `a` par la lettre `o` dans la colonne `nom` de la table `utilisateurs`.

Résultat :

| nom_modifie |
| --- |
| Alice Dupont |
| Bob Morton |
| Cloure Dubois |


### La fonction `LENGTH`

La fonction lenght() permet de retourner la longueur d'une chaîne de caractères en SQL. Elle est utile pour déterminer le nombre de caractères dans une chaîne donnée, ce qui peut être utile dans divers scénarios, tels que la validation de la longueur d'une entrée utilisateur ou la manipulation de données textuelles.

Syntaxe

```sql
SELECT LENGTH(chaine) AS longueur
FROM table_name
WHERE condition;
```

- `chaine` : La chaîne de caractères dont vous souhaitez connaître la longueur.
- `LENGTH()` : La fonction qui retourne la longueur de la chaîne.
- `AS longueur` : L'alias de la colonne résultante.
- `table_name` : Le nom de la table à interroger.
- `condition` : La condition à appliquer pour filtrer les lignes.
- `SELECT` : La clause qui spécifie les colonnes à sélectionner.
- `FROM` : La clause qui spécifie la table à interroger.
- `WHERE` : La clause qui spécifie les conditions pour filtrer les lignes.
- `AS` : Le mot-clé qui permet de définir un alias pour une colonne ou une table.
- `longueur` : L'alias de la colonne résultante.

Exemple

```sql
SELECT LENGTH(nom) AS longueur_nom
FROM utilisateurs;
```

Dans cet exemple, la fonction `LENGTH` est utilisée pour retourner la longueur de la colonne `nom` de la table `utilisateurs`, représentant le nombre de caractères dans chaque nom d'utilisateur.

Résultat :

| longueur_nom |
|--------------| 
| 11           |


Les fonctions de chaîne comme `CONCAT`, `SUBSTRING`, `REPLACE` et `LENGTH` sont des outils puissants en SQL pour manipuler et transformer les données textuelles. Elles permettent d'extraire, de combiner, et de reformater des chaînes de caractères de manière flexible et efficace. Leur utilisation appropriée peut simplifier de nombreuses tâches de gestion et de transformation des données dans une base de données.

Il est important de se familiariser avec ces fonctions et de les utiliser dans le contexte approprié pour maximiser leur utilité dans vos requêtes SQL.
