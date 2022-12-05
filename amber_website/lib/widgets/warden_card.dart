import 'package:amber_website/models/hec_members_model.dart';
import 'package:amber_website/models/warden_model.dart';
import 'package:amber_website/services/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WardenCard extends StatefulWidget {
  final WardenModel wardenModel;
  const WardenCard({required this.wardenModel, super.key});

  @override
  State<WardenCard> createState() => _WardenCardState();
}

class _WardenCardState extends State<WardenCard> {
  @override
  Widget build(BuildContext context) {
    const TextStyle nameStyle =
        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600);
    const TextStyle cardTitleStyle = TextStyle(fontSize: 14.0);
    const TextStyle subtitleStyle =
        TextStyle(fontSize: 18.0, color: Colors.grey);
    double width = MediaQuery.of(context).size.width;

    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile() {
        return (constraints.maxWidth < 600);
      }

      Row iconText(IconData icon, String content) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            Flexible(
              child: Container(
                child: SelectableText(
                  " :  $content",
                  style: cardTitleStyle,
                ),
              ),
            )
          ],
        );
      }

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile() ? 16 : 0),
        child: Container(
          width: isMobile() ? width : width * 0.3,
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
                    Text(
                      widget.wardenModel.name,
                      style: nameStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(),
                    iconText(Icons.phone, widget.wardenModel.phoneNo),
                    iconText(Icons.email, widget.wardenModel.email),
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
