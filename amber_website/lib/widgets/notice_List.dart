import 'package:amber_website/models/notice_model.dart';
import 'package:amber_website/repository/notice_repository.dart';
import 'package:amber_website/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

Future<void> showNoticeDialog(BuildContext context, NoticeModel data) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (_) {
      bool isMobile = (MediaQuery.of(context).size.width < 600);
      double screenWidth = MediaQuery.of(context).size.width;
      return AlertDialog(
        scrollable: true,
        title: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: isMobile ? screenWidth * 0.9 : screenWidth * 0.5),
            child: SelectableText(
              data.title,
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
            )),
        content: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: isMobile ? screenWidth * 0.9 : screenWidth * 0.5,
              maxHeight: MediaQuery.of(context).size.height * 0.7),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SelectableText(data.description,
                    style: const TextStyle(fontSize: 18.0)),
                const SizedBox(
                  height: 12.0,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateFormat('dd MMM, yyyy | h:mm a').format(data.time),
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ))
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Done'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class NoticeList extends StatelessWidget {
  final bool isViewAll;
  const NoticeList({required this.isViewAll, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NoticeRepository().getNotices(isViewAll),
        builder: (context, AsyncSnapshot<List<NoticeModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data!;
            List<NoticeModel> homePageData = [];
            int end = (data.length <= 6) ? data.length : 6;
            for (int i = 0; i < end; i++) {
              homePageData.add(data[i]);
            }
            if (homePageData.isNotEmpty) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: homePageData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () => showNoticeDialog(context, data[index]),
                      title: Text(homePageData[index].title),
                      subtitle: Text(
                        homePageData[index].description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  });
            } else {
              return const Center(child: Text('No Notice Found!'));
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else {
            return const Center(
              child: Text('Some error occured'),
            );
          }
        });
  }
}
