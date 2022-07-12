# Backend Front end integrations Steps and procedure. 

* updating Url end points
* Creating models for different types of post and get requests
* changing some lines
* running builder (automatic)
* edit files
* create a abstract class for every function in data.dart
* and extends it in notedb

playstore steps

//TODOS

keystore generation and key.properties file generaation [i asskipped these steps]

@ android/app/build.gardle  in this position add package name and this is same as keystor epackage name , reverse of our webpage

   defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId "com.gbroz.studygram"
        minSdkVersion 21
        targetSdkVersion 28
        multiDexEnabled true
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }

Reviewing the Gradle build configuration

https://docs.flutter.dev/deployment/android#reviewing-the-gradle-build-configuration

video 2 32:35 

there are lot of errors in upcoming 