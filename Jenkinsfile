pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                script{
                    sh '''
                    echo "hello"
                    mvn clean package
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