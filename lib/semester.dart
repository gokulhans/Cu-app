import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/subject.dart';

class Semester extends StatelessWidget {
   Semester({Key? key,required this.title}) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Select Semester'),
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.green,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
      ),
      body:  Semlist(title: title,),
    );
  }
}

class Semlist extends StatelessWidget {
   Semlist({Key? key,required this.title}) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
  List<String> semesters = ['Semester-1','Semester-2','Semester-3','Semester-4','Semester-5','Semester-6'];
  List<String> semname = ['S 1','S 2','S 3','S 4','S 5','S 6'];
    return Center(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      primary: false,
      padding: const EdgeInsets.all(20),
      itemCount: semesters.length,
      itemBuilder: (context, int index) {
        return TextButton(
          child: Column(
            children: <Widget>[
              Container(
                height: 72,
                width: 72,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 3,
                          spreadRadius: 4)
                    ]),
                child: Center(
                    child: Text(
                  semname[index],
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white),
                )),
              ),
              SizedBox(
                height: 8,
              ),
              Text(semesters[index])
            ],
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Subject(
                        title: title+'/'+semesters[index]+'/',
                      )),
            );
          },
        );
      },
    ));
  }
}
