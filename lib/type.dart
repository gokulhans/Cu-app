import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Type extends StatelessWidget {
  const Type({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Type'),
      ),
      body: const Typelist(),
    );
  }
}

class Typelist extends StatefulWidget {
  const Typelist({Key? key}) : super(key: key);

  @override
  _TypelistState createState() => _TypelistState();
}

class _TypelistState extends State<Typelist> {
  Future getUserData() async {
    var response =
        await http.get(Uri.https('studygramcu.herokuapp.com', 'courses'));
    var jsonData = jsonDecode(response.body);

    List<User> users = [];

    for (var u in jsonData) {
      User user = User(u["_id"], u["name"], u["item"]);
      users.add(user);
    }

    print(users);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Card(
              child: FutureBuilder(
                  future: getUserData(),
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
                                        Navigator.of(context).pushNamed('file');
                                      }),
                                ),
                              );
                            }),
                      );
                    }
                  }))),
    );
  }
}

class User {
  final String _id, name, item;
  User(this._id, this.name, this.item);
}
