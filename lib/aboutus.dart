import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListViewBuilder(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Studygram",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
        ),
        iconTheme: IconThemeData(color: Colors.green),
      ),
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> appdata = [
      'App Name',
      'App Version',
      'Developed by',
      'Spacial Thanks'
    ];
    List<String> devdata = ['Studygram', 'V 1.0.0', 'gbroz', 'Fayiz'];
    List<String> linkdata = ['https://play.google.com/store/apps/details?id=com.gbroz.studygram', '', 'https://www.instagram.com/gbrozdev/', 'https://www.instagram.com/fe_y_z_/'];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 10),
            child: ListView.builder(
                itemCount: appdata.length,
                itemBuilder: (context, i) {
                  return ListTile(
                      contentPadding:
                          const EdgeInsets.only(left: 50, right: 50),
                      trailing: TextButton(
                        onPressed: () async {
                          var url = linkdata[i];
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url),
                                mode: LaunchMode.externalNonBrowserApplication);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          devdata[i],
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      title: Text(appdata[i],
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w800)));
                }),
          ),
          Center(
            child: Container(
              height: 464,
              color: Colors.white,
              padding: const EdgeInsets.only(
                left: 30,
                right: 10,
              ),
              child: Center(
                child: Text(
                  'We offers study material for university studies. \n\nWhat You can find here ? \nPrevious question papers \nModal questions \nVideo Classes \nStudy materials \nSyllabus \nPDF books \nTime tables \nProject \nResults \n\nHave any doubts, message us..',
                  style: GoogleFonts.poppins(
                    color: Colors.green,
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 16,
                    // fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
