## Procedures génériques


### Inseretion de données multiples  

Cette procédure permet d'insérer plusieurs utilisateurs et leurs commentaires respectifs en une seule opération. Les utilisateurs et les commentaires sont fournis sous forme de chaînes de caractères formatées.

Code :
        
```sql
DELIMITER //

CREATE PROCEDURE insertMultipleData(IN user_names TEXT, IN commentaires TEXT)
BEGIN
    DECLARE user_nom VARCHAR(100); 
    DECLARE user_prenom VARCHAR(100);
    DECLARE user_email VARCHAR(100);
    DECLARE user_id INT;
    DECLARE i INT DEFAULT 1;
    DECLARE user_count INT;
    DECLARE comment_count INT;

    SET user_count = LENGTH(user_names) - LENGTH(REPLACE(user_names, '|', '')) + 1;
    SET comment_count = LENGTH(commentaires) - LENGTH(REPLACE(commentaires, '|', '')) + 1;

    IF user_count != comment_count THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Le nombre d\'utilisateurs doit correspondre au nombre de commentaires.";
    END IF;

    WHILE i <= user_count DO
        SET user_info = SUBSTRING_INDEX(SUBSTRING_INDEX(user_names, '|', i), '|', -1);
        SET comment_info = SUBSTRING_INDEX(SUBSTRING_INDEX(commentaires, '|', i), '|', -1);

        SET user_nom = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(user_info, ',', 1), ',', -1));
        SET user_prenom = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(user_info, ',', 2), ',', -1));
        SET user_email = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(user_info, ',', 3), ',', -1));

        INSERT INTO users (nom, prenom, email) VALUES (user_nom, user_prenom, user_email);
        SET user_id = LAST_INSERT_ID();

        INSERT INTO comment (id_user, commentaire) VALUES (user_id, comment_info);

        SET i = i + 1;
    END WHILE;

    SELECT "Données insérées avec succès." AS Resultat;
END //

DELIMITER ; 
```

Utilisation :

Pour insérer des données pour plusieurs utilisateurs et leurs commentaires respectifs, il suffit d'appeler la procédure insertMultipleData en spécifiant les noms, prénoms, emails et commentaires des utilisateurs sous forme de chaînes de caractères formatées.

```sql
CALL insertMultipleData(
    'Dolby, Marius, dolby@gmail.com|Biden, Joe, joe@gmail.com',
    'Commentaire pour Dolby Marius|Commentaire pour Joe Biden'
); 
```

### Procédure pour Supprimer un Utilisateur et ses Commentaires

Cette procédure permet de supprimer un utilisateur et tous ses commentaires associés en fonction de son ID.

```sql
DELIMITER // 

CREATE PROCEDURE supprimerUtilisateur(IN id_user INT)

BEGIN
    START TRANSACTION;

    DELETE FROM comment WHERE id_user = id_user;
    DELETE FROM users WHERE id = id_user;

    COMMIT;
END //

DELIMITER ;
```

Utilisation :

Pour supprimer un utilisateur et ses commentaires associés, il suffit d'appeler la procédure supprimerUtilisateur en spécifiant l'ID de l'utilisateur.

```sql
CALL supprimerUtilisateur(1); 
```
