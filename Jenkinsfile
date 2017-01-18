node {
    stage('Preparation') {
        properties([[$class: 'ParametersDefinitionProperty', parameterDefinitions: [[$class: 'ChoiceParameterDefinition', choices: ['one', 'two', 'three'], description: '', name: 'build_step']]], pipelineTriggers([])])
     
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
