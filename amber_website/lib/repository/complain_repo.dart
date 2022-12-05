import 'package:amber_website/models/complain_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ComplainRepository {
  Future uploadComplain(
      {required String name,
      required String admissionNo,
      required String roomNo,
      required String email,
      required String message}) async {
    try {
      final ComplainModel model = ComplainModel(
          time: Timestamp.now(),
          name: name,
          admissionNo: admissionNo,
          roomNo: roomNo,
          email: email,
          message: message);
      final Map<String, dynamic> json = model.toJson();
      await FirebaseFirestore.instance.collection('complains').doc().set(json);
      return;
    } on Exception catch (e) {
      return;
    }
  }
}
