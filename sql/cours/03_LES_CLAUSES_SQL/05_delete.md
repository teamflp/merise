## Supprimer des enregistrements avec DELETE

### Introduction

La commande `DELETE` en SQL est utilisée pour supprimer des enregistrements spécifiques d'une table. Contrairement à `DROP` qui supprime la table entière ou `TRUNCATE` qui supprime tous les enregistrements d'une table, `DELETE` vous permet de cibler et de supprimer des lignes précises en fonction de critères définis.

### Syntaxe de base

La syntaxe de base pour utiliser `DELETE` est la suivante :

```sql
DELETE FROM nom_table WHERE condition;
```

### Suppimer une ligne
- `nom_table` : le nom de la table à partir de laquelle vous souhaitez supprimer des enregistrements.
- `condition` : une condition qui doit être remplie pour que les enregistrements soient supprimés. Si vous omettez la clause `WHERE`, tous les enregistrements de la table seront supprimés.

## Exemples

Supposons que nous avons une table appelée utilisateurs avec les colonnes `id, nom, age et email`. Pour supprimer un employé spécifique dont l'ID est 3, nous utiliserions :

| id | nom           | age | email              | ville     |
|----|---------------|-----|--------------------|-----------|
| 1  | Alice Dupont  | 25  | alice@exemple.com  | Paris     |
| 2  | Bob Martin    | 30  | bob@exemple.com    | Lyon      |
| 3  | Claire Dubois | 35  | claire@exemple.com | Marseille |


```sql
DELETE FROM utilisateurs WHERE id = 3;
```

Après l'exécution de cette commande, l'enregistrement avec l'ID 3 sera supprimé de la table.

| id | nom           | age | email              | ville     |
|----|---------------|-----|--------------------|-----------|
| 1  | Alice Dupont  | 25  | alice@exemple.com  | Paris     |
| 2  | Bob Martin    | 30  | bob@exemple.com    | Lyon      |


### Supprimer toutes les lignes

Si vous souhaitez supprimer tous les enregistrements de la table, vous pouvez simplement exécuter la commande suivante :

```sql
DELETE FROM utilisateurs;
```

Après l'exécution de cette commande, tous les enregistrements de la table seront supprimés.

| id | nom           | age | email              | ville     |
|----|---------------|-----|--------------------|-----------|

### Attention

Il est important de noter que la commande `DELETE` est irréversible. Une fois que vous avez supprimé des enregistrements, ils ne peuvent pas être récupérés. Assurez-vous donc de bien réfléchir avant de supprimer des données.

## Différence entre DELETE et TRUNCATE

### DELETE :
- **Cible des enregistrements spécifiques** : `DELETE` vous permet de spécifier des conditions pour supprimer uniquement certaines lignes.
- **Génère des logs transactionnels** : Chaque ligne supprimée est enregistrée dans le journal des transactions, ce qui peut être utile pour récupérer les données mais peut ralentir l'opération.
- **Déclenche les triggers** : Si des triggers sont associés à la table, ils seront exécutés lors de l'utilisation de `DELETE`.
- **Peut être annulée** : Si elle est utilisée dans une transaction, une opération `DELETE` peut être annulée (rollback).

### TRUNCATE :
- **Supprime tous les enregistrements** : `TRUNCATE` ne permet pas de cibler des enregistrements spécifiques. Il efface toutes les lignes de la table.
- **Ne génère pas de logs transactionnels complets** : `TRUNCATE` est généralement plus rapide car il ne génère pas de log pour chaque ligne supprimée.
- **Ne déclenche pas les triggers** : Contrairement à `DELETE`, `TRUNCATE` ne déclenche pas les triggers.
- **Réinitialise les compteurs AUTO_INCREMENT** : Après un `TRUNCATE`, les valeurs AUTO_INCREMENT sont réinitialisées.
- **Non annulable** : `TRUNCATE` ne peut pas être annulée via une transaction.
