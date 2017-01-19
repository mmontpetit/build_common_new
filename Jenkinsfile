def userInput = true
def didTimeout = false
def webTest = true
def clientTest = true
def buildTarget = 'build'
properties(
[
    [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '10', artifactNumToKeepStr: '50', daysToKeepStr: '31', numToKeepStr: '500']],
    [$class: 'ParametersDefinitionProperty', parameterDefinitions:
        [
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Archive artifacts (in Jenkins) from the build step (e.g. engine-prod-exe-windows.zip)', name: 'ARCHIVE_BUILT_ZIPS'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Publish packages to ld-onedrop. This is needed in order to use the result in other pipelines such as QV.', name: 'PUBLISH_LD_ONEDROP'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Build with Visual Studio 2015 Update 3.', name: 'BUILD_VS_UPDATE3'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: '', description: 'If you want a slack notification pass the #channel or @username that you want as the destination.', name: 'SLACK_CHANNEL'],

         ]
    ],
    [$class: 'ThrottleJobProperty', categories: [], limitOneJobWithMatchingParams: false, maxConcurrentPerNode: 0, maxConcurrentTotal: 0, paramsToUseForLimit: '', throttleEnabled: false, throttleOption: 'project']
]
)

