import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/notice_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ViewAllNotices extends StatelessWidget {
  const ViewAllNotices({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          width: (width > 600) ? width * 0.7 : width,
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'All Notices',
                style: titleTextStyle,
              ),
              const SizedBox(
                height: 20.0,
              ),
              const NoticeList(
                isViewAll: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
