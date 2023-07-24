pipeline {
    agent any
    parameters {
        choice(name:'targetEnvironment', choice: ["dev","test", "acc","prod"], description:"Target Environment")
    }
    stages {
        stage("Checkout") {
            steps {
                echo 'Checkout stage'
            }
        }
        stage("Build") {
            steps {
                echo 'Build stage'
            }
        }
        stage("Test") {
             steps {
                 echo 'Test stage'
             }
        }
        stage("Deploy") {
              steps {
                  echo 'Deploy stage'
              }
        }
    }

    post {
        always {
            echo "Always executed"
        }

        success {
            echo "Build is super awesome success"
        }

        failure {
            echo "On no....."
        }
    }

}
