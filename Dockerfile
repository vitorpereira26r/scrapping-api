# Use the same Python version as your host system
FROM python:3.11.8-slim

# Install 'xz-utils' package to enable unpacking of binary tarball for Nix installation
RUN apt-get update && apt-get install -y curl xz-utils && \
    curl -L https://nixos.org/nix/install | sh

# Set the working directory in the container
WORKDIR /app

# Copy your FastAPI project files into the container
COPY . .

# Install FastAPI and uvicorn using Nix
RUN nix-env -iA nixos.python38Packages.fastapi nixos.python38Packages.uvicorn

# Expose the port that the FastAPI app runs on
EXPOSE 8000

# Run the FastAPI app using the Python interpreter and libraries from the host system
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
