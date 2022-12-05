import 'package:amber_website/models/hec_members_model.dart';
import 'package:amber_website/models/notice_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeRepository {
  Future<List<NoticeModel>> getNotices(bool isViewAll) async {
    try {
      final collection = isViewAll
          ? await FirebaseFirestore.instance.collection('notices').get()
          : await FirebaseFirestore.instance
              .collection('notices')
              .limit(5)
              .get();
      final docs = collection.docs;
      List<NoticeModel> listOfNotices = [];
      for (var doc in docs) {
        final memberData = NoticeModel.fromJson(doc.data());
        listOfNotices.add(memberData);
      }
      return listOfNotices;
    } on Exception catch (e) {
      return [];
    }
  }
}
