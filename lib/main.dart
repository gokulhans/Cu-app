// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:async';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_app/demoad.dart';
import 'package:note_app/home.dart';
import 'package:note_app/courses.dart';
import 'package:note_app/profile.dart';
import 'package:note_app/sidebar.dart';
import 'package:note_app/semester.dart';
import 'package:note_app/subject.dart';
import 'package:note_app/module.dart';
import 'package:note_app/syllabus.dart';
import 'package:note_app/type.dart';
import 'package:note_app/file.dart';
import 'package:note_app/login.dart';
import 'package:note_app/splashscreen.dart';
import 'package:note_app/noti.dart';
import 'package:note_app/admobhelper.dart';

void main() {
  runApp(const MyApp());
  MobileAds.instance.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.deepPurpleAccent),
          headline2: TextStyle(color: Colors.deepPurpleAccent),
          bodyText2: TextStyle(color: Colors.deepPurpleAccent),
          subtitle1: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      routes: {
        'semester': (ctx) {
          return Semester(
            title: 'hh',
          );
        },
        'subject': (ctx) {
          return Subject(
            title: 'd',
          );
        },
        'module': (ctx) {
          return const Module();
        },
        'type': (ctx) {
          return const Type();
        },
        'file': (ctx) {
          return const File();
        },
        'login': (ctx) {
          return const MyLogin();
        },
        'splash': (ctx) {
          return const Splash();
        },
        // 'new': (ctx) {
        // return const New_Note();
        // },
        'noti': (ctx) {
          return DemoAd();
        },
      },
      debugShowCheckedModeBanner: false,
      // home: MainPage(),
      home: MainPage(),
    );
  }
}

// class SplashPage extends StatefulWidget {
//   @override
//   _SplashPageState createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//         Duration(seconds: 3),
//         () => Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => MainPage())));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         color: Colors.white,
//         child: FlutterLogo(size: MediaQuery.of(context).size.height));
//   }
// }

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [Home(), Courses(), Syllabus(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Studygram",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.symmetric(horizontal: 24),
            icon: Badge(
              // ignore: prefer_const_constructors
              child: Icon(
                Icons.notifications,
                color: Colors.teal,
              ),
              showBadge: true,
              badgeContent: Text(""),
            ),
            onPressed: () {
              // AdmobHelper.createInterad();
              // AdmobHelper.showInterad();
              Navigator.of(context).pushNamed('noti');
            },
          )
        ],
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
          ),
          selectedIconTheme: const IconThemeData(
            color: Colors.green,
          ),
          selectedLabelStyle: const TextStyle(
            color: Colors.green,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.grey,
          ),
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
            BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq_outlined), label: 'Syllabus'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: 'Profile'),
          ]),
    );
  }
}
