# Use Ubuntu as the base image
FROM ubuntu:latest

# Install necessary dependencies for the backend
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --upgrade pip && \
    apt-get install -y mysql-client

# Set the working directory in the container
WORKDIR /app/

# Copy and install requirements
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define the command to run the application
CMD ["python3", "app.py"]