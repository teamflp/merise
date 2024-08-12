## Triggers `BEFORE INSERT` en SQL

### **Introduction aux Triggers** `BEFORE INSERT`

Un trigger `BEFORE INSERT` est un type de déclencheur en SQL qui s'exécute automatiquement avant qu'une nouvelle ligne ne soit insérée dans une table. Ce type de trigger est couramment utilisé pour :

- **Valider les données** avant qu'elles ne soient insérées dans la table.
- **Modifier ou compléter les valeurs des colonnes** avant l'insertion.
- **Empêcher l'insertion** si certaines conditions ne sont pas remplies.

Les triggers `BEFORE INSERT` permettent d'assurer que les données insérées respectent les règles d'intégrité et les contraintes métier de l'application.

### **Syntaxe de base d'un Trigger** `BEFORE INSERT`

La création d'un trigger `BEFORE INSERT` suit une syntaxe SQL spécifique :

```sql
CREATE TRIGGER nom_du_trigger
BEFORE INSERT
ON nom_table
FOR EACH ROW
BEGIN
    -- Instructions SQL
END;
```

- `nom_du_trigger` : Le nom que vous donnez au trigger.
- `BEFORE INSERT` : Indique que le trigger se déclenche avant l'insertion d'une nouvelle ligne.
- `nom_de_la_table` : Le nom de la table sur laquelle le trigger est défini.
- `FOR EACH ROW` : Indique que le trigger s'exécute pour chaque ligne affectée par l'insertion.

Ensuite, vous pouvez ajouter des instructions SQL à l'intérieur du bloc `BEGIN ... END` pour définir le comportement du trigger.

Exemple de trigger `BEFORE INSERT` :

```sql
CREATE TRIGGER avant_insertion_employe
    BEFORE INSERT ON employes
    FOR EACH ROW
BEGIN
    IF NEW.prenom IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le prénom est obligatoire.';
    ELSEIF NEW.nom IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le nom est obligatoire.';
    ELSEIF NEW.salaire < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le salaire ne peut pas être négatif.';
    ELSEIF
END IF;
END;
```

### **Utilisation des Pseudorecords :** `NEW` et `OLD`

Dans un trigger `BEFORE INSERT`, vous avez accès à un pseudorecord spécial nommé `NEW`. Ce pseudorecord représente la nouvelle ligne de données qui sera insérée dans la table. Vous pouvez lire et modifier les valeurs des colonnes via `NEW`.

Voici un exemple simple de trigger `BEFORE INSERT` qui met à jour la date de création d'une ligne avant son insertion :

```sql
CREATE TRIGGER maj_date_creation
BEFORE INSERT
ON employes
FOR EACH ROW
BEGIN
    :NEW.date_creation := SYSDATE;
END;
```

Dans cet exemple, le trigger `maj_date_creation` met à jour la colonne `date_creation` de la table `employes` avec la date actuelle (`SYSDATE`) avant l'insertion d'une nouvelle ligne.

### **Exemple Complet :** Trigger `BEFORE INSERT`

Voici un exemple complet de trigger `BEFORE INSERT` qui valide les données avant l'insertion :

```sql
CREATE TRIGGER verif_salaire
    BEFORE INSERT ON employes
    FOR EACH ROW
BEGIN
    IF NEW.salaire < 0 THEN
        -- SET NEW.salaire = 0;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Le salaire ne peut pas être négatif.';
END IF;
END;
```

Dans cet exemple, le trigger `verif_salaire` vérifie que le salaire de l'employé à insérer n'est pas négatif. S'il l'est, une erreur est levée (`RAISE_APPLICATION_ERROR`) et l'insertion est annulée.

Utilisation des pseudorecords `NEW` et `OLD` en SQL