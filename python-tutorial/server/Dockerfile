# Use the official Python image as base image
FROM python:3.9-slim

# Set environment variables for Python buffering
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir fastapi uvicorn

# Create and set the working directory in the container
WORKDIR /app

# Copy the application files to the container
COPY ./app /app

# Expose port 8000 to the outside world
EXPOSE 8000

# Command to run the FastAPI application using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]