import 'package:http/http.dart' as http;
import 'package:note_app/models/ad.dart';
import 'dart:convert';

import 'package:note_app/models/models.dart';

/*
  Navigator.push(  
    context,  
    MaterialPageRoute(builder: (context) => SecondRoute()),  
  );  
  
 */
Future getSubjects(var endpoint) async {
  var response =
      await http.get(Uri.https('studygramcu.herokuapp.com', endpoint));
  var jsonData = jsonDecode(response.body);

  List<Courses> courses = [];

  for (var u in jsonData) {
    Courses course = Courses(u["_id"], u["name"], u["item"]);
    courses.add(course);
  }
  return courses;
}

Future getVideos(var endpoint) async {
  var link = 'videos/' + endpoint;

  var response = await http.get(Uri.https('studygramcu.herokuapp.com', link));
  var jsonData = jsonDecode(response.body);

  List<Videos> videos = [];

  for (var u in jsonData) {
    Videos video =
        Videos(u["_id"], u["name"], u["link"], u["type"], u["item"], u["user"]);
    videos.add(video);
  }

  return videos;
}

Future getPdfs(var endpoint) async {
  var link = endpoint + 'Study-Materials';

  var response = await http.get(Uri.https('studygramcu.herokuapp.com', link));
  var jsonData = jsonDecode(response.body);

  List<Pdfs> pdfs = [];

  for (var u in jsonData) {
    Pdfs pdf = Pdfs(u["_id"], u["name"], u["link"], u["item"], u["user"]);
    pdfs.add(pdf);
  }

  return pdfs;
}

Future getPyqs(var endpoint) async {
  var link = endpoint + 'Previous-Question-Papers';

  var response = await http.get(Uri.https('studygramcu.herokuapp.com', link));
  var jsonData = jsonDecode(response.body);

  List<Pyqs> pyqs = [];

  for (var u in jsonData) {
    Pyqs pyq = Pyqs(u["_id"], u["name"], u["link"], u["item"], u["user"]);
    pyqs.add(pyq);
  }

  return pyqs;
}

Future getSyllabus() async {
  var link = 'syllabus';

  var response = await http.get(Uri.https('studygramcu.herokuapp.com', link));
  var jsonData = jsonDecode(response.body);

  List<Syllabus> syllabuss = [];

  for (var u in jsonData) {
    Syllabus syllabus = Syllabus(u["_id"], u["course"], u["link"]);
    syllabuss.add(syllabus);
  }

  return syllabuss;
}

Future getNoti() async {
  var link = 'noti';

  var response = await http.get(Uri.https('studygramcu.herokuapp.com', link));
  var jsonData = jsonDecode(response.body);

  List<Noti> notis = [];

  for (var u in jsonData) {
    Noti noti = Noti(u["_id"], u["name"], u["content"], u["link"]);
    notis.add(noti);
  }
  print(notis);
  return notis;
}

// var adstatus = 0;

// Future getAds() async {
//   var response =
//       await http.get(Uri.https('studygramcu.herokuapp.com', 'ads-status'));
//   var jsonData = jsonDecode(response.body);
//   List<Ads> ads = [];

//   for (var u in jsonData) {
//     Ads ad = Ads(u["_id"],u["ad"]);
//     ads.add(ad);
//   }

//   var a = await ads;
//   if (a == null) {
//     adstatus = 0;
//     print("null");
//   } else {
//     adstatus = 1;
//     print("not null");
//   }

//   return adstatus;
// }

// getadstatus() {
//   print(adstatus);
//   return adstatus;
// }
