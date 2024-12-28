# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Create and set working directory
WORKDIR /app

# Copy requirements.txt first (for better Docker layer caching)
COPY requirements.txt /app/requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . /app

# Expose port 80
EXPOSE 80

# Run the app with uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]