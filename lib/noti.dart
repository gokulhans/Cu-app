import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Noti extends StatelessWidget {
  const Noti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Notifications'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
      ),
      body: const Semlist(),
    );
  }
}

class Semlist extends StatelessWidget {
  const Semlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                )
              ],
              // color: Colors.blue,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: TextButton(
                  child: const Text(
                    "This is a sample notification from admin This is a sample notification from admin This is a sample notification from admin",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('');
                  }),
            ),
          );
        },
        itemCount: 6,
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
    );
  }
}
