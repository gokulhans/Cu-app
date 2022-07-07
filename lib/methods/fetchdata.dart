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
  print(endpoint);
  var response =
      await http.get(Uri.https('studygramcu.herokuapp.com', endpoint));
  var jsonData = jsonDecode(response.body);

  List<Courses> courses = [];

  for (var u in jsonData) {
    Courses course = Courses(u["_id"], u["name"], u["item"]);
    courses.add(course);
  }
  print(courses);
  return courses;
}

Future getVideos(var endpoint) async {
  print('called1');
  var link = '/videos/' + endpoint;
  print(link);
  print('d');

  var response = await http.get(Uri.https('studygramcu.herokuapp.com', 'videos/Bca/Semester-1/MFCA/module1'));
  var jsonData = jsonDecode(response.body);

  List<Videos> videos = [];
  print('called1.1');

  for (var u in jsonData) {
    Videos video =
        Videos(u["_id"], u["name"], u["link"], u["type"], u["item"], u["user"]);
    videos.add(video);
  }

  print('called2');
  print(videos);

  return videos;
}
