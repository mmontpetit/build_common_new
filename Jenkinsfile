node('IOS-SLAVE04') {
    stage('Preparation') {
		checkout scm
        configFileProvider([configFile(fileId: '81a4b78c-98e2-4b5b-b6de-91ff113685e8', targetLocation: 'gradle.properties')]) {
           // some block
        }
        withCredentials([usernamePassword(credentialsId: 'jenkins-qliktech', passwordVariable: 'ARTIFACTORY_PASSWORD', usernameVariable: 'ARTIFACTORY_USER')]) {
            // some block
            sh 'curl -u${ARTIFACTORY_USER}:${ARTIFACTORY_PASSWORD} "https://qliktech.artifactoryonline.com/qliktech/api/npm/npm-local/auth/qlik" > ./.npmrc'
        } 
    }  
    stage('Web Component') {
    if(params["myparam"]=="buildWeb"){
         println "build web only"
    }
    
    } 
    stage('Client') {

    }
    stage('Publishing') {

    }
}
