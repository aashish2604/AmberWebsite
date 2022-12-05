import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeModel {
  String title;
  String description;
  DateTime time;

  NoticeModel(
      {required this.description, required this.time, required this.title});

  factory NoticeModel.fromJson(Map<String, dynamic> json) {
    final Timestamp timestamp = json['time'];
    DateTime dateTime = timestamp.toDate();
    return NoticeModel(
        description: json['description'], time: dateTime, title: json['title']);
  }
}
