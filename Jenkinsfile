pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                script{
                    sh '''
                    mvn clean package
                    '''
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh '''
                    echo 'build success'
                    '''
                }
            }
        }  
    }
}