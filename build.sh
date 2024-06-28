#!/usr/bin/env bash
# Exit on error
set -o errexit



# Mettre à jour la liste des paquets et installer les paquets système nécessaires
sudo apt-get update && sudo apt-get install -y \
    apturl catfish command-not-found cupshelpers \
    lightdm-gtk-greeter-settings menulibre \
    build-essential python3-dev cython onboard


# Modify this line as needed for your package manager (pip, poetry, etc.)
#python dependance.py
pip3 install --upgrade pip
pip3 install -r requirements.txt
cythonize -i your_project/**/*.pyx

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate