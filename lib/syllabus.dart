import 'package:flutter/material.dart';
import 'package:note_app/sidebar.dart';
import 'package:url_launcher/url_launcher.dart';


class Syllabus extends StatelessWidget {
  const Syllabus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: const Center(
        child: Text("Coming Soon")
      ),
    );
  }
}
