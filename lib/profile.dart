import 'package:flutter/material.dart';
import 'package:note_app/sidebar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),

      body: const Center(
        child: Text('Coming Soon'),
      ),
    );
  }
}
