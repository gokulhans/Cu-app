import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/methods/fetchData.dart';

class Subject extends StatelessWidget {
  const Subject({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Subject'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.green,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
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
                      return Center(
                        child: Text('loading'),
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
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('module');
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
