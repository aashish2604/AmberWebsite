import 'package:cloud_firestore/cloud_firestore.dart';

class ComplainModel {
  String name;
  String admissionNo;
  String roomNo;
  String email;
  String message;
  Timestamp time;

  ComplainModel({
    required this.time,
    required this.name,
    required this.admissionNo,
    required this.roomNo,
    required this.email,
    required this.message,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'admissionNo': admissionNo,
        'roomNo': roomNo,
        'email': email,
        'message': message,
        'timestamp': time,
      };
}
