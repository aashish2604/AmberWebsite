import 'package:amber_website/services/theme/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = (width < 600);
    return Container(
      color: kSmoothBlack,
      // height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('images/ISM_logo.JPG'),
          ),
          SizedBox(
            width: width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: isMobile ? 18.0 : 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: isMobile ? 13.0 : 26.0,
                ),
                SelectableText(
                  'Some Long Address for the sake of understanding the ui behaviour soeidhse sehue seodh sehsoefb sefosehfhsie',
                  style: TextStyle(
                      color: Colors.white, fontSize: isMobile ? 10.0 : null),
                )
              ],
            ),
          ),
          SizedBox(
            width: width * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Follow Us',
                  style: TextStyle(
                    fontSize: isMobile ? 18.0 : 24.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: isMobile ? 13.0 : 26.0,
                ),
                SizedBox(
                  width: isMobile ? 50.0 : null,
                  child: Wrap(
                    direction: Axis.horizontal,
                    // mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.white,
                            size: isMobile ? 18.0 : null,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.instagram,
                              color: Colors.white,
                              size: isMobile ? 18.0 : null)),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mail,
                              color: Colors.white,
                              size: isMobile ? 18.0 : null)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
