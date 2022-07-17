import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/admobhelper.dart';
import 'package:note_app/methods/fetchdata.dart';
import 'package:note_app/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class File extends StatelessWidget {
  const File({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Videos'),
      ),
      body: Videoscreen(
        title: title,
      ),
    );
  }
}

class Videoscreen extends StatelessWidget {
  Videoscreen({Key? key, required this.title}) : super(key: key);
  final String title;
  var h = false;
  AdmobHelper admobHelper = new AdmobHelper();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getVideos(title),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: SpinKitCircle(
                size: 80,
                color: Colors.green,
              ),
            );
          } else {
            if (snapshot.data.length == 0) {
              return const Center(
                  child: Text(
                'No Content is available right now.\nWe will Update it with in august 31.',
                style: TextStyle(fontWeight: FontWeight.w800),
              ));
            } else {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return TextButton(
                      onPressed: () async {
                        // admobHelper.createInterad();
                        if (snapshot.data[i].link.contains("http")) {
                          var url = snapshot.data[i].link;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalNonBrowserApplication);
                            //  await launch(url,
                            //   forceWebView: false, enableJavaScript: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        } else {
                          var url = 'https://youtu.be/' + snapshot.data[i].link;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalNonBrowserApplication);
                            //  await launch(url,
                            //   forceWebView: false, enableJavaScript: true);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }
                      },
                      child: FittedBox(
                          child: Text(
                        snapshot.data[i].name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w800),
                      )),
                    );
                  });
            }
          }
        });
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

// class Filelist extends StatefulWidget {
//   const Filelist({Key? key}) : super(key: key);

//   @override
//   _FilelistState createState() => _FilelistState();
// }

// class _FilelistState extends State<Filelist> {
//   Future getUserData() async {
//     var response =
//         await http.get(Uri.https('studygramcu.herokuapp.com', 'courses'));
//     var jsonData = jsonDecode(response.body);

//     List<User> users = [];

//     for (var u in jsonData) {
//       User user = User(u["_id"], u["name"], u["item"]);
//       users.add(user);
//     }

//     print(users);
//     return users;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           child: Card(
//               child: FutureBuilder(
//                   future: getUserData(),
//                   builder: (context, AsyncSnapshot snapshot) {
//                     if (snapshot.data == null) {
//                       return Center(
//                         child: Text('loading'),
//                       );
//                     } else {
//                       return Container(
//                         padding: const EdgeInsets.only(
//                           left: 12,
//                           right: 12,
//                           top: 12,
//                         ),
//                         child: ListView.builder(
//                             itemCount: snapshot.data.length,
//                             itemBuilder: (context, i) {
//                               return Container(
//                                 height: 60,
//                                 margin: const EdgeInsets.only(
//                                   left: 12,
//                                   right: 12,
//                                   top: 6,
//                                   bottom: 6,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12),
//                                   boxShadow: [
//                                     BoxShadow(
//                                         color: Colors.black.withOpacity(0.05),
//                                         blurRadius: 3,
//                                         spreadRadius: 4)
//                                   ],
//                                   color: Colors.blue,
//                                 ),
//                                 child: Center(
//                                   child: TextButton(
//                                       child: Text(
//                                         snapshot.data[i].name,
//                                         style: const TextStyle(
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.w900,
//                                             fontSize: 18),
//                                       ),
//                                       onPressed: () {
//                                         Navigator.of(context)
//                                             .pushNamed('module');
//                                       }),
//                                 ),
//                               );
//                             }),
//                       );
//                     }
//                   }))),
//     );
//   }
// }



// class Ss extends StatelessWidget {
//   const Ss({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [const Filelist(), const Tt()],
//     );
//   }
// }

