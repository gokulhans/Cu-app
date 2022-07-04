/*
Demo data

{
  "_id":"56ghfhf6g65",
  "title":"title",
  "content":"sample-content"
}
{
  "data":[
    {
  "_id":"56ghfhf6g65",
  "title":"title",
  "content":"sample-content"
},
{
  "_id":"56ghfhf6g65",
  "title":"title",
  "content":"sample-content"
}
  ]
}

*/

import 'package:dio/dio.dart';
import 'package:note_app/data/get_all_notes_resp/get_all_notes_resp.dart';
import 'package:note_app/data/note_model/note_model.dart';
import 'package:note_app/data/url.dart';

abstract class ApiCalls {
  Future<NoteModel?> createNote(NoteModel value);
  Future<List<NoteModel>> getAllNotes();
  Future<NoteModel?> updateNote(NoteModel value);
  Future<NoteModel> deleteNote(String id);
}

class NoteDB extends ApiCalls {
  final dio = Dio();
  final url = Url();

  @override
  Future<NoteModel?> createNote(NoteModel value) async {
    // var response =await dio.post('http://test-api-flutter-app.herokuapp.com/create',
    //     data: {'id': 12, 'title': 'wendu', 'content': 'wendu'},
    //     options: Options(headers: {
    //       'Content-type': 'application/json; charset=UTF-8',
    //     }));

    // print(response);

    // dio.post('http://127.0.0.1:3000/create/');

    print('dsd');
    var response = await dio.post<NoteModel>(
        'http://test-api-flutter-app.herokuapp.com/create',
        data: value.toJson(),
        options: Options(headers: {
          'Content-type': 'application/json; charset=UTF-8',
        }));

    print('d');
    print(response.data);
    print('d');
    return null;
    // return _result.data;
  }

  @override
  Future<NoteModel> deleteNote(String id) async {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    final _result =
        await dio.get<GetAllNotesResp>(url.baseUrl + url.getAllCourses);

    if (_result.data == null) {
      return [];
    } else {
      return _result.data!.data;
    }
  }

  @override
  Future<NoteModel?> updateNote(NoteModel value) async {
    // TODO: implement updateNote
    throw UnimplementedError();
  }
}
