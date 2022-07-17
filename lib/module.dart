import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/file.dart';
import 'package:note_app/sidebar.dart';

class Module extends StatelessWidget {
  const Module({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
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
    List<String> modulename = ['Module 1','Module 2','Module 3','Module 4','Module 5','Module 6','Questions Pappers','Others'];

    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 8),
      child: Builder(
        builder: (context) {
          return ListView.builder(
              itemCount: modules.length,
              itemBuilder: (context, i) {
                return TextButton(
                    child: Text(
                      modulename[i],
                      style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16),
                    ),
                    
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => File(
                                title:
                                    widget.title + modules[i]+'/')),
                      );
                    });
              });
        }
      ),
    ));
  }
}

class User {
  final String _id, name, item;
  User(this._id, this.name, this.item);
}
