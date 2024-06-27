#!/usr/bin/env bash
# Exit on error
set -o errexit


# Update package list and install apturl

sudo apt-get update && sudo apt-get install -y apturl catfish command-not-found cupshelpers defer


# Modify this line as needed for your package manager (pip, poetry, etc.)
#python dependance.py
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate