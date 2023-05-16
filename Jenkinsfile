pipeline{
    agent any
    parameters{
        string(name: 'bucketname', defaultValue: 'bucket name', description: 'bucket name')
        string(name: 'hostname', defaultValue: 'host name', description: 'host name')
    }    
    stages{
        stage('Build'){
            steps{
                script{
                    sh '''
                    /opt/maven/bin/mvn clean package
                    '''
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh """
                    echo 'deploying.....'
                    echo 'deployed successfully!'
                    """
                }
            }
        }  
    }
}