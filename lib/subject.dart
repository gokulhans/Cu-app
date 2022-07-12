import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/methods/fetchData.dart';
import 'package:note_app/sidebar.dart';
import 'package:note_app/type.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Subject extends StatelessWidget {
  const Subject({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Select Subject'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Sublist(title: title),
    );
  }
}

class Sublist extends StatefulWidget {
  const Sublist({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SublistState createState() => _SublistState();
}

class _SublistState extends State<Sublist> {
  // var endpoint = widget.title;
  // var endpoint = 'Bca/Semester-1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Card(
              child: FutureBuilder(
                  future: getSubjects(widget.title),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(
                        child: SpinKitCircle(
                          size: 80,
                          color: Colors.blue,
                        ),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 12,
                        ),
                        child: ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return Container(
                                height: 60,
                                margin: const EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  top: 6,
                                  bottom: 6,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 3,
                                        spreadRadius: 4)
                                  ],
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: TextButton(
                                      child: Text(
                                        snapshot.data[i].name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {
                                        // Navigator.of(context)
                                        //     .pushNamed('module');
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Type(title:widget.title+snapshot.data[i].name + '/')),
                                        );
                                      }),
                                ),
                                // ListTile(

                                //   title: Text(snapshot.data[i].item),
                                //   subtitle: Text(snapshot.data[i].name),
                                //   trailing: Text(snapshot.data[i]._id),
                                // ),
                              );
                            }),
                      );
                    }
                  }))),
    );
  }
}
