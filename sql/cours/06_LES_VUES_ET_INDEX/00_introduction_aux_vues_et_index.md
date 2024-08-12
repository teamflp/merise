### Les Vues en SQL

#### 1. Introduction aux Vues

Une vue en SQL est une table virtuelle qui permet de présenter des données issues d'une ou plusieurs tables physiques. Contrairement à une table classique qui stocke physiquement des données, une vue stocke une requête SQL qui peut être exécutée pour générer les données lorsqu'elles sont demandées.

En d'autres termes, une vue est une requête SQL pré-définie et nommée que l'on peut appeler comme si c'était une table. Cela permet de simplifier les accès aux données, de masquer la complexité des requêtes sous-jacentes, et d'offrir une couche d'abstraction pour une manipulation plus simple et plus sécurisée des données.

#### 2. Pourquoi utiliser des Vues ?

Il y a plusieurs raisons pour lesquelles les vues sont largement utilisées dans les systèmes de bases de données relationnelles :

- **Simplification des requêtes complexes** : Une vue peut encapsuler une requête SQL complexe avec des jointures multiples, des agrégations, ou des calculs. Une fois la vue créée, elle peut être interrogée comme une table simple, rendant l'utilisation des données plus accessible et plus intuitive.

- **Sécurité** : Les vues peuvent être utilisées pour restreindre l'accès à certaines colonnes ou lignes d'une table. Par exemple, une vue peut masquer des informations sensibles comme les salaires ou les données personnelles, tout en rendant accessibles d'autres informations.

- **Réutilisation** : Une vue permet de réutiliser des requêtes complexes sans avoir à les réécrire plusieurs fois. Cela améliore la maintenabilité du code SQL et réduit

- **Performance** : Les vues peuvent améliorer les performances en stockant les résultats des requêtes fréquemment utilisées. Cela permet d'éviter de recalculer les mêmes résultats à chaque fois que la vue est consultée.

- **Abstraction** : Les vues permettent de cacher la structure sous-jacente des tables et de fournir une interface plus intuitive pour les utilisateurs finaux. Cela facilite l'évolution du schéma de la base de données sans impacter les applications qui utilisent les vues.

