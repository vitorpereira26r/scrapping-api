# Use the same Python version as your host system
FROM python:3.11.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy your FastAPI project files into the container
COPY . .

# Expose the port that the FastAPI app runs on
EXPOSE 8000

# Mount the directory containing the host's Python libraries into the container
VOLUME /usr/local/lib/python3.11/site-packages

# Run the FastAPI app using the Python interpreter and libraries from the host system
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
