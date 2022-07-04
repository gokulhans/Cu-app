import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/semester.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: MainPage(),
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
                  Container(
                    height: 48,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 24, right: 24),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(16)),
                    child: const TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.search,
                          size: 14,
                        ),
                        hintText: "Search for your chapter, classes...",
                        hintStyle: TextStyle(
                          fontSize: 12,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 3,
                                      spreadRadius: 4)
                                ]),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextButton(
                            child: Text("Bca"),
                            onPressed: () {
                              var title = 'Bca/';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Semester(
                                          title: title,
                                        )),
                              );
                            },
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                             TextButton(
                            child: Text("Bsc CS"),
                            onPressed: () {
                              var title = 'Bsc-CS/Semester-1';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Semester(
                                          title: title,
                                        )),
                              );
                            },
                          )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                             TextButton(
                            child: Text("Bcom"),
                            onPressed: () {
                              var title = 'Bcom/Semester-1';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Semester(
                                          title: title,
                                        )),
                              );
                            },
                          )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                             TextButton(
                            child: Text("BBA"),
                            onPressed: () {
                              var title = 'BBA/Semester-1';
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Semester(
                                          title: title,
                                        )),
                              );
                            },
                          )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.purple,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Physics"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreenAccent,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Chemistry"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.lightGreenAccent,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Chemistry"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("BSc Maths"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('semester');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 64,
                              width: 64,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ]),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextButton(
                              child: Text("New Note"),
                              onPressed: () {
                                Navigator.of(context).pushNamed('new');
                                // Navigator.pushReplacement(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Semester()));
                              },
                            )
                          ],
                        ),
                      ),
                    ],
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
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
