pipeline{
  agent any 

  stages {
     stage('CHECKOUT_SCM') {
         steps{
            checkout ([ $class : 'GitSCM',
                            branches: [[name: '*/main']],                     
                            userRemoteConfigs: [[
                                url: 'https://github.com/Suhas180818/Terrafrom-CICD.git'
                            ]]
                     ])
         } 
     }

     stage ('Terraform') {
        steps{
           sh'''
            terraform -version 
           '''
        }      
     }

  }

}