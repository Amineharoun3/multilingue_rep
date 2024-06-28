#!/bin/bash

# Exit on error
set -o errexit

# Upgrade pip, setuptools, and wheel
pip install --upgrade pip setuptools==59.6.0 wheel==0.37.0 PyYAML==5.4.1

# Install Cython first
pip install Cython==3.0.10

# Install Python dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate
