import 'dart:async';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_app/aboutus.dart';
import 'package:note_app/admobhelper.dart';
// import 'package:note_app/admobhelper.dart';
import 'package:note_app/copyright.dart';
import 'package:note_app/home.dart';
import 'package:note_app/courses.dart';
import 'package:note_app/sidebar.dart';
import 'package:note_app/semester.dart';
import 'package:note_app/subject.dart';
import 'package:note_app/module.dart';
import 'package:note_app/supportus.dart';
import 'package:note_app/syllabus.dart';
import 'package:note_app/type.dart';
import 'package:note_app/file.dart';
import 'package:note_app/noti.dart';
import 'package:note_app/updatehome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialize();
  // AdmobHelper admobHelper = new AdmobHelper();
  // Timer.periodic(Duration(seconds: 600), (timer) {
  //   admobHelper.createInterad();
  // });

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          return Module(title: 'd');
        },
        'type': (ctx) {
          return const Type(
            title: 'd',
          );
        },
        'file': (ctx) {
          return File(
            title: 'dh',
          );
        },
        'noti': (ctx) {
          return const Noti();
        },
        'about': (ctx) {
          return const AboutPage();
        },
        'copyright': (ctx) {
          return const Copyright();
        },
        'home': (ctx) {
          return MainPage();
        },
        'support': (ctx) {
          return Supportus();
        },
      },
      debugShowCheckedModeBanner: false,
      home: UpdateHome(),
    );
  }
}

class Exithome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text(
                'Do you want to close Studygram ?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
        onWillPop: showExitPopup,
        child: Scaffold(
          body: MainPage(),
        ));
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [Home(), Courses(), Syllabus(), Supportus()];
  AdmobHelper admobHelper = new AdmobHelper();

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
              // admobHelper.createInterad();
              // admobHelper.showInterad();
              // print("test");
              // AdmobHelper().showInterad();
              Navigator.of(context).pushNamed('noti');
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.green),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
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
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: 'Support Us',
            ),
          ]),
    );
  }
}
