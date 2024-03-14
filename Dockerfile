# Use an official Python runtime as a parent image
FROM python:3.11.4

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Set the environment variable for DATABASE_URL during build time
ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL

# Expose the port on which your FastAPI app will run
EXPOSE 7000

# Command to run the FastAPI app when the container starts
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7000"]
