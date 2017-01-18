def userInput = true
def didTimeout = false
try {
    timeout(time: 15, unit: 'SECONDS') { // change to a convenient timeout for you
        userInput = input(
        id: 'Proceed1', message: 'Was this successful?', parameters: [
        [$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this']
        ])
    }
} catch(err) { // timeout reached or input false
    def user = err.getCauses()[0].getUser()
    if('SYSTEM' == user.toString()) { // SYSTEM means timeout.
        didTimeout = true
    } else {
        userInput = false
        echo "Aborted by: [${user}]"
    }
}

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

    if (didTimeout) {
        // do something on timeout
        echo "no input was received before timeout"
    } else if (userInput == true) {
        // do something
        echo "this was successful"
    } else {
        // do something else
        echo "this was not successful"
        currentBuild.result = 'FAILURE'
    } 
}
    }
    stage('Publishing') {

    }
    stage('promotion'){ 
	//	def userInput = input(
    //		id: 'userInput', message: 'Let\'s promote?', parameters: [
 	//		[$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env']]) 
	// echo ("Env: "+userInput)
	}
}
