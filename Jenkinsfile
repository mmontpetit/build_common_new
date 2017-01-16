node('IOS-SLAVE04') {

    if (getBinding().hasVariable("myparam")) {
        println getProperty("myparam")
    }

    sh "echo '${myparam}'"
}
