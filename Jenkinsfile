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
        stage("Create and Update build number") {
            steps {
                sh './scripts/update_version.sh'
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
        stage("SonarQube Analysis") {
             steps {
                 sh "mvn sonar:sonar \
                        -Dsonar.projectKey=docapp01 \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=f9c54e719f23870eca50e027693bddc871ee41b8"
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
