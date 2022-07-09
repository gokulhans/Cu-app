import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Syllabus extends StatelessWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child:TextButton(
                    onPressed: () async {
                      var url = "https://studygramcu.herokuapp.com/";
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
                          //  await launch(url,
                          //   forceWebView: false, enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text("Halo"),

                  )
      ),
    );
  }
}
