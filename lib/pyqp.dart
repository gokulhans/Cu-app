import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/admobhelper.dart';
import 'package:note_app/methods/fetchdata.dart';
import 'package:note_app/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';

class Pyqp extends StatelessWidget {
  const Pyqp({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Previous year question paper'),
      ),
      body: Pyqpscreen(
        title: title,
      ),
    );
  }
}

class Pyqpscreen extends StatelessWidget {
 Pyqpscreen({Key? key, required this.title}) : super(key: key);
  final String title;
  AdmobHelper admobHelper = new AdmobHelper();
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPyqs(title),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: SpinKitCircle(
                size: 80,
                color: Colors.blue,
              ),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return TextButton(
                    onPressed: () async {
                  admobHelper.createInterad();

                      var url = snapshot.data[i].link;
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication);
                        //  await launch(url,
                        //   forceWebView: false, enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      snapshot.data[i].name,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                  );
                });
          }
        });
  }
}
