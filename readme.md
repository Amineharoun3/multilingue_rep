# Multilang Site

Ce projet est un site web multilingue développé avec Python et Django.

## Prérequis

Assurez-vous d'avoir les logiciels suivants installés sur votre machine :

- Python 3.10
- pip
- Git

## Installation

1. Clonez le dépôt GitHub :

    ```bash
    git clone https://github.com/Amineharoun3/multilingue_rep.git
    cd multilingue_rep
    ```

2. Exécutez le script `build.sh` pour installer les dépendances et configurer le projet :

    ```bash
    ./build.sh
    ```

3. Configurez l'environnement virtuel et installez les dépendances Python :

    ```bash
    python3 -m venv env
    source env/bin/activate
    pip install --upgrade pip
    pip install "cython<3.0.0"
    pip install --no-build-isolation pyyaml==5.4.1
    pip install -r requirements.txt
    ```

4. Exécutez les migrations de la base de données :

    ```bash
    python manage.py migrate
    ```

5. Collectez les fichiers statiques :

    ```bash
    python manage.py collectstatic --no-input
    ```

## Utilisation

Pour démarrer le serveur de développement, exécutez la commande suivante :

```bash
python manage.py runserver
