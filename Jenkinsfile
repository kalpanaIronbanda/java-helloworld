pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                script{
                    sh '''
                    echo "hello"
                    /opt/maven/bin/mvn clean package
                    '''
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh '''
                    echo "success"
                    '''
                }
            }
        }  
    }
}