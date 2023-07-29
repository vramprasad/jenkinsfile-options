pipeline {
    agent any
    parameters {
        choice(name:'targetEnvironment', choices: ['dev','test','acc','prod'], description:"Target Environment")
        booleanParam(name:'deployNow', defaultValue:true, description:"Deploy Now")
        validatingString(
            name: 'param1', 
            defaultValue: '', 
            regex: /^[0-9]+$/, 
            failedValidationMessage: '', 
            description: 'Numbers only parameter example'
        )
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
                sh
            }
        }
        stage("Test") {
             steps {
                 echo 'Test stage'
             }
        }
        stage("Deploy") {
            when {
                expression {
                    params.deployNow == true
                }
            }    
              steps {
                  echo 'Deploy stage'
              }
        }
    }

    post {
        always {
            echo "This part is Always executed"
        }

        success {
            echo "Build is super awesome success"
        }

        failure {
            echo "On no....."
        }
    }

}
