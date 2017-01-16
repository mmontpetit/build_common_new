node('IOS-SLAVE04') {

    if (getBinding().hasVariable("myparam")) {

       switch ('${myparam}') {
           case "build":
               println "build all"
           case "buildWeb":
               println "build web only"
           case "buildClient":
               println "Build client only"
       }


       
    }

    sh "echo '${myparam}'"
}
