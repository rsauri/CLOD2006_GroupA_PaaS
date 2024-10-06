# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set the working directory in the container
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/

# Install Flask from the requirements.txt file (which we’ll create below)
RUN pip install --no-cache-dir -r requirements.txt
ADD . /app/

# Install any needed packages specified in requirements.txt
RUN pip install flask


# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV FLASK_APP=app.py

# Run the application
CMD ["python", "/app/app.py", "runserver", "0.0.0.0:8080"]

