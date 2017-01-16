node('IOS-SLAVE04') {

    if (getBinding().hasVariable("myparam")) {
       x = getProperty("myparam")
       println x
       switch ( x ) {
           case "build":
               println "build all"
           case "buildWeb":
               println "build web only"
           case "buildClient":
               println "Build client only"
       }


       
    }

}
