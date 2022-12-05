import 'package:amber_website/screens/view_all_notices.dart';
import 'package:amber_website/services/size_config.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/complain_box.dart';
import 'package:amber_website/widgets/empty_widget.dart';
import 'package:amber_website/widgets/footer.dart';
import 'package:amber_website/widgets/home_appbar.dart';
import 'package:amber_website/widgets/notice_List.dart';
import 'package:amber_website/widgets/sharp_container.dart';
import 'package:amber_website/widgets/warden_column.dart';
import 'package:flutter/material.dart';
import 'package:amber_website/screens/hec_members.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.instance.screenHeight;
    double width = SizeConfig.instance.screenWidth;
    String aboutUsDescription =
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of).";
    const contentTextStyle = TextStyle(fontSize: 18.0);

    return LayoutBuilder(builder: (context, constraints) {
      double constrainedHeight = constraints.maxHeight;
      double constrainedWidth = constraints.maxWidth;
      var screenSize = MediaQuery.of(context).size;
      return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const HomeAppbar()),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.orange,
                  height: (height * 0.4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 15.0),
                  child: SizedBox(
                    width: width,
                    child: SharpContainer(
                      padding: const EdgeInsets.symmetric(vertical: 30.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Notices',
                                    style: titleTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  SizedBox(
                                      width: width * 0.85,
                                      child: const Center(
                                          child: NoticeList(
                                        isViewAll: false,
                                      )))
                                ]),
                          ),
                          Positioned(
                              right: 20,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewAllNotices()));
                                  },
                                  child: const Text('View All',
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 60.0, bottom: 60.0, right: width * 0.05),
                    child: Row(
                      children: [
                        (constrainedWidth > 600)
                            ? Flexible(
                                flex: 4,
                                child: Container(
                                  color: Colors.black87,
                                  height: height * 0.2,
                                ))
                            : const EmptyWidget(),
                        (constrainedWidth > 600)
                            ? const Expanded(child: SizedBox())
                            : SizedBox(
                                width: width * 0.05,
                              ),
                        Flexible(
                          flex: 5,
                          child: Column(children: [
                            Text(
                              'About Us',
                              style: titleTextStyle,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              aboutUsDescription,
                              style: contentTextStyle,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  'Gallery',
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  color: Colors.red,
                  height: height * 0.4,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const ComplainBox(),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(
                  'Chief Wardern',
                  style: titleTextStyle,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const WardenColumn(),
                SizedBox(
                  height: height * 0.02,
                ),
                const Footer(),
              ],
            ),
          ));
    });
  }
}
