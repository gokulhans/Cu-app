import 'package:http/http.dart' as http;
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

  List<Videos> videos = [];

  for (var u in jsonData) {
    Videos video =
        Videos(u["_id"], u["name"], u["link"], u["type"], u["item"], u["user"]);
    videos.add(video);
  }


  return videos;
}

Future getPyqs(var endpoint) async {
  var link = endpoint + 'Previous-Question-Papers';

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
