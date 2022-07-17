import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:note_app/methods/fetchdata.dart';
import 'package:note_app/semester.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: Courselist());
  }
}

class Courselist extends StatefulWidget {
  const Courselist({
    Key? key,
  }) : super(key: key);

  @override
  _CourselistState createState() => _CourselistState();
}

class _CourselistState extends State<Courselist> {
  // var endpoint = widget.title;
  // var endpoint = 'Bca/Semester-1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getSubjects("Courses"),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: SpinKitCircle(
                  size: 80,
                  color: Colors.green,
                ),
              );
            } else {
              return Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 16,
                ),
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 60,
                        margin: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 8,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const [
                              // Shadow for top-left corner
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                spreadRadius: 0.3,
                              ),
                              // Shadow for bottom-right corner
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-1, -1),
                                blurRadius: 1,
                                spreadRadius: 3,
                              ),
                            ]),
                        child: Center(
                          child: TextButton(
                            child: Text(
                              snapshot.data[i].name,
                              style: TextStyle(
                                  color: Colors.green[500],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17),
                            ),
                            onPressed: () {
                              var title = snapshot.data[i].name;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Semester(
                                          title: title,
                                        )),
                              );
                            },
                          ),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
