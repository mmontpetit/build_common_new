def userInput = true
def didTimeout = false
def webTest = true
def clientTest = true
def buildTarget = 'build'

	void setBuildStatus(String message, String state) {
  	step([
      	$class: "GitHubCommitStatusSetter",
      	reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/mmontpetit/build_common"],
      	contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "jenkins"],
      	errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      	statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  	]);
	}

properties(
[
    [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '10', artifactNumToKeepStr: '50', daysToKeepStr: '31', numToKeepStr: '500']],
    [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false],
    [$class: 'ParametersDefinitionProperty', parameterDefinitions:
        [
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Run Web Tests', name: 'Web_Test'],
 		    [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Run Client Tests', name: 'Client_Test'],
 		    [$class: 'hudson.model.ChoiceParameterDefinition', choices: 'build\nbuildWeb\nbuildClient', description: '', name: 'Target']
        
        ]
    ],
    [$class: 'ThrottleJobProperty', categories: [], limitOneJobWithMatchingParams: false, maxConcurrentPerNode: 0, maxConcurrentTotal: 0, paramsToUseForLimit: '', throttleEnabled: false, throttleOption: 'project']
]
)


node {
 
    stage('Parameters') {



		setBuildStatus("Building", "PENDING");


    // 	try {
    //		timeout(time: 30, unit: 'SECONDS') { // timeout before defaults are used
    //    	paramInput = input(
 	//		id: 'paramInput', message: 'This project is parameterized', parameters: [
    //		    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Web Test'],
 	//	    	[$class: 'BooleanParameterDefinition', defaultValue: true, description: '', name: 'Client Test'],
// 				  [$class: 'TextParameterDefinition', defaultValue: 'uat', description: 'Environment', name: 'env'],
 	//			[$class: 'ChoiceParameterDefinition', choices: 'build\nbuildWeb\nbuildClient', description: '', name: 'Target']
	//		]) 
    //	}
 	//	} catch(err) { // timeout reached or input false
    //		def user = err.getCauses()[0].getUser()
   // 		if('SYSTEM' == user.toString()) { // SYSTEM means timeout.
    //   			didTimeout = true
    //		} else {
    //    		userInput = false
    //    		println "Aborted by: [${user}]"
    //		}
 	//	}

	//    if (didTimeout) {
    //	    // do something on timeout
    //	    println " Git Branch Name: " + env.BRANCH_NAME
    //    	println "Default Parameters for this Build are --> Target: " + buildTarget + "  |Web Test: " + webTest + "  |Client Test: " + clientTest
   // 	} else if (userInput == true) {
    //    	// do something
 	//		webTest = paramInput['Web Test']
    //    	clientTest = paramInput['Client Test']
    //    	buildTarget = paramInput['Target']
    //   		println "Override Parameters for this Build are --> Target: " + buildTarget + "  |Web Test: " + webTest + "  |Client Test: " + clientTest
   // 	} else {
    //    	// do something else
    //    	println "Parameters setup was not successful"
     //   	currentBuild.result = 'FAILURE'
    	//} 
    }
    //  
    stage('Web Component') {
    	if(buildTarget=="buildWeb" | buildTarget=="build"){
         println "Building Web"
         try {
			//	sh './gradlew buildWeb'
				
			} catch (Exception err) {
				echo "### CAUGHT error: " + err.getMessage()
				currentBuild.result = 'FAILURE'

			}
    	}
    } 
    //
    stage('Client') {
    	if(buildTarget=="buildClient" | buildTarget=="build"){
         println "building Client"
         try {
			//	sh './gradlew build'
				
			} catch (Exception err) {
				echo "### CAUGHT error: " + err.getMessage()
				currentBuild.result = 'FAILURE'

			}
         
    	}
	}
	//
    stage('Publishing') {

    }
    //
    stage('promotion'){ 

	}
    if(currentBuild.result != "FAILURE"){
		setBuildStatus("Build complete", "SUCCESS");
	}else{
	    setBuildStatus("Build complete", "FAILURE");
	}


	//
}
