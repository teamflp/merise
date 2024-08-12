## Procédures stockées avec les Boucles

Les procédures stockées peuvent contenir des boucles pour répéter des instructions SQL jusqu'à ce qu'une condition soit remplie.

### Procédures stockées avec la Boucle `WHILE`

La boucle `WHILE` est une boucle qui répète un bloc d'instructions tant qu'une condition est vraie.

Voici un exemple qui illustre l'utilisation des boucles dans une procédure stockée :

```sql
DELIMITER //

CREATE PROCEDURE afficherEmployes()

BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE n INT;
    DECLARE nom VARCHAR(100);
    DECLARE prenom VARCHAR(100);

    SELECT COUNT(*) INTO n -- On stocke le nombre total d'employés dans la variable n
    FROM employes;

    WHILE i <= n DO
        SELECT employes.nom, employes.prenom INTO nom, prenom -- On stocke le nom et le prénom de l'employé dans les variables nom et prenom
        FROM employes
        WHERE employes.id = i;

        SELECT CONCAT(nom, ' ', prenom) AS employe; -- On affiche le nom et le prénom de l'employé
        SET i = i + 1; -- On incrémente i
    END WHILE;
END //

DELIMITER ;
```

Cette procédure stockée `afficherEmployes` affiche le nom et le prénom de chaque employé dans la table `employes` en utilisant une boucle `WHILE`.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL afficherEmployes();
```

Résultat :

| employe       |
|---------------|
| Doe John      |

### Procédures stockées avec la Boucle `REPEAT`

Une autre façon de créer une boucle dans une procédure stockée est d'utiliser la boucle `REPEAT`.

La boucle `REPEAT` répète un bloc d'instructions jusqu'à ce qu'une condition soit vraie.

Voici un exemple qui illustre l'utilisation de la boucle `REPEAT` dans une procédure stockée :

```sql
DELIMITER //

CREATE PROCEDURE afficherEmployesRepeat()

BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE n INT;
    DECLARE nom VARCHAR(100);
    DECLARE prenom VARCHAR(100);

    SELECT COUNT(*) INTO n -- On stocke le nombre total d'employés dans la variable n
    FROM employes;

    REPEAT
        SELECT employes.nom, employes.prenom INTO nom, prenom -- On stocke le nom et le prénom de l'employé dans les variables nom et prenom
        FROM employes
        WHERE employes.id = i;

        SELECT CONCAT(nom, ' ', prenom) AS employe; -- On affiche le nom et le prénom de l'employé
        SET i = i + 1; -- On incrémente i
    UNTIL i > n END REPEAT;
END //

DELIMITER ;
```

Cette procédure stockée `afficherEmployesRepeat` affiche le nom et le prénom de chaque employé dans la table `employes` en utilisant une boucle `REPEAT`.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL afficherEmployesRepeat();
```

Résultat :

| employe       |
|---------------|
| Doe John      |

### Procédures stockées avec la Boucle `LOOP`

La boucle `LOOP` est une boucle qui répète un bloc d'instructions indéfiniment jusqu'à ce qu'une condition de sortie soit rencontrée.

Voici un exemple qui illustre l'utilisation de la boucle `LOOP` dans une procédure stockée :

```sql
DELIMITER //

CREATE PROCEDURE afficherEmployesLoop()

BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE n INT;
    DECLARE nom VARCHAR(100);
    DECLARE prenom VARCHAR(100);

    SELECT COUNT(*) INTO n -- On stocke le nombre total d'employés dans la variable n
    FROM employes;

    LOOP
        SELECT employes.nom, employes.prenom INTO nom, prenom -- On stocke le nom et le prénom de l'employé dans les variables nom et prenom
        FROM employes
        WHERE employes.id = i;

        SELECT CONCAT(nom, ' ', prenom) AS employe; -- On affiche le nom et le prénom de l'employé
        SET i = i + 1; -- On incrémente i

        IF i > n THEN LEAVE; END IF; -- On sort de la boucle si i est supérieur à n
    END LOOP;
END //

DELIMITER ;
```

Cette procédure stockée `afficherEmployesLoop` affiche le nom et le prénom de chaque employé dans la table `employes` en utilisant une boucle `LOOP`.

Pour appeler cette procédure stockée, vous pouvez utiliser l'instruction `CALL` :

```sql
CALL afficherEmployesLoop();
```

Résultat :

| employe       |
|---------------|
| Doe John      |

### Conclusion

Les boucles sont très importants pour répéter des instructions SQL dans une procédure stockée. Vous pouvez utiliser les boucles `WHILE`, `REPEAT` et `LOOP` pour créer des procédures stockées plus complexes et flexibles.