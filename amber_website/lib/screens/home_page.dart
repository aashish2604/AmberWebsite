import 'package:amber_website/screens/view_all_notices.dart';
import 'package:amber_website/services/size_config.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/carousal.dart';
import 'package:amber_website/widgets/complain_box.dart';
import 'package:amber_website/widgets/empty_widget.dart';
import 'package:amber_website/widgets/footer.dart';
import 'package:amber_website/widgets/home_appbar.dart';
import 'package:amber_website/widgets/notice_List.dart';
import 'package:amber_website/widgets/sharp_container.dart';
import 'package:amber_website/widgets/warden_column.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:amber_website/screens/hec_members.dart';
import 'package:google_fonts/google_fonts.dart';

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
        "The Amber hostel is the second largest boys' hostel in the campus. With a capacity of around 1600 boys, it is home to the 2nd and 3rd year students of the institute. This four storeyed hostel building provides all kinds of facilities to students ranging from high speed Wi-fi and LAN to various kinds of indoor and outdoor games. A couple of canteens cater to the late-night snack needs of its residents, with two badminton courts available for their recreation. The hostel has a couple of canteens to cater to the late-night snack needs of the students, with a spacious cycle stand near the entrance.";
    const contentTextStyle = TextStyle(fontSize: 18.0);

    return LayoutBuilder(builder: (context, constraints) {
      double constrainedHeight = constraints.maxHeight;
      double constrainedWidth = constraints.maxWidth;
      double screenWidth = MediaQuery.of(context).size.width;
      var screenSize = MediaQuery.of(context).size;
      return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const HomeAppbar()),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: (height * 0.4),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/amber_dp.JPG'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      color: Colors.black38,
                      height: (height * 0.4),
                    ),
                    Positioned(
                        top: (height * 0.3),
                        left: 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultTextStyle(
                              style: GoogleFonts.fugazOne(
                                  fontSize: (screenWidth > 600) ? 50.0 : 40.0,
                                  color:
                                      const Color.fromARGB(255, 255, 222, 132)),
                              child: AnimatedTextKit(
                                repeatForever: true,
                                animatedTexts: [
                                  TypewriterAnimatedText('Amber Hostel',
                                      speed: const Duration(milliseconds: 100)),
                                  TypewriterAnimatedText("Senior Boys' Hostel",
                                      speed: const Duration(milliseconds: 100)),
                                ],
                              ),
                            ),
                            Text('IIT(ISM) Dhanbad',
                                style: GoogleFonts.fugazOne(
                                    fontSize: 25.0,
                                    color: const Color.fromARGB(
                                        255, 255, 222, 132)))
                          ],
                        ))
                  ],
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
                const SlidingCarousal(),
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
