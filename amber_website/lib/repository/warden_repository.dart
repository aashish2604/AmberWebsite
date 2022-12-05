import 'package:amber_website/models/hec_members_model.dart';
import 'package:amber_website/models/warden_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WardenRepository {
  Future<List<WardenModel>> getWardens() async {
    try {
      final collection =
          await FirebaseFirestore.instance.collection('wardens').get();
      final docs = collection.docs;
      List<WardenModel> listOfWardens = [];
      for (var doc in docs) {
        final memberData = WardenModel.fromJson(doc.data());
        listOfWardens.add(memberData);
      }
      return listOfWardens;
    } on Exception catch (e) {
      return [];
    }
  }
}
