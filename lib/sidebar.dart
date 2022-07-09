import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            title: Text('Welcome'),
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
            leading: Icon(Icons.thumb_up),
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
            leading: Icon(Icons.info),
            title: Text('About Us'),
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
          // ListTile(
          //   leading: Icon(Icons.border_color),
          //   title: Text('Feedback'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
          // ListTile(
          //   leading: Icon(Icons.exit_to_app),
          //   title: Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}
