import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:note_app/methods/fetchdata.dart';
import 'package:url_launcher/url_launcher.dart';

class Pdf extends StatelessWidget {
  const Pdf({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: Pdfscreen(
        title: title,
      ),
    );
  }
}

class Pdfscreen extends StatelessWidget {
  const Pdfscreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPdfs(title),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: Text('loading'),
            );
          } else {
            return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, i) {
                  return TextButton(
                    onPressed: () async {
                      var url = 'https://youtu.be/' + snapshot.data[i].link;
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url),mode: LaunchMode.externalNonBrowserApplication);
                          //  await launch(url,
                          //   forceWebView: false, enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: FittedBox(
                      child: Image.network(
                        'https://img.youtube.com/vi/' +
                            snapshot.data[i].link +
                            '/0.jpg',
                        width: 400.0,
                      ),
                      fit: BoxFit.fill,
                    ),
                  );
                });
          }
        });
  }
}
