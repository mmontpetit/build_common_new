 def userInput = true
 def didTimeout = false


node {
 
    stage('Parameters') {
     try {
    timeout(time: 60, unit: 'SECONDS') { // change to a convenient timeout for you
//        userInput = input(
//        id: 'Proceed1', message: 'Was this successful?', parameters: [
//        [$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this']
//        ])


        paramInput = input(
 		id: 'paramInput', message: 'This project is parameterized', parameters: [
 		    [$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Please confirm you agree with this'],
 			[$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env'],
 			[$class: 'ChoiceParameterDefinition', choices: 'All\nWeb-Only\nClient-Only', description: '', name: 'build_option']
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
    //  
    stage('Web Component') {
    	if(params["myparam"]=="buildWeb" | params["myparam"]=="build"){
         println "build web only"
    	}
    } 
    //
    stage('Client') {

	}
	//
    stage('Publishing') {

    }
    //
    stage('promotion'){ 

	}
	//
}
