FROM python:3

# Set working directory
WORKDIR /data

# Install distutils (Debian package manager used inside python:3)
RUN apt-get update && apt-get install -y python3-distutils

# Install Django
RUN pip install django==3.2

# Copy all files
COPY . .

# Run migrations
RUN python manage.py migrate

# Start server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
