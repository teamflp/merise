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

### 2. Fonction `SUBSTRING`