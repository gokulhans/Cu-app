// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/sidebar.dart';
import 'package:note_app/subject.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_app/admobhelper.dart';

class Semester extends StatelessWidget {
  Semester({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Select Semester'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.green,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
      ),
      body: Semlist(
        title: title,
      ),
    );
  }
}

class Semlist extends StatelessWidget {
  Semlist({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    List<String> semesters = [
      'Semester-1',
      'Semester-2',
      'Semester-3',
      'Semester-4',
      'Semester-5',
      'Semester-6'
    ];
    List<String> semname = ['S 1', 'S 2', 'S 3', 'S 4', 'S 5', 'S 6'];
    return Container(
      padding: EdgeInsets.only(top: 32),
      child: Center(
          child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        primary: false,
        padding: const EdgeInsets.all(10),
        itemCount: semesters.length,
        itemBuilder: (context, int index) {
          return TextButton(
            child: Column(
              children: <Widget>[
                Container(
                  height: 72,
                  width: 72,
                   decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              // Shadow for top-left corner
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 2),
                                blurRadius: 2,
                                spreadRadius: 3,
                              ),
                              // Shadow for bottom-right corner
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-1, -1),
                                blurRadius: 2,
                                spreadRadius: 3,
                              ),
                            ]),
                  child: Center(
                      child: Text(
                    semname[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.green),
                  )),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(semesters[index],style: TextStyle(color: Colors.green,fontWeight: FontWeight.w900),)
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Subject(
                          title: title + '/' + semesters[index] + '/',
                        )),
              );
            },
          );
        },
      )),
    );
  }
}
