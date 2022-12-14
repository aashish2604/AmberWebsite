import 'package:amber_website/screens/hec_members.dart';
import 'package:amber_website/screens/leaving_form.dart';
import 'package:amber_website/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeAppbar extends StatefulWidget {
  const HomeAppbar({super.key});

  @override
  State<HomeAppbar> createState() => _HomeAppbarState();
}

class _HomeAppbarState extends State<HomeAppbar> {
  List<bool> _isHovering = [false, false];
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      color: kSmoothBlack,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Uri uri = Uri.parse('https://www.iitism.ac.in/iitismnew/');
                  launchUrl(uri);
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('images/ISM_logo.JPG'),
                  radius: 26.0,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onHover: (value) {
                setState(() {
                  _isHovering[0] = value;
                });
              },
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HecMembers()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Hec Members',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  const SizedBox(height: 5),
                  // For showing an underline on hover
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[0],
                    child: Container(
                      height: 2,
                      width: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            InkWell(
              onHover: (value) {
                setState(() {
                  _isHovering[1] = value;
                });
              },
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LeavingForm()));
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Leaving Form',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  const SizedBox(height: 5),
                  // For showing an underline on hover
                  Visibility(
                    maintainAnimation: true,
                    maintainState: true,
                    maintainSize: true,
                    visible: _isHovering[1],
                    child: Container(
                      height: 2,
                      width: 30,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
