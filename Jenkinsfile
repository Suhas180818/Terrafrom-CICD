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

     stage ('AWS_credential') {
        steps{
           withCredentials([
                    usernamePassword(
                        credentialsId: 'AWS_access_key',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
            ])
            sh'''
              echo $(AWS_ACCESS_KEY_ID)
              echo $(AWS_SECRET_ACCESS_KEY)

            '''
        }      
     }

  }

}