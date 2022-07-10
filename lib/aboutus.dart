import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListViewBuilder(),

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
    List<String> appdata = ['App Name','App Version','Developed by'];
    List<String> devdata = ['Studygram','V 1.0.0','gbrozdev'];
    
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top:10),
        child: ListView.builder(
            itemCount: appdata.length,
            itemBuilder: ( context, i) {
              return ListTile(
                contentPadding: const EdgeInsets.only(left: 50,right: 50),
                  trailing: Text(
                     devdata[i],
                    style: const TextStyle(color: Colors.green, fontSize: 18,fontWeight: FontWeight.w800),
                  ),
                  title: Text(appdata[i],style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w800)));
            }),
      ),
    );
  }
}

