## Utilisation de SQL en ligne de commande : Apprentissage des commandes de base pour interagir avec une base de données en ligne de commande

#### Installation de MySQL sur Mac

Pour installer MySQL sur Mac, vous pouvez utiliser Homebrew, un gestionnaire de paquets pour macOS. Voici les étapes à suivre :

1. Ouvrez le terminal.
2. Installez Homebrew en exécutant la commande suivante :

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Installez MySQL en exécutant la commande suivante :

```bash
brew install mysql
```

4. Démarrez le service MySQL en exécutant la commande suivante :

```bash
brew services start mysql
```

5. Connectez-vous à MySQL en exécutant la commande suivante :

```bash
mysql -u root
```

Vous devriez maintenant être connecté à MySQL et prêt à interagir avec la base de données en ligne de commande.

#### Commandes de base pour interagir avec MySQL

Voici quelques commandes de base pour interagir avec MySQL en ligne de commande :

1. **Afficher les bases de données existantes :**

```sql
SHOW DATABASES;
```
