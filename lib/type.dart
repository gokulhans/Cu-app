import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/module.dart';
import 'package:note_app/pdf.dart';

class Type extends StatelessWidget {
  const Type({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Type'),
      ),
      body: Typelist(
        title: title,
      ),
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
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 16,
        ),
        
        Container(
          height: 60,
          margin: const EdgeInsets.only(
        left: 20,
        right: 20,
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
          'Videos',
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
                builder: (context) => Module(title: widget.title)),
          );
        }),
          ),
          // ListTile(

          //   title: Text(snapshot.data[i].item),
          //   subtitle: Text(snapshot.data[i].name),
          //   trailing: Text(snapshot.data[i]._id),
          // ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(
        left: 20,
        right: 20,
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
              'PDF',
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
                    builder: (context) => Pdf(title: widget.title)),
              );
            }),
          ),
          // ListTile(

          //   title: Text(snapshot.data[i].item),
          //   subtitle: Text(snapshot.data[i].name),
          //   trailing: Text(snapshot.data[i]._id),
          // ),
        ),
      ],
    ));
  }
}
