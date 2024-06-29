# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y apturl catfish command-not-found \
 cupshelpers lightdm-gtk-greeter-settings menulibre build-essential \
python3-dev libdbus-1-dev libcups2-dev libgirepository1.0-dev \
 build-essential libsystemd-dev pkg-config libcairo2-dev libyaml-dev
 

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip

# Install Cython first
RUN pip install "cython<3.0.0"
RUN pip install --no-build-isolation pyyaml==5.4.1

# Install Python dependencies
RUN pip install -r requirements.txt

# Collect static files
RUN python manage.py collectstatic --no-input

# Apply database migrations
RUN python manage.py migrate

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application
CMD ["gunicorn", "multilang_site.wsgi:application", "--bind", "0.0.0.0:8000"]
