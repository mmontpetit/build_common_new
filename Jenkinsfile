node {
    stage('Preparation') {
        input id: 'Cc2a7d4d888ad098e3ca0ed7599d887d', message: 'Which environment?', ok: 'Submit', parameters: [[$class: 'ChoiceParameterDefinition', choices: 'Red\nBlue\nGreen', description: '', name: 'env']]
    }  
    stage('Web Component') {
    if(params["myparam"]=="buildWeb" | params["myparam"]=="build"){
         println "build web only"
    }
    
    } 
    stage('Client') {

    }
    stage('Publishing') {

    }
}
