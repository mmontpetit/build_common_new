def userInput = true
def didTimeout = false
def webTest = true
def clientTest = true
def buildTarget = 'build'
properties(
[
    [$class: 'BuildDiscarderProperty', strategy: [$class: 'LogRotator', artifactDaysToKeepStr: '10', artifactNumToKeepStr: '50', daysToKeepStr: '31', numToKeepStr: '500']],
    [$class: 'RebuildSettings', autoRebuild: false, rebuildDisabled: false],
    [$class: 'ParametersDefinitionProperty', parameterDefinitions:
        [
            [$class: 'ParameterSeparatorDefinition', name: 'separator-generic', sectionHeader: '<h2 style="color:darkblue;">Generic Parameters</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Archive artifacts (in Jenkins) from the build step (e.g. engine-prod-exe-windows.zip)', name: 'ARCHIVE_BUILT_ZIPS'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Publish packages to ld-onedrop. This is needed in order to use the result in other pipelines such as QV.', name: 'PUBLISH_LD_ONEDROP'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Build with Visual Studio 2015 Update 3.', name: 'BUILD_VS_UPDATE3'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: '', description: 'If you want a slack notification pass the #channel or @username that you want as the destination.', name: 'SLACK_CHANNEL'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-1', sectionHeader: '<h2 style="color:darkblue;">Sense Windows</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Build Sense Windows (Engine, EngineDefinition, ProtocolTester4Net)', name: 'SENSE_WINDOWS'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Use dependencies from qlik-sense-server instead of gradle/dependency.manifest when running tests.', name: 'USE_SENSE_FOR_DEPENDENCIES'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-1', sectionHeader: '<h2 style="color:darkblue;">Installation packages</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Build server installation package with this engine and the other components specified by HEAD in qlik-sense-server git.', name: 'BUILD_SERVER_MSI_PACKAGE'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: 'master', description: 'Specify the branch in the qlik-sense-server repo that should be used for determing the composition.', name: 'SERVER_MANIFEST_BRANCH'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Build desktop installation package with this engine and the other components specified by HEAD in qlik-sense-server git.', name: 'BUILD_DESKTOP_MSI_PACKAGE'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: 'master', description: 'Specify the branch in the qlik-sense-desktop repo that should be used for determing the composition.', name: 'DESKTOP_MANIFEST_BRANCH'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-2', sectionHeader: '<h3 style="color:orange;">Tests: Desktop and Server (shared persistance) </h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute search test cases (SmartSearch)', name: 'TEST_SEARCH_DESKTOP'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute search test cases in a shared persistance configuration. (SearchServer)', name: 'TEST_SEARCH_SERVER_SHARED'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute chart tests cases (EngineChart00 - EngineChart03)', name: 'TEST_CHART'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute desktop test cases including migration (EngineDesktop00 - EngineDesktop02 and EngineScript)', name: 'TEST_DESKTOP'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute server tests cases in a shared persistance configuration. (EngineServer00 - EngineServer06)', name: 'TEST_SERVER_SHARED'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute FileFormat tests.', name: 'TEST_FILEFORMAT'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-3', sectionHeader: '<h3 style="color:orange;">Extended tests: Desktop and Server (shared persistance) </h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute database test cases  in a shared persistance configuration. (DDServerMsSql2005, DDServerMsSql2008, DDServerMsSql20012, DDServerOracle11, PostgreSql) ', name: 'TEST_EE_DATABASE_SHARED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute Teradata test cases  in a shared persistance configuration. (DDServerTeradata14) ', name: 'TEST_EE_TERADATA_SHARED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute desktop test cases (InternalTestDesktop, DocumentationDesktop, LegacyEngineDesktop, NightlyInDesktop, Security, EngineLogPathDesktop)', name: 'TEST_EE_DESKTOP'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute server test cases  in a shared persistance configuration. (DocumentationServer, NightlyInServer, LegacyEngineServer)', name: 'TEST_EE_SERVER_SHARED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute SAP Hana test cases in a shared persistance configuration. (SAPHana)', name: 'TEST_EE_HANA_SHARED'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-2', sectionHeader: '<h3 style="color:orange;">Tests: Server (synced persistance) </h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute search test cases in a synchronized persistance configuration. (SearchServer)', name: 'TEST_SEARCH_SERVER_SYNCED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute server tests cases in a synchronized persistance configuration. (EngineServer00 - EngineServer06)', name: 'TEST_SERVER_SYNCED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute database test cases in a synchronized persistance configuration. (DDServerMsSql2005, DDServerMsSql2008, DDServerMsSql20012, DDServerOracle11, PostgreSql) ', name: 'TEST_EE_DATABASE_SYNCED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute Teradata test cases in a synchronized persistance configuration. (DDServerTeradata14) ', name: 'TEST_EE_TERADATA_SYNCED'],            
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute server test cases in a synchronized persistance configuration. (DocumentationServer, NightlyInServer, LegacyEngineServer)', name: 'TEST_EE_SERVER_SYNCED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute SAP Hana test cases in a synchronized persistance configuration. (SAPHana)', name: 'TEST_EE_HANA_SYNCED'],
            
            [$class: 'ParameterSeparatorDefinition', name: 'separator-windows10-test', sectionHeader: '<h3 style="color:orange;">Windows 10</h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute desktop tests on Windwos 10.', name: 'TEST_WINDOWS10_DESKTOP'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute server tests on Windows 10 in a shared persistance configuration.', name: 'TEST_WINDOWS10_SERVER_SHARED'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Execute server tests on Windows 10 in a synchronized persistance configuration.', name: 'TEST_WINDOWS10_SERVER_SYNCED'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-performance', sectionHeader: '<h3 style="color:orange;">Performance Executor</h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Create an installation package that is possible to use with the performance executor.', name: 'PERFORMANCE_EXECUTOR'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-composition', sectionHeader: '<h3 style="color:red;">Composition (Advanced options, you need to know what you do. Only applicable for Sense test slices in Windows)</h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: '', description: 'A list of components separated with ; that shall be resolved to specific versions. Example: client:3.4.2;servicedispatcher:12.0.1', name: 'COMPOSITION_FORCEVERSIONS'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: '', description: 'The path to the local ivy repo.', name: 'COMPOSITION_LOCALIVYHOME'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-4', sectionHeader: '<h2 style="color:darkblue;">Sense Linux</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Flag to indicate if anything related to Sense Linux will be built.', name: 'SENSE_LINUX'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Build in Docker container (experimental).', name: 'SENSE_LINUX_DOCKER'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-6', sectionHeader: '<h3 style="color:orange;">Tests: EngineOnly/CI/Engine Iron Parameters</h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute search test cases (SmartSearch)', name: 'TEST_SEARCH_LINUX'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute chart tests cases (EngineChart00, EngineChart01, EngineChart02, EngineChart03)', name: 'TEST_CHART_LINUX'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute desktop test cases (EngineDesktop00, EngineDesktop01, EngineDesktop02 and EngineScript)', name: 'TEST_DESKTOP_LINUX'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-OSX', sectionHeader: '<h2 style="color:darkblue;">Sense OSX</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Flag to indicate if anything related to Sense OSX will be built.', name: 'SENSE_OSX'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-iOS', sectionHeader: '<h2 style="color:darkblue;">Sense iOS</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Flag to indicate if anything related to Sense iOS Simulator will be built.', name: 'SENSE_IOS'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Flag to indicate if anything related to Sense iOS device will be built.', name: 'SENSE_IOS_DEVICE'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-QlikView', sectionHeader: '<h2 style="color:darkblue;">QlikView</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Build QVDesktop artifact.', name: 'QLIKVIEW_QVDESKTOP'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Build QlikView artifacts (QVServer, QVBatch, QVLocalize, QVOCXWin32, QVOCXx64).', name: 'QLIKVIEW'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute QlikView Desktop Engine test slices.', name: 'QLIKVIEW_TESTS_QV'],
            [$class: 'BooleanParameterDefinition', defaultValue: true, description: 'Execute QlikView Batch Engine test slices.', name: 'QLIKVIEW_TESTS_QVB'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-coverity', sectionHeader: '<h2 style="color:darkblue;">Coverity</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Analyze Sense related variants. (Engine)', name: 'COVERITY_SENSE'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Analyze QlikView related variants. (QVDesktop, QVServer, QVBatch, QVLocalize, QVOCXWin32, QVOCXx64)', name: 'COVERITY_QLIKVIEW'],
            [$class: 'ParameterSeparatorDefinition', name: 'separator-coveritydelta', sectionHeader: '<h3 style="color:orange;">Coverity delta analysis</h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Do delta coverity analysis. Will analyze only changed files compared to the parent branch.', name: 'COVERITY_DELTA'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: 'master', description: 'The branch that is to be considered as parent. Used when doing a delta scan in order to find the diff between parent and current branch.', name: 'COVERITY_PARENT_BRANCH'],
            [$class: 'ParameterSeparatorDefinition', name: 'separator-coverityfull', sectionHeader: '<h3 style="color:red;">Coverity full analysis (DO NOT CHECK ANY OF THESE OPTIONS)</h3>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Do full coverity analysis. Will analyze all build targets we have; both Sense and Qlikview', name: 'COVERITY_FULL'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Commit findings to database. Only applicable if COVERITY_FULL is checked.', name: 'COVERITY_COMMIT'],

            [$class: 'ParameterSeparatorDefinition', name: 'separator-1', sectionHeader: '<h2 style="color:red;">Releasing (DO NOT CHECK ANY OF THESE OPTIONS)</h2>', sectionHeaderStyle: '', separatorStyle: ''],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Publish packages to Artifactory online. WARNING: This should NEVER be checked manually but only from the release job.', name: 'PUBLISH_ONLINE'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Publish docker imgage to Artifactory online. (Experimental) WARNING: This should NEVER be checked manually but only from the release job.', name: 'PUBLISH_DOCKER_ONLINE'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Publish Engine definition package to Artifactory online. Should only be published when the interface has changed. WARNING: This should NEVER be checked manually but only from the release job.', name: 'PUBLISH_DEFINITION'],
            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Publish as released packages to Artifactory online. WARNING: This should NEVER be checked manually but only from the release job.', name: 'PUBLISH_RELEASE'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: '', description: 'The Git tag to publish as released packages to Artifactory online. PUBLISH_RELEASE must be checked as well. WARNING: This should NEVER be checked manually but only from the release job.', name: 'RELEASE_GIT_TAG'],
            [$class: 'hudson.model.StringParameterDefinition', defaultValue: '', description: 'Set who has started the job. WARNING: This should NEVER be checked manually but other jobs.', name: 'STARTER'],
        ]
    ],
    [$class: 'ThrottleJobProperty', categories: [], limitOneJobWithMatchingParams: false, maxConcurrentPerNode: 0, maxConcurrentTotal: 0, paramsToUseForLimit: '', throttleEnabled: false, throttleOption: 'project']
]
)

