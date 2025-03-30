# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt and install dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /app/

# Expose the port for Django (8000 by default)
EXPOSE 8000

# Run Django's development server on all network interfaces
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

