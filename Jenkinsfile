pipeline {
    agent any

    environment {
        // Define any environment variables here if needed
        COMPOSE_PROJECT_NAME = "django_app"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
 stages {
        stage('Checkout') {
            steps { sh '''cp env.sample .env'''
                
            }
        }
        stage('Build') {
            steps {
                script {
                    echo 'Building Docker images...'
                    sh 'docker-compose build'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    // Optionally start a test container to run tests
                    // sh 'docker-compose run --rm web python manage.py test'
                    echo 'Skipping tests for now (implement as needed)'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying application...'
                    // Stop existing containers
                    sh 'docker-compose down'
                    
                    // Start new containers in detached mode
                    sh 'docker-compose up -d'
                    
                    echo 'Application deployed successfully!'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}
