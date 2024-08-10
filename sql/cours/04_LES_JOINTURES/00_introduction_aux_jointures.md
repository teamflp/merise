# Introduction aux jointures SQL

Les **jointures SQL** sont une des fonctionnalités les plus puissantes et importantes du langage SQL. Elles permettent de combiner des données provenant de plusieurs tables d'une base de données relationnelle en fonction d'une condition spécifiée.

## Pourquoi les jointures sont-elles importantes ?

Dans une base de données relationnelle, les données sont souvent réparties sur plusieurs tables pour minimiser la redondance et améliorer l'efficacité. Cependant, il est souvent nécessaire d'obtenir des informations provenant de différentes tables en une seule requête. C'est là que les jointures entrent en jeu. Elles permettent de :
- **Relier des tables** : Les jointures associent des enregistrements provenant de différentes tables en utilisant des colonnes communes.
- **Optimiser les requêtes** : Elles permettent d'écrire des requêtes plus complexes et efficaces, qui exploitent la puissance des relations entre tables.
- **Simplifier l'accès aux données** : Les jointures rendent l'accès à des ensembles de données répartis sur plusieurs tables plus simple et plus intuitif.

Il existe plusieurs types de jointures, chacune ayant ses propres caractéristiques et utilisations spécifiques. Dans ce cours, nous explorerons les principales : `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, et `FULL JOIN`.

## Types de jointures

- **INNER JOIN** : Retourne les enregistrements qui ont des correspondances dans les deux tables.
- **LEFT JOIN** : Retourne tous les enregistrements de la table de gauche, et les enregistrements correspondants de la table de droite, s'ils existent.
- **RIGHT JOIN** : Semblable à `LEFT JOIN`, mais retourne tous les enregistrements de la table de droite.
- **FULL JOIN** : Retourne tous les enregistrements lorsqu'il y a une correspondance dans l'une ou l'autre des tables.

Dans les sections suivantes, nous explorerons chacune de ces jointures en détail, avec des exemples pratiques pour illustrer leur utilisation.
