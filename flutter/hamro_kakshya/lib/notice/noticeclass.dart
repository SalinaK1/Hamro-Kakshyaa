import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hamro_kakshya/notice/notice.dart';
import 'package:hamro_kakshya/subject/classcode.dart';
import 'package:hamro_kakshya/subject/subjectcode.dart';
import 'package:http/http.dart' as http;

class NoticeClass {
  final String title, description;
  final SubjectCode subjectcode;
  final ClassCode classcode;

  NoticeClass(
      {this.title,
      this.description,
      // ignore: non_constant_identifier_names
      this.subjectcode,
      this.classcode});

  factory NoticeClass.fromJson(Map<String, dynamic> json) {
    return NoticeClass(
      title: json['title'],
      description: json['description'],
      subjectcode: SubjectCode.fromJson(json['subjectcode']),
      classcode: ClassCode.fromJson(json['classcode']),
    );
  }

  Map<String, dynamic> toJson() {
    return ({
      'title': this.title,
      'description': this.description,
      'subjectcode': this.subjectcode.toJson(),
      'classcode': this.classcode.toJson(),
    });
  }
}

Future<List<NoticeClass>> fetchNotices(http.Client client,
    {String subject = ""}) async {
  String query = "";
  if (subject.isNotEmpty) {
    query = "?q=" + subject;
  }
  final response =
      await client.get(Uri.parse('http://192.168.1.74:8000/notice/${query}'));

  print(query);

  if (response.statusCode == 200) {
    return compute(parseNotices, response.body);
  } else {
    throw Exception('Failed to load Notice');
  }
}

List<NoticeClass> parseNotices(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<NoticeClass>((json) => NoticeClass.fromJson(json)).toList();
}

Future<NoticeClass> createNotice(NoticeClass notice) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.74:8000/notice/create/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(notice.toJson()),
  );

  print(notice.toJson());

  if (response.statusCode == 201) {
    return NoticeClass.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    print(response.body);
    throw Exception('Failed to create notice.');
  }
}
