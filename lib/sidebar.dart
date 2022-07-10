import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/logo.png'),
                )),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home'),
            onTap: () {
                    Navigator.of(context).popAndPushNamed('home');
            },
          ),
          ListTile(
            leading: Icon(Icons.telegram),
            title: Text('Telegram'),
            onTap: () async {
              var url = "https://codesinsider.com";
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalNonBrowserApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.whatsapp),
            title: Text('Whatsapp'),
            onTap: () async {
              var url = "https://codesinsider.com";
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalNonBrowserApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.instagram),
            title: Text('Instagram'),
            onTap: () async {
              var url = "https://codesinsider.com";
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url),
                    mode: LaunchMode.externalNonBrowserApplication);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.copyright_sharp),
            title: Text('Copyright'),
            onTap: () => {Navigator.of(context).pushNamed('copyright')},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
            onTap: () => {Navigator.of(context).pushNamed('about')},
          ),
        ],
      ),
    );
  }
}
