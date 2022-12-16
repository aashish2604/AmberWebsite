import 'package:amber_website/models/leaving_fom_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LeavingFormRepository {
  Future<bool> uploadForm(LeavingFormModel uploadingData) async {
    try {
      final doc = FirebaseFirestore.instance.collection('leaving_form').doc();
      await doc.set(uploadingData.toJson());
      return true;
    } on Exception catch (e) {
      print(e.toString());
      return false;
    }
  }
}
