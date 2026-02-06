pipeline {
    agent any

    environment {
        COMPOSE_PROJECT_NAME = "django_app"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Prepare Environment') {
            steps {
                script {
                    echo 'Preparing .env file from .env.sample...'
                    sh '''
                    if [ ! -f .env ]; then
                        cp .env.sample .env
                        echo ".env file created from sample"
                    else
                        echo ".env already exists"
                    fi
                    '''
                }
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
                    // Enable later if needed
                    // sh 'docker-compose run --rm web python manage.py test'
                    echo 'Skipping tests for now (implement later)'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying application...'

                    sh '''
                    docker-compose down || true
                    docker-compose up -d
                    '''

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
