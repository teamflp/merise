## Gestion des procédures stockées

Dans cette section, nous allons voir comment gérer les procédures stockées dans MySQL. Nous allons voir comment afficher des informations sur une procédure stockée et comment supprimer une procédure stockée.

### Informations sur une procédure stockée

Pour obtenir des informations sur une procédure stockée, vous pouvez utiliser la commande `SHOW PROCEDURE STATUS`. Voici la syntaxe de la commande `SHOW PROCEDURE STATUS` :

```sql
SHOW PROCEDURE STATUS WHERE db = 'nom_de_la_base_de_donnees';
```

Vérifions l'existence de la procédure stockée `createTables` dans la base de données `membres` :

```sql
SHOW PROCEDURE STATUS WHERE db = 'membres'; -- Affiche les procédures stockées dans la base de données membres

DROP PROCEDURE IF EXISTS createTables; -- Supprimer la procédure stockée
```

Résultat :

```plaintext
+----------+----------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db       | Name           | Type      | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+----------+----------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| membres  | createTables   | PROCEDURE | root@localhost | 2024-08-11 17:18:45 | 2024-08-11 17:18:45 | DEFINER       |         | utf8mb4              | utf8mb4_general_ci   | utf8mb4_general_ci |
+----------+----------------+-----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
```

Cette requête affiche les informations sur la procédure stockée `createTables` dans la base de données `membres`.

- `Db` : Nom de la base de données.
- `Name` : Nom de la procédure stockée.
- `Type` : Type de la procédure stockée.
- `Definer` : Utilisateur qui a créé la procédure stockée.
- `Modified` : Date de la dernière modification de la procédure stockée.
- `Created` : Date de création de la procédure stockée.
- `Security_type` : Type de sécurité de la procédure stockée.
    - **Les types de sécurité** : Les types de sécurité suivants peuvent être utilisés pour les procédures stockées :
        1. `DEFINER` : La procédure stockée est exécutée avec les privilèges de l'utilisateur qui l'a créée.
        2. `INVOKER` : La procédure stockée est exécutée avec les privilèges de l'utilisateur qui l'appelle.
        3. `SQL SECURITY DEFINER` : La procédure stockée est exécutée avec les privilèges de l'utilisateur qui l'a créée.
- `Comment` : Commentaire de la procédure stockée.
- `character_set_client` : Jeu de caractères du client.
- `collation_connection` : Collation de la connexion.
- `Database Collation` : Collation de la base de données.



### Suppression d'une Procédure stockée avec la clause `DROP`

Pour supprimer une procédjson stockée, vous pouvez utiliser l'instruction `DROP PROCEDURE`. Voici la syntaxe pour supprimer une procédure stockée :

Syntaxe :
```sql
DROP PROCEDURE IF EXISTS nom_de_la_procedure;
```
Exemple d'utilisation :
```sql
DROP PROCEDURE IF EXISTS createTables;
```
