## Procédures avec Paramètres IN, OUT, et INOUT

- **IN** : Les paramètres `IN` sont des paramètres d'entrée. La valeur est passée à la procédure au moment de l'appel, mais les modifications apportées à ce paramètre dans la procédure ne sont pas retournées à l'appelant.

- **OUT** : Les paramètres `OUT` sont utilisés pour renvoyer des valeurs à l'appelant. Les modifications apportées à ces paramètres dans la procédure sont visibles à l'extérieur une fois la procédure terminée.

- **INOUT** : Ces paramètres combinent les caractéristiques de `IN` et `OUT`. Ils passent une valeur à la procédure et retournent également une valeur modifiée à l'appelant.

### Procédure avec Paramètres IN et OUT

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

### Procédure avec Paramètres INOUT

Le paramètre `INOUT` est utilisé pour passer une valeur à la procédure et renvoyer une valeur modifiée à l'appelant.

Voici un exemple qui illustre l'utilisation des paramètres `INOUT` :

```sql
DELIMITER //

CREATE PROCEDURE augmenterSalaire(
    INOUT id INT,
    IN augmentation DECIMAL(10, 2)
)

BEGIN
    UPDATE employes
    SET salaire = salaire + augmentation
    WHERE employes.id = id;
END //

DELIMITER ;
```

Cette procédure stockée `augmenterSalaire` prend en paramètre l'`id` d'un employé et une `augmentation` de salaire. Elle augmente le salaire de l'employé de la valeur `augmentation`.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
SET @id = 2;
SET @augmentation = 500.00;

CALL augmenterSalaire(@id, @augmentation);
SELECT ROUND(@augmentation, 2) AS augmentation;
```

Résultat :

| augmentation |
|--------------|
| 500.00       |

- La procédure `augmenterSalaire` est appelée avec l'`id` de l'employé `2` et une augmentation de salaire de `500.00`. Le salaire de l'employé est augmenté de `500.00`.

```sql
SELECT * FROM employes;
```

| id | nom  | prenom  | email                                       | date_embauche | salaire |
|----|------|---------|---------------------------------------------|---------------|---------|
| 1  | Doe  | John    | [john@example.com](mailto:john@example.com) | 2024-08-11    | 5000.00 |
| 2  | Toto | Refreid | [toto@example.com](mailto:toto@example.com) | 2024-08-11    | 4000.00 |

### Exercice

1. Créez une procédure stockée `voirNom` qui prend en paramètre l'`id` d'un employé et renvoie son nom.
2. Appelez la procédure `voirNom` avec l'`id` de l'employé `1` et stockez le nom de l'employé dans une variable utilisateur `@nom`.
3. Affichez le nom de l'employé en utilisant la variable utilisateur `@nom`.

## Conclusion

Les procédures stockées avec des paramètres `IN`, `OUT`, et `INOUT` sont utiles pour passer des valeurs à la procédure et renvoyer des valeurs modifiées à l'appelant. Vous pouvez utiliser ces paramètres pour effectuer des opérations complexes sur les données de la base de données.