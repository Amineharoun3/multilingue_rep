#!/usr/bin/env bash
# Exit on error
set -o errexit


# Update package list and install apturl

sudo apt-get update && apt-get install -y \
    catfish \
    command-not-found \
    lightdm-gtk-greeter-settings \
    menulibre \
    build-essential \
    python3-dev \
    libdbus-1-dev \
    libcups2-dev \
    libgirepository1.0-dev \
    libsystemd-dev \
    pkg-config \
    libcairo2-dev \
    libyaml-dev


# Modify this line as needed for your package manager (pip, poetry, etc.)
#python dependance.py
pip install --upgrade pip
pip install "cython<3.0.0"
pip install --no-build-isolation pyyaml==5.4.1
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate