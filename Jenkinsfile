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
                    aws s3 cp java-${BUILD_NUMBER}.zip s3://${bucketname}/
                    rm -rf *
                    '''
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh '''
                    echo 'deploying.....'
                    aws s3 cp s3://${bucketname}/java-${BUILD_NUMBER}.zip .
                    ssh ec2-user@${hostname} 'sudo rm -rf *'
                    scp java-${BUILD_NUMBER}.zip ec2-user@${hostname}:/home/ec2-user
                    ssh ec2-user@${hostname} 'unzip java-${BUILD_NUMBER}.zip && sudo rm -rf *.zip' 
                    rm -rf *.zip 
                    echo 'deployed successfully!'
                    '''
                }
            }
        }  
    }
}