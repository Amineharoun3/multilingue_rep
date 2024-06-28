#!/bin/bash

# Upgrade pip and install build tools
pip install --upgrade pip setuptools==59.6.0 wheel==0.37.0

# Install Cython
pip install Cython==3.0.10

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate
