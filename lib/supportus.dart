import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_app/admobhelper.dart';
import 'package:note_app/module.dart';
import 'package:note_app/pyqp.dart';
import 'package:note_app/sidebar.dart';

class Supportus extends StatelessWidget {
  const Supportus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Supportuslist(),
    );
  }
}

class Supportuslist extends StatefulWidget {
  const Supportuslist({Key? key}) : super(key: key);

  @override
  _SupportuslistState createState() => _SupportuslistState();
}

class _SupportuslistState extends State<Supportuslist> {
  AdmobHelper admobHelper = new AdmobHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            height: 60,
            margin: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 3,
                    spreadRadius: 4)
              ],
              color: Colors.red,
            ),
            child: Center(
              child: TextButton(
                  child: const Text(
                    'Support Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    admobHelper.createInterVideoad();
                  }),
            ),
          ),
          
      ),
    );
  }
}
