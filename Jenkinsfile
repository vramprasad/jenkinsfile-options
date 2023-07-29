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
        stage("Tools initializing") {
            steps {
                sh "echo $PATH"
                sh "echo $SONAR_KEY"
                sh "gradle -v"
                sh "java -version"
                sh "mvn -v"
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
