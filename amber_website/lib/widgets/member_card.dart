import 'package:amber_website/services/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MemberCard extends StatefulWidget {
  const MemberCard({super.key});

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  @override
  Widget build(BuildContext context) {
    const TextStyle nameStyle =
        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600);
    const TextStyle cardTitleStyle = TextStyle(fontSize: 14.0);
    const TextStyle subtitleStyle =
        TextStyle(fontSize: 18.0, color: Colors.grey);
    double width = SizeConfig.instance.screenWidth;

    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile() {
        return (constraints.maxWidth < 600);
      }

      Row iconText(IconData icon, String content) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Text(
              " :  $content",
              style: cardTitleStyle,
            )
          ],
        );
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile() ? 16 : 0),
        child: Container(
          width: isMobile() ? width : width * 0.6,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                blurRadius: 10.0, spreadRadius: 1.0, color: Colors.black12),
          ]),
          child: Stack(
            children: [
              Container(
                height: isMobile() ? 72.0 : 92.0,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/card_background.jpg'),
                        fit: BoxFit.fill)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: isMobile() ? 52.0 : 72.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: isMobile() ? 50.0 : 70.0,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      'Sample Name',
                      style: nameStyle,
                    ),
                    const Text(
                      'Sample Post',
                      style: subtitleStyle,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(),
                    iconText(Icons.phone, '9199892122'),
                    iconText(Icons.email, 'some@email.com'),
                    const SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
