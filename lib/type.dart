import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/module.dart';

class Type extends StatelessWidget {
  const Type({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Type'),
      ),
      body: Typelist(title: title,),
    );
  }
}

class Typelist extends StatefulWidget {
 const Typelist({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TypelistState createState() => _TypelistState();
}

class _TypelistState extends State<Typelist> {
  

  @override
  Widget build(BuildContext context) {
    List<String> types = ['Previous-Question-Papers', 'Videos', 'PDF'];

    return Scaffold(
        body: Container(
      child: Card(
          child: ListView.builder(
              itemCount: types.length,
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
                          types[i],
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
                                builder: (context) => Module(
                                    title:
                                        widget.title)),
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
