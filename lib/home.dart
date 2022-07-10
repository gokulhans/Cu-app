import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/semester.dart';
import 'package:note_app/sidebar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: MainPage()),
      drawer: NavDrawer(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 12,
                  ),
                  
                  SizedBox(
                    height: 24,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          var title = 'Bca';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 174, 0),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4)
                                    ]),
                                child: Center(
                                    child: const Text(
                                  "BCA",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Bca")
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          var title = 'Bsc-CS';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4)
                                    ]),
                                child: Center(
                                    child: const Text(
                                  "CS",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Bsc CS")
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          var title = 'Bcom';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4)
                                    ]),
                                child: Center(
                                    child: const Text(
                                  "BCOM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Bcom")
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          var title = 'BBA';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent[400],
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4)
                                    ]),
                                child: Center(
                                    child: const Text(
                                  "BBA",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            Text("BBA")
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          var title = 'Bscpsychology';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Colors.purple,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4)
                                    ]),
                                child: Center(
                                    child: const Text(
                                  "PSYCH",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            Text("BSc Psychology")
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          var title = 'BAEnglish';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 3,
                                          spreadRadius: 4)
                                    ]),
                                child: Center(
                                    child: const Text(
                                  "ENG",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16),
                                ))),
                            SizedBox(
                              height: 10,
                            ),
                            Text("BA English")
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                              height: 20,
                            ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10,bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                      boxShadow: [
                        const BoxShadow(color: Colors.green, spreadRadius: 3),
                      ],
                    ),
                    child: TextButton(
                        onPressed: () {
                          var title = 'Common-Subjects';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Semester(
                                      title: title,
                                    )),
                          );
                        },
                        child: Text(
                          "Common Courses",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        )),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: EdgeInsets.all(10.0),
                      child: ClipRect(
                        child: Container(
                          color: Colors.green[100],
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            child: Column(
                              children: <Widget>[
                                Image.network(
                                    'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190806131525/forkPython.jpg'),
                                const SizedBox(height: 10),
                                const Text(
                                  'Studygram',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
