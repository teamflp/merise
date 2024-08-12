## Procédures stockées avec Conditions

Les procédures stockées peuvent contenir des conditions pour exécuter des instructions SQL en fonction de certaines conditions.

#### Exemple de Procédure stockée avec Condition

Voici un exemple qui illustre l'utilisation des conditions dans une procédure stockée :

```sql 
DELIMITER //

CREATE PROCEDURE voirSalaireCondition(
    IN id INT
)

BEGIN
    DECLARE sal DECIMAL(10, 2);

    SELECT employes.salaire INTO sal
    FROM employes
    WHERE employes.id = id;

    IF sal > 4000 THEN
        SELECT 'Salaire supérieur à 4000';
    ELSE
        SELECT 'Salaire inférieur ou égal à 4000';
    END IF;
END //
 
DELIMITER ;
```

Cette procédure stockée `voirSalaireCondition` prend en paramètre l'`id` d'un employé et affiche un message en fonction du salaire de l'employé. Si le salaire est supérieur à `4000`, un message indiquant "Salaire supérieur à 4000" est affiché. Sinon, un message indiquant "Salaire inférieur ou égal à 4000" est affiché.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL voirSalaireCondition(2);
```

Résultat :

| 'Salaire supérieur à 4000' |
|----------------------------|

#### Exemple de Procédure stockée avec Condition ELSEIF

Voici un exemple qui illustre l'utilisation de la condition `ELSEIF` dans une procédure stockée :

```sql
DELIMITER //

CREATE PROCEDURE voirSalaireConditionElseIf(
    IN id INT
)

BEGIN
    DECLARE sal DECIMAL(10, 2);

    SELECT employes.salaire INTO sal
    FROM employes
    WHERE employes.id = id;

    IF sal > 4000 THEN
        SELECT 'Salaire supérieur à 4000';
    ELSEIF sal = 4000 THEN
        SELECT 'Salaire égal à 4000';
    ELSE
        SELECT 'Salaire inférieur à 4000';
    END IF;
END //

DELIMITER ;
```

Cette procédure stockée `voirSalaireConditionElseIf` prend en paramètre l'`id` d'un employé et affiche un message en fonction du salaire de l'employé. Si le salaire est supérieur à `4000`, un message indiquant "Salaire supérieur à 4000" est affiché. Si le salaire est égal à `4000`, un message indiquant "Salaire égal à 4000" est affiché. Sinon, un message indiquant "Salaire inférieur à 4000" est affiché.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL voirSalaireConditionElseIf(2);
```

Résultat :

| 'Salaire supérieur à 4000' |
|----------------------------|

## Procédure stockée avec Condition CASE

La condition `CASE` peut également être utilisée dans une procédure stockée pour exécuter des instructions SQL en fonction de différentes conditions.

Voici un exemple qui illustre l'utilisation de la condition `CASE` dans une procédure stockée :

```sql
DELIMITER //

CREATE PROCEDURE voirSalaireConditionCase(
    IN id INT
)

BEGIN
    DECLARE sal DECIMAL(10, 2);

    SELECT employes.salaire INTO sal
    FROM employes
    WHERE employes.id = id;

    CASE
        WHEN sal > 4000 THEN
            SELECT 'Salaire supérieur à 4000';
        WHEN sal = 4000 THEN
            SELECT 'Salaire égal à 4000';
        ELSE
            SELECT 'Salaire inférieur à 4000';
    END CASE;
END //

DELIMITER ;
```

Cette procédure stockée `voirSalaireConditionCase` prend en paramètre l'`id` d'un employé et affiche un message en fonction du salaire de l'employé. Si le salaire est supérieur à `4000`, un message indiquant "Salaire supérieur à 4000" est affiché. Si le salaire est égal à `4000`, un message indiquant "Salaire égal à 4000" est affiché. Sinon, un message indiquant "Salaire inférieur à 4000" est affiché.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL voirSalaireConditionCase(2);
```

Résultat :

| 'Salaire supérieur à 4000' |
|----------------------------|
