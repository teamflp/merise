## Utilisation de SQL en ligne de commande : Apprentissage des commandes de base pour interagir avec une base de données en ligne de commande

### Sur Windows

#### Installation de MySQL

Pour commencer, vous devez installer MySQL sur votre machine Windows. Voici les étapes à suivre :

1. Téléchargez le programme d'installation de MySQL à partir du site officiel : [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/).
2. Exécutez le programme d'installation et suivez les instructions à l'écran pour installer MySQL sur votre machine.
3. Lors de l'installation, vous serez invité à définir un mot de passe pour l'utilisateur `root` de MySQL. Assurez-vous de choisir un mot de passe sécurisé et de le conserver en lieu sûr.
4. Une fois l'installation terminée, ouvrez une fenêtre de terminal (invite de commandes) et tapez la commande suivante pour démarrer le serveur MySQL :

```bash
mysql.server start
```

5. Vous pouvez maintenant vous connecter au serveur MySQL en utilisant la commande suivante :

```bash
mysql -u root -p
```

Expliquons cette commande :

- `mysql` : Commande pour se connecter au serveur MySQL.
- `-u root` : Spécifie l'utilisateur `root` comme utilisateur de connexion.
- `-p` : Indique à MySQL de demander le mot de passe de l'utilisateur.

6. Entrez le mot de passe que vous avez défini lors de l'installation pour l'utilisateur `root`. Vous devriez maintenant être connecté à votre serveur MySQL.
7. Vous pouvez commencer à interagir avec la base de données en utilisant des commandes SQL. Par exemple, pour afficher la liste des bases de données existantes, vous pouvez utiliser la commande suivante :

```sql
SHOW DATABASES;
```