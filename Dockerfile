# Use the same Python version as your host system
FROM python:3.11.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy FastAPI and uvicorn from the host system
COPY --from=/nix/store/1117za49n8shipljh2ldpl6sxpd7gdxi-python3.11-uvicorn-0.23.2 /usr/local/lib/python3.11/site-packages/uvicorn /usr/local/lib/python3.11/site-packages/uvicorn
COPY --from=/nix/store/r17mx6754l4g2whw0q2ckp6chq2x2n3w-python3.11-fastapi-0.103.1 /usr/local/lib/python3.11/site-packages/fastapi /usr/local/lib/python3.11/site-packages/fastapi

# Copy your FastAPI project files into the container
COPY . .

# Expose the port that the FastAPI app runs on
EXPOSE 8000

# Run the FastAPI app using the Python interpreter and libraries from the host system
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
