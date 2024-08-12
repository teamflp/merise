## Les Triggers en SQL

Les triggers (déclencheurs) sont des objets de base de données qui s'exécutent automatiquement en réponse à certains événements sur une table ou une vue. Ils sont utiles pour appliquer des règles d'intégrité, des audits, des notifications ou encore pour maintenir des données dérivées.

### **Introduction aux Triggers**

Un trigger est un ensemble d'instructions SQL qui s'exécute automatiquement lorsqu'un événement spécifique se produit sur une table. Les événements typiques incluent les opérations `INSERT`, `UPDATE`, ou `DELETE`.

Les triggers sont associés à une table spécifique et se déclenchent avant ou après les opérations définies. Ils sont souvent utilisés pour :

- Enforcer des règles d'intégrité des données.
- Automatiser les processus répétitifs.
- Maintenir des données synchronisées entre plusieurs tables.
- Auditer les changements sur une table.

### **Syntaxe des Triggers**

La syntaxe générale pour créer un trigger en SQL est la suivante :

```sql
CREATE TRIGGER nom_du_trigger
{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
ON nom_table
FOR EACH ROW
BEGIN
    -- Instructions SQL
END;
```

- `nom_du_trigger` : Le nom que vous donnez au trigger.
- `BEFORE | AFTER` : Indique si le trigger doit se déclencher avant ou après l'événement.
- `INSERT | UPDATE | DELETE` : Spécifie l'événement qui déclenche le trigger.
- `nom_de_la_table` : Le nom de la table sur laquelle le trigger est défini.
- `FOR EACH ROW` : Indique que le trigger s'exécute pour chaque ligne affectée par l'événement.

### **Types de Triggers**

Il existe deux types principaux de triggers en fonction du moment où ils sont déclenchés :

- **Triggers BEFORE** : Ceux-ci s'exécutent avant l'exécution de l'événement déclencheur (INSERT, UPDATE, DELETE). Ils sont souvent utilisés pour valider ou modifier les données avant qu'elles ne soient insérées ou mises à jour.

- **Triggers AFTER** : Ceux-ci s'exécutent après que l'événement déclencheur a eu lieu. Ils sont couramment utilisés pour effectuer des opérations sur d'autres tables, auditer les modifications ou mettre à jour des vues.