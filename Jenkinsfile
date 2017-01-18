node {
    stage('Preparation') {
        input id: 'Cc2a7d4d888ad098e3ca0ed7599d887d', requestTimeout: 10 ,message: 'Which environment?', ok: 'Submit', parameters: [[$class: 'ChoiceParameterDefinition', choices: 'Red\nBlue\nGreen', description: '', name: 'env']]
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
    stage('promotion'){ 
		def userInput = input(
 		id: 'userInput', message: 'Let\'s promote?', parameters: [
 			[$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env']]) 
	echo ("Env: "+userInput)
	}
}
