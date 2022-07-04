import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class File extends StatelessWidget {
  const File({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: Tt(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
// static String myVideoId = 'PQSagzssvUQ';
//   // the full url: https://www.youtube.com/watch?v=PQSagzssvUQ&ab_channel=NASA
//   // it's an interesting video from NASA on Youtube

//   // Initiate the Youtube player controller
//   final YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId: myVideoId,
//     flags: const YoutubePlayerFlags(
//       autoPlay: true,
//       mute: false,
//     ),
//   );

//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(top: 30),
//       child: Scaffold(
//           body: YoutubePlayer(
//             controller: _controller,
//             liveUIColor: Colors.amber,
//           )),
//     );
//   }
// }

class Filelist extends StatefulWidget {
  const Filelist({Key? key}) : super(key: key);

  @override
  _FilelistState createState() => _FilelistState();
}

class _FilelistState extends State<Filelist> {
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
                                        Navigator.of(context)
                                            .pushNamed('module');
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

class Ss extends StatelessWidget {
  const Ss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [const Filelist(), const Tt()],
    );
  }
}

class Tt extends StatelessWidget {
  const Tt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String myVideoId = 'PQSagzssvUQ';
    return Column(
      children: [
        TextButton(
          
          onPressed: () async {
            const url = 'https://youtu.be/6tfBflFUO7s';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launch(url, forceWebView: true, enableJavaScript: true);
            } else {
              throw 'Could not launch $url';
            }
          },
          child: FittedBox(
            child: Image.network(
              'https://img.youtube.com/vi/' + myVideoId + '/0.jpg',
              width: 400.0,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
