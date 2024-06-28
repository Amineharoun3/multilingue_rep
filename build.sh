#!/usr/bin/env bash
# Exit on error
set -o errexit


sudo apt-get update
sudo apt-get install build-essential

# Update pip, setuptools, and wheel
pip install --upgrade pip setuptools==59.6.0 wheel==0.37.0
pip install Cython==3.0.10
pip install PyYAML==5.4.1
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate