 def userInput = true
 def didTimeout = false


node {
 
    stage('Parameters') {
     	try {
    		timeout(time: 60, unit: 'SECONDS') { // timeout before defaults are used
        	paramInput = input(
 			id: 'paramInput', message: 'This project is parameterized', parameters: [
 		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Run Web Unit Test'],
 		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Run Client Unit Test'],
// 				  [$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env'],
 				[$class: 'ChoiceParameterDefinition', choices: 'Build All\nWeb Only\nClient Only', description: '', name: 'build_option']
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
        	echo "no input was received before timeout default are used"
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
