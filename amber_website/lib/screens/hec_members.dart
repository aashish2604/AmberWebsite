import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/member_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HecMembers extends StatelessWidget {
  const HecMembers({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle subHeadingTextStyle = GoogleFonts.oswald(fontSize: 28.0);
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'Hec Members',
          style: titleTextStyle,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          'President',
          style: subHeadingTextStyle,
        ),
        const SizedBox(
          height: 12.0,
        ),
        const MemberCard(),
        Row(),
        Text('Mess Committee', style: subHeadingTextStyle),
        const SizedBox(
          height: 12.0,
        ),
        Text('Technical Committee', style: subHeadingTextStyle),
        const SizedBox(
          height: 12.0,
        ),
        Text('Maintainence Committee', style: subHeadingTextStyle),
        const SizedBox(
          height: 12.0,
        ),
      ]),
    );
  }
}
