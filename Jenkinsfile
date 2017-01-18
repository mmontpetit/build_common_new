def userInput = true
def didTimeout = false
def webTest = true
def clientTest = true
def buildTarget = 'build'


def errorHandling(message, error){
    echo "### CAUGHT error: "
    currentBuild.result = 'FAILURE'
}

node {
 
    stage('Parameters') {
     	try {
    		timeout(time: 60, unit: 'SECONDS') { // timeout before defaults are used
        	paramInput = input(
 			id: 'paramInput', message: 'This project is parameterized', parameters: [
 		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Web_Test'],
 		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Client_Test'],
// 				  [$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env'],
 				[$class: 'ChoiceParameterDefinition', choices: 'build\nbuildWeb\nbuildClient', description: '', name: 'Target']
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
        	echo "Build Target: "+buildTarget+"  |Web Test: "+webTest+"  |Client Test: "+clientTest
    	} else if (userInput == true) {
        	// do something
 			webTest = paramInput['Web_Test']
        	clientTest = paramInput['Client_Test']
        	buildTarget = paramInput['Target']
       		echo "Build Target: "+buildTarget+"  |Web Test: "+webTest+"  |Client Test: "+clientTest
    	} else {
        	// do something else
        	echo "Parameters setup was not successful"
        	currentBuild.result = 'FAILURE'
    	} 
    }
    //  
    stage('Web Component') {
    	if(buildTarget=="buildWeb" | buildTarget=="build"){
         println "Building Web"
    	}
    } 
    //
    stage('Client') {
    	if(buildTarget=="buildClient" | buildTarget=="build"){
         println "building Client"
    	}
	}
	//
    stage('Publishing') {

    }
    //
    stage('promotion'){ 

	}
	//
}
