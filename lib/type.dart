import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_app/admobhelper.dart';
import 'package:note_app/module.dart';
import 'package:note_app/pyqp.dart';
import 'package:note_app/sidebar.dart';

class Type extends StatelessWidget {
  const Type({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Select Type'),
      ),
      body: Typelist(
        title: title,
      ),
    );
  }
}

class Typelist extends StatefulWidget {
  const Typelist({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _TypelistState createState() => _TypelistState();
}

class _TypelistState extends State<Typelist> {
  AdmobHelper admobHelper = new AdmobHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 16,
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 6,
            bottom: 6,
          ),
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                // Shadow for top-left corner
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 0.3,
                ),
                // Shadow for bottom-right corner
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-1, -1),
                  blurRadius: 1,
                  spreadRadius: 3,
                ),
              ]),
          child: Center(
            child: TextButton(
                child: Text(
                  'Videos',
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamed('module');
                  // admobHelper.createInterad();
                  // admobHelper.showInterad();
                  // admobHelper.showInterad();
                  // admobHelper.createInterad();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Module(title: widget.title)),
                  );
                }),
          ),
          // ListTile(

          //   title: Text(snapshot.data[i].item),
          //   subtitle: Text(snapshot.data[i].name),
          //   trailing: Text(snapshot.data[i]._id),
          // ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 60,
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [
                // Shadow for top-left corner
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 0.3,
                ),
                // Shadow for bottom-right corner
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-1, -1),
                  blurRadius: 1,
                  spreadRadius: 3,
                ),
              ]),
          child: Center(
            child: TextButton(
                child: Text(
                  'Q Pappers',
                  style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w900,
                      fontSize: 18),
                ),
                onPressed: () {
                  // Navigator.of(context)
                  //     .pushNamed('module');
                  // admobHelper.createInterad();
                  // admobHelper.showInterad();
                  // admobHelper.createInterad();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Pyqp(title: widget.title)),
                  );
                }),
          ),
          // ListTile(

          //   title: Text(snapshot.data[i].item),
          //   subtitle: Text(snapshot.data[i].name),
          //   trailing: Text(snapshot.data[i]._id),
          // ),
        ),
      ],
    ));
  }
}
