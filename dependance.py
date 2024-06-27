import subprocess

# Ouvrir le fichier requirements.txt en mode lecture
with open('requirements.txt', 'r') as f:
    # Lire chaque ligne du fichier
    lines = f.read().splitlines()

# Installer chaque dépendance listée dans requirements.txt
for line in lines:
    # Ignorer les lignes vides ou commentées
    if line.strip() == '' or line.strip().startswith('#'):
        continue
    
    # Utiliser pip pour installer la dépendance
    try:
        subprocess.run(['python3', '-m', 'pip', 'install', line.strip()], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Erreur lors de l'installation de {line}: {e}")
        # Gérer l'erreur selon vos besoins, par exemple, continuer ou arrêter le script

print("Installation des dépendances terminée.")
