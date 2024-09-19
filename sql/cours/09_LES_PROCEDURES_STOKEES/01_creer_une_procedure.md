## Création d'une procédure stockée

Pour créer une procédure stockée en SQL, vous devez utiliser l'instruction `CREATE PROCEDURE`. Voici la syntaxe générale pour créer une procédure stockée :

```sql
CREATE PROCEDURE nom_de_la_procedure
AS
BEGIN
    -- Instructions SQL
END;
```

- `nom_de_la_procedure` : Le nom de la procédure stockée que vous souhaitez créer.
- `AS` : Mot-clé indiquant le début du bloc de la procédure stockée.
- `BEGIN` : Début du bloc de la procédure stockée.
- `END` : Fin du bloc de la procédure stockée.

#### Exemple Simple

Supposons que nous voulons créer une procédure pour insérer un nouvel enregistrement dans table `employes`

Au préalable, nous devons avoir une base de données `membres` pour créer la procédure stockée.:

On sélectionne la base de données dans laquelle on veut créer la procédure stockée :

```sql
USE membres;
```

```sql
DELIMITER //

CREATE PROCEDURE createTables()
BEGIN
    CREATE TABLE IF NOT EXISTS employes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nom VARCHAR(100),
        prenom VARCHAR(100),
        email VARCHAR(100) UNIQUE,
        date_embauche DATE,
        salaire DECIMAL(10, 2)
    );

    SELECT 'Table employes créée avec succès';

END //

DELIMITER ;
```

Cette procédure stockée `createTables` crée une table `employes` avec les colonnes `id`, `nom`, `prenom`, `email`, `date_embauche` et `salaire`. Avant de créer la table, la procédure vérifie si la table `employes` existe déjà. Si la table n'existe pas, elle est créée. Un message de confirmation est ensuite affiché.

Pour exécuter la procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL createTables();
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

#### Exemple d'une procédure stockée pour insérer un nouvel enregistrement

```sql
DELIMITER //

CREATE PROCEDURE insertEmploye(
    IN nom VARCHAR(50),
    IN prenom VARCHAR(50),
    IN email VARCHAR(50),
    IN date_embauche DATE,
    IN salaire DECIMAL(10, 2)
)
BEGIN
    -- Vérifie si l'email existe déjà dans la table
    IF (SELECT COUNT(*) FROM employes WHERE employes.email = email) > 0 THEN
        -- On affiche un message si l'email est déjà utilisé
        SELECT 'Email déjà utilisé';
    ELSE
        -- Sinon, on ajoute l'employé
        INSERT INTO employes (nom, prenom, email, date_embauche, salaire)
        VALUES (nom, prenom, email, date_embauche, salaire);
        
        -- Message de confirmation
        SELECT 'Employé ajouté avec succès';
    END IF;
END //

DELIMITER ;
```

Cette procédure stockée `insertEmploye` prend en paramètre le nom, le prénom, l'email, la date d'embauche et le salaire d'un employé, puis insère un nouvel enregistrement dans la table `employes`. Avant d'insérer l'employé, la procédure vérifie si l'email est déjà utilisé dans la table `employes`. Si l'email est déjà utilisé, un message est affiché. Sinon, l'employé est ajouté à la table `employes` et un message de confirmation est affiché.

Pour exécuter la procédure stockée `insertEmploye`, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL insertEmploye('Doe', 'John', 'john@example.com', '2024-08-11', 5000.00);
CALL insertEmploye('Toto', 'Refreid', 'toto@example.com', '2024-08-11', 4000.00);
```

Cette commande insère deux nouveaux employés dans la table `employes`.

Résultat :

```sql
SELECT * FROM employes;
```

| id | nom  | prenom  | email                                       | date_embauche | salaire |
|----|------|---------|---------------------------------------------|---------------|---------|
| 1  | Doe  | John    | [john@example.com](mailto:john@example.com) | 2024-08-11    | 5000.00 |
| 2  | Toto | Refreid | [toto@example.com](mailto:toto@example.com) | 2024-08-11    | 4000.00 |

### Procédures avec Paramètres IN, OUT, et INOUT

- **IN** : Les paramètres `IN` sont des paramètres d'entrée. La valeur est passée à la procédure au moment de l'appel, mais les modifications apportées à ce paramètre dans la procédure ne sont pas retournées à l'appelant.

- **OUT** : Les paramètres `OUT` sont utilisés pour renvoyer des valeurs à l'appelant. Les modifications apportées à ces paramètres dans la procédure sont visibles à l'extérieur une fois la procédure terminée.

- **INOUT** : Ces paramètres combinent les caractéristiques de `IN` et `OUT`. Ils passent une valeur à la procédure et retournent également une valeur modifiée à l'appelant.

#### Exemple de Procédure avec Paramètres IN et OUT

Voici un exemple qui illustre l'utilisation des paramètres `IN` et `OUT` :  
    
```sql
DELIMITER //

CREATE PROCEDURE voirSalaire(
    IN id INT,
    OUT salaire DECIMAL(10, 2)
)

BEGIN
    SELECT employes.salaire INTO salaire
    FROM employes
    WHERE employes.id = id;
END //

DELIMITER ;
```

Cette procédure stockée `voirSalaire` prend en paramètre l'`id` d'un employé et renvoie son salaire. Le salaire est stocké dans le paramètre `OUT` `salaire`.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL voirSalaire(2, @salaire);
SELECT ROUND(@salaire, 2) AS salaire;
```
- La procédure `voirSalaire` est appelée avec l'`id` de l'employé `2`. Le salaire de l'employé est stocké dans la variable `@salaire`, qui est ensuite affichée.
- La clause suivante `SELECT ROUND(@salaire, 2) AS salaire;` arrondit le salaire à deux décimales.
- @salaire est une variable utilisateur qui stocke le salaire de l'employé. Elle est déclarée en tant que variable utilisateur en utilisant le préfixe `@`.

Résultat :

| salaire |
|---------|
| 4000.00 |


### Procédures stockées avec Gestion des Erreurs

Les procédures stockées peuvent gérer les erreurs en utilisant des blocs `TRY...CATCH`.

#### Exemple de Procédure stockée avec Gestion des Erreurs

Voici un exemple qui illustre l'utilisation des blocs `TRY...CATCH` dans une procédure stockée :

```sql
DELIMITER //

CREATE PROCEDURE voirSalaireErreur(
    IN id INT
)

BEGIN
    DECLARE sal DECIMAL(10, 2);

    BEGIN
        SELECT employes.salaire INTO sal
        FROM employes
        WHERE employes.id = id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT 'Employé non trouvé';
    END;

    SELECT sal;
END //

DELIMITER ;
```

Cette procédure stockée `voirSalaireErreur` prend en paramètre l'`id` d'un employé et affiche le salaire de l'employé. Si l'employé n'est pas trouvé dans la table `employes`, un message indiquant "Employé non trouvé" est affiché.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL voirSalaireErreur(3);
```

Résultat :

| 'Employé non trouvé' |
|----------------------|

