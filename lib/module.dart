import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/file.dart';

class Module extends StatelessWidget {
  const Module({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Module'),
      ),
      body: Modlist(title: title,),
    );
  }
}

class Modlist extends StatefulWidget {
  const Modlist({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ModlistState createState() => _ModlistState();
}

class _ModlistState extends State<Modlist> {


  @override
  Widget build(BuildContext context) {
    List<String> modules = ['module1','module2','module3','module4','module5','module6','question-pappers','others'];

    return Scaffold(
        body: Container(
      child: Card(
          child: ListView.builder(
              itemCount: modules.length,
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
                          modules[i],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 18),
                        ),
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushNamed('module');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => File(
                                    title:
                                        widget.title + modules[i]+'/')),
                          );
                        }),
                  ),
                  // ListTile(

                  //   title: Text(snapshot.data[i].item),
                  //   subtitle: Text(snapshot.data[i].name),
                  //   trailing: Text(snapshot.data[i]._id),
                  // ),
                );
              })),
    ));
  }
}

class User {
  final String _id, name, item;
  User(this._id, this.name, this.item);
}
