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
                    rm -fr *.zip
                    zip -r java-${BUILD_NUMBER}.zip *
                    aws s3 java-${BUILD_NUMBER}.zip s3://${bucketname}/
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