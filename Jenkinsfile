pipeline {
    agent any
    parameters {
        choice(name:'targetEnvironment', choices: ['dev','test','acc','prod'], description:"Target Environment")
        booleanParam(name:'deployNow', defaultValue:true, description:"Deploy Now")
        validatingString(
            name: 'Test parameter', 
            defaultValue: '0', 
            regex: /^[0-9]+$/, 
            failedValidationMessage: 'Input only numbers', 
            description: 'Numbers only parameter example'
        )
    }
    stages {
        stage("Tools initializing") {
            steps {
                sh "echo $PATH"
                sh "echo $SONAR_KEY"
                sh "java -version"
                sh "mvn -v"
            }
        }
        stage("Build") {
            steps {
                sh "mvn clean install -Dmaven.test.skip=true"
            }
        }
        stage("Unit Testing") {
             steps {
                 sh "mvn test"
             }
        }
        stage("Code Coverage") {
              steps {
                  sh "mvn jacoco:report"
                  jacoco(
                        execPattern: '**/build/jacoco/*.exec',
                        classPattern: '**/build/classes/java/main',
                        sourcePattern: '**/src/main'
                    )
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
