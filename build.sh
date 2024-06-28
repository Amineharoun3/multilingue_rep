#!/usr/bin/env bash
# Exit on error
set -o errexit


#!/bin/bash

# Update pip, setuptools, and wheel
pip install --upgrade pip setuptools wheel

# Install Cython
pip install Cython==3.0.10

# Install dependencies
pip install -r requirements.txt

# Convert static asset files
python manage.py collectstatic --no-input

# Apply any outstanding database migrations
python manage.py migrate