## Utilisation de SQL en ligne de commande : Apprentissage des commandes de base pour interagir avec une base de données en ligne de commande

### Sur Linux

Pour commencer, vous devez installer MySQL sur votre machine Linux. Voici les étapes à suivre :

1. Ouvrez un terminal et tapez la commande suivante pour mettre à jour les paquets de votre système :

```bash
sudo apt update && sudo apt upgrade -y
```

2. Ensuite, installez le serveur MySQL en utilisant la commande suivante :

```bash
sudo apt install mysql-server
```

3. Pendant l'installation, vous serez invité à définir un mot de passe pour l'utilisateur `root` de MySQL. Assurez-vous de choisir un mot de passe sécurisé et de le conserver en lieu sûr.
4. Une fois l'installation terminée, démarrez le serveur MySQL en utilisant la commande suivante :

```bash
sudo systemctl start mysql
```

5. Vous pouvez vérifier l'état du serveur MySQL en utilisant la commande suivante :

```bash
sudo systemctl status mysql
```

6. Pour vous connecter au serveur MySQL, utilisez la commande suivante :

```bash
mysql -u root -p
```

Expliquons cette commande :

- `mysql` : Commande pour se connecter au serveur MySQL.
- `-u root` : Spécifie l'utilisateur `root` comme utilisateur de connexion.
- `-p` : Indique à MySQL de demander le mot de passe de l'utilisateur.

7. Entrez le mot de passe que vous avez défini lors de l'installation pour l'utilisateur `root`. Vous devriez maintenant être connecté à votre serveur MySQL.

Maintenant que vous êtes connecté à MySQL, vous pouvez commencer à interagir avec la base de données en utilisant des commandes SQL. Voici quelques commandes de base pour vous aider à démarrer :

1. **Afficher les bases de données existantes :**

```sql
SHOW DATABASES;
```