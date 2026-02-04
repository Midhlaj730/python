# Deployment Guide

This project has been configured with DevOps methodology using Docker, Nginx, and Jenkins.

## Prerequisites
- **Docker**: Ensure Docker and Docker Compose are installed.
- **Jenkins**: (Optional) For CI/CD automation.

## Local Development & Deployment

To start the application locally with scaling and load balancing:

1.  **Build and Start Services:**
    ```bash
    docker-compose up -d --build
    ```

2.  **Access the Application:**
    - The application is accessible at `http://localhost`.
    - Nginx is listening on port 80 and load balancing across 3 replicas of the Django app.

3.  **Stop the Application:**
    ```bash
    docker-compose down
    ```

## CI/CD with Jenkins

A `Jenkinsfile` is provided for automated deployment.

1.  **Setup Jenkins:**
    - Create a new Pipeline job in Jenkins.
    - Connect it to your Git repository.
    - Ensure the Jenkins agent has Docker installed and permission to access the Docker socket.

2.  **Webhook Trigger:**
    - Configure a Webhook in your Git repository provider (GitHub/GitLab) to trigger the Jenkins job on push.

3.  **Pipeline Flow:**
    - **Checkout**: Pulls the latest code.
    - **Build**: Builds the Docker images.
    - **Deploy**: Runs `docker-compose down` and `docker-compose up -d` to updates the running containers.

## Project Structure
- `Dockerfile`: Defines the Django application image.
- `docker-compose.yml`: Orchestrates `web` (Django) and `nginx` services.
- `nginx/`: Contains Nginx configuration and Dockerfile.
- `Jenkinsfile`: CI/CD pipeline definition.
