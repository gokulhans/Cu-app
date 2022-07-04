import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: true,
          left: true,
          right: true,
          child: Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Studygram",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: "Dream of a world without",
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      TextSpan(
                          text: " Supply",
                          style: TextStyle(color: Colors.teal, fontSize: 12)),
                    ])),
                  ],
                ),
                Spacer(),
                Badge(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.teal,
                  ),
                  showBadge: true,
                  badgeContent: Text(""),
                )
              ],
            ),
          )),
    );
  }
}
