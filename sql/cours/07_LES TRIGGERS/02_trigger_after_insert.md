## Trigger `AFTER INSERT` en SQL

Un trigger `AFTER INSERT` en SQL est un type de trigger qui s'exécute automatiquement après l'insertion d'une nouvelle ligne dans une table. Il est utile pour effectuer des actions supplémentaires après l'insertion de données, comme la mise à jour d'autres tables, l'envoi de notifications, ou la génération de données dérivées.

### **Syntaxe de base d'un Trigger** `AFTER INSERT`

La création d'un trigger `AFTER INSERT` suit une syntaxe SQL spécifique :

```sql
CREATE TRIGGER nom_du_trigger
AFTER INSERT
ON nom_table
FOR EACH ROW
BEGIN
    -- Instructions SQL
END;
```

- `nom_du_trigger` : Le nom que vous donnez au trigger.
- `AFTER INSERT` : Indique que le trigger se déclenche après l'insertion d'une nouvelle ligne.
- `nom_de_la_table` : Le nom de la table sur laquelle le trigger est défini.
- `FOR EACH ROW` : Indique que le trigger s'exécute pour chaque ligne affectée par l'insertion.

Ensuite, vous pouvez ajouter des instructions SQL à l'intérieur du bloc `BEGIN ... END` pour définir le comportement du trigger.

### **Exemple de trigger `AFTER INSERT`**

Voici un exemple de trigger `AFTER INSERT` qui met à jour une table de statistiques après l'insertion d'une nouvelle ligne dans une table de commandes :

```sql
CREATE TRIGGER maj_statistiques
AFTER INSERT ON commandes
FOR EACH ROW
BEGIN
    UPDATE statistiques
    SET total_commandes = total_commandes + 1
    WHERE annee = YEAR(NEW.date_commande);
END;
```

Dans cet exemple, le trigger `maj_statistiques` est déclenché après l'insertion d'une nouvelle ligne dans la table `commandes`. Il met à jour la table `statistiques` en incrémentant le nombre total de commandes pour l'année de la nouvelle commande.

Les triggers `AFTER INSERT` sont utiles pour automatiser des tâches supplémentaires après l'insertion de données, ce qui peut simplifier les opérations de maintenance et de synchronisation des données dans une base de données SQL.
