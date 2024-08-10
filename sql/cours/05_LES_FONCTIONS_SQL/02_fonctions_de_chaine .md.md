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

| nom_complet   |
|---------------|
| Alice Dupont  |
| Bob Martin    |
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
|---------------|
| bob@e         |
| clair         |
| pater         |