import 'package:amber_website/models/hec_members_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HecMembersRepository {
  Future<List<HecMembersModel>> getMemberData() async {
    try {
      final collection =
          await FirebaseFirestore.instance.collection('hec_members').get();
      final docs = collection.docs;
      List<HecMembersModel> listOfMembers = [];
      for (var doc in docs) {
        final memberData = HecMembersModel.fromJson(doc.data());
        listOfMembers.add(memberData);
      }
      return listOfMembers;
    } on Exception catch (e) {
      return [];
    }
  }
}
