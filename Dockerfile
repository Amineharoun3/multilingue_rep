# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libsystemd-dev \
    pkg-config \
    build-essential

# Copy the current directory contents into the container at /app
COPY . /app

# Run the build script
RUN ./build.sh

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run the application
CMD ["gunicorn", "Myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
