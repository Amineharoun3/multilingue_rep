# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libsystemd-dev \
    pkg-config \
    build-essential

# Upgrade pip and install build tools
RUN pip install --upgrade pip setuptools==59.6.0 wheel==0.37.0

# Install Cython
RUN pip install Cython==3.0.10

# Copy the current directory contents into the container at /app
COPY . /app

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