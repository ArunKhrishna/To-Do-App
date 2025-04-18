pipeline {
  agent any

  environment {
    KUBECONFIG = 'C:\\minikube-data\\.kube\\config'
    MINIKUBE_HOME = 'C:\\minikube-data\\.minikube'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'main',
            url: 'https://github.com/ArunKhrishna/To-Do-App.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        bat 'docker build -t todoapp:v1 .'
      }
    }

    stage('Start Minikube') {
      steps {
        bat 'minikube start --driver=docker --embed-certs'
      }
    }

    stage('Load Image into Minikube') {
      steps {
        bat 'minikube image load todoapp:v1'
      }
    }

    stage('Deploy to Minikube') {
      steps {
        bat 'kubectl apply -f k8s\\deployment.yaml'
        bat 'kubectl apply -f k8s\\service.yaml'
      }
    }

    stage('Verify Deployment') {
      steps {
        bat 'kubectl rollout status deployment todoapp-deployment'
        bat 'kubectl get svc todoapp-service'
      }
    }
  }

  post {
    success {
      echo '✅ Deployment successful!'
    }
    failure {
      echo '❌ Deployment failed.'
    }
  }
}
