node('IOS-SLAVE04') {

    if (getBinding().hasVariable("myparam")) {
        
       if (getProperty("myparam") = "build") {
          println "build all"
       else
	  println "single com"
       }
    }

    sh "echo '${myparam}'"
}
