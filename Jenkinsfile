def userInput = true
def didTimeout = false
def webTest = true
def clientTest = true
def buildTarget = 'build'




node {
 
    stage('Parameters') {
     	try {
    		timeout(time: 30, unit: 'SECONDS') { // timeout before defaults are used
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
        		println "Aborted by: [${user}]"
    		}
 		}

	    if (didTimeout) {
    	    // do something on timeout
        	println "Build Target: "+buildTarget+"  |Web Test: "+webTest+"  |Client Test: "+clientTest
    	} else if (userInput == true) {
        	// do something
 			webTest = paramInput['Web_Test']
        	clientTest = paramInput['Client_Test']
        	buildTarget = paramInput['Target']
        	println env.BRANCH_NAME
       		println "Build Target: "+buildTarget+"  |Web Test: "+webTest+"  |Client Test: "+clientTest
    	} else {
        	// do something else
        	println "Parameters setup was not successful"
        	currentBuild.result = 'FAILURE'
    	} 
    }
    //  
    stage('Web Component') {
    	if(buildTarget=="buildWeb" | buildTarget=="build"){
         println "Building Web"
         try {
				sh './gradlew buildWeb'
				
			} catch (Exception err) {
				echo "### CAUGHT error: " + err.getMessage()
				currentBuild.result = 'FAILURE'
				exit 1
			}
    	}
    } 
    //
    stage('Client') {
    	if(buildTarget=="buildClient" | buildTarget=="build"){
         println "building Client"
         try {
				sh './gradlew build'
				
			} catch (Exception err) {
				echo "### CAUGHT error: " + err.getMessage()
				currentBuild.result = 'FAILURE'
				exit 1
			}
         
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
