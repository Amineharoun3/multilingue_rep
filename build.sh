#!/usr/bin/env bash
# Exit on error
set -o errexit



# Mettre à jour la liste des paquets et installer les paquets système nécessaires
sip install --upgrade setuptools wheel

# Install Cython first
pip install Cython==0.29.35


# Modify this line as needed for your package manager (pip, poetry, etc.)
#python dependance.py
pip install --upgrade pip
pip install -r requirements.txt
cythonize -i your_project/**/*.pyx

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate