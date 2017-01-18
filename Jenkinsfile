 def paramInput = true
 def didTimeout = false


node {
 
    stage('Parameters') {
     	try {
    		timeout(time: 60, unit: 'SECONDS') { // timeout before defaults are used
        	paramInput = input(
 			id: 'paramInput', message: 'This project is parameterized', parameters: [
 		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Web_Test'],
 		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Client_Test'],
// 				  [$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env'],
 				[$class: 'ChoiceParameterDefinition', choices: 'Build All\nWeb Only\nClient Only', description: '', name: 'Target']
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
    	} else if (paramInput == true) {
        	// do something
        	   def webTest = paramInput['Web_Test']
        	   echo ("Web Test: "+webTest)  
        	   echo ("Web Test: "+paramInput['Client_Test'])
               echo ("Target: "+paramInput['Target'])
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
