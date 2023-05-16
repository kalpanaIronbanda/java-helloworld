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
                    aws s3 cp target/java-hello-world.war s3://${bucketname}/java-hello-world.war
                    rm -rf target/java-hello-world.war
                    '''
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh """
                    echo 'deploying.....'
                    scp java-hello-world.war ec2-user@$'{hostname}':/home/ec2-user
                    echo 'deployed successfully!'
                    """
                }
            }
        }  
    }
}