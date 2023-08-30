pipeline{
    // agent {
    //     lable "maven-slave"
    // }
    agent any
    parameters{
        string(name: 'bucketname', defaultValue: 'bucket name', description: 'bucket name')
        string(name: 'hostname', defaultValue: 'host name', description: 'host name')
    }    
    stages{
        stage('compile'){
            steps{
                script{
                    sh """
                    echo 'Compiling Source Code Using Maven....'
                    /opt/maven/bin/mvn clean compile
                    echo 'compiled successfully'
                    """
                }
            }
        }
        stage('test'){
            steps{
                script{
                    sh """
                    echo 'Executing JUnit Test Cases Using Maven....'
                    /opt/maven/bin/mvn test
                    echo 'tested successfully'
                    """
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    sh '''
                    echo "Packaging the Application as WAR...."
                    /opt/maven/bin/mvn package
                    echo "package successfull"
                    aws s3 cp target/java-hello-world.war s3://${bucketname}/java-hello-world.war
                    rm -rf target/java-hello-world.war
                    '''
                }
            }
        }
        stage('Copy'){
            steps{
                script{
                    sh '''
                    echo "storing the war file in artifactory....."
                    aws s3 cp target/java-hello-world.war s3://${bucketname}/java-hello-world.war
                    echo "stored successfully"
                    echo "cleaning the target folder.."
                    rm -rf target/java-hello-world.war
                    echo "folder is clear"
                    echo "coping the war file from artifactory to the instance...."
                    aws s3 cp s3://${bucketname}/java-hello-world.war .
                    scp java-hello-world.war ec2-user@${hostname}:/home/ec2-user/
                    echo "copied to instance successfully!"
                    '''
                }
            }
        }
        stage('Installing Tomcat'){
            steps{
                script{
                    sh '''
                    echo "Installing tomcat...."
                    scp tomcat.sh ec2-user@${hostname}:/home/ec2-user/opt
                    ssh ec2-user@${hostname} "cd /opt && sudo sh tomcat.sh"
                    echo 'Installed successfully'
                    '''
                }
            }
        }
        stage('Deploy'){
            steps{
                script{
                    sh '''
                    echo 'deploying the war application to the target server.....'
                    ssh ec2-user@${hostname} "sudo cp -r java-hello-world.war /opt/tomcat/webapps && sudo sh /opt/tomcat/bin/startup.sh" 
                    echo "deployed successfully"
                    '''
                }
            }
        }  
    }
}
