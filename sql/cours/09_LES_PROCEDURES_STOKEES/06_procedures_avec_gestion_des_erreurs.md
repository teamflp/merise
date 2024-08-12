## Procédures stockées avec Gestion des Erreurs

Il faut dire que MySQL ne supporte pas les blocs `TRY...CATCH` mais utilise plutôt les blocs `BEGIN...END` pour gérer les erreurs.

### Syntaxe

```sql
BEGIN
    -- Instructions SQL
EXCEPTION
    WHEN condition1 THEN
        -- Instructions à exécuter si condition1 est vraie
    WHEN condition2 THEN
        -- Instructions à exécuter si condition2 est vraie
    ELSE
        -- Instructions à exécuter si aucune des conditions n'est vraie
END;
```

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


