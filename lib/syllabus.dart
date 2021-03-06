import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:note_app/methods/fetchdata.dart';
import 'package:note_app/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';

class Syllabus extends StatelessWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        backgroundColor: Colors.white,
        body: const Syllabuslist());
  }
}

class Syllabuslist extends StatefulWidget {
  const Syllabuslist({
    Key? key,
  }) : super(key: key);

  @override
  _SyllabuslistState createState() => _SyllabuslistState();
}

class _SyllabuslistState extends State<Syllabuslist> {
  // var endpoint = widget.title;
  // var endpoint = 'Bca/Semester-1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: getSyllabus(),
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
                          top: 6,
                          bottom: 6,
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
                                snapshot.data[i].course,
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                              onPressed: () async {
                                var url = snapshot.data[i].link;
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url),
                                      mode: LaunchMode.externalApplication);
                                  //  await launch(url,
                                  //   forceWebView: false, enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
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
          }),
    );
  }
}
