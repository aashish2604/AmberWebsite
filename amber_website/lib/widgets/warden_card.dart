import 'package:amber_website/models/hec_members_model.dart';
import 'package:amber_website/models/warden_model.dart';
import 'package:amber_website/services/size_config.dart';
import 'package:amber_website/widgets/loading.dart';
import 'package:amber_website/widgets/network_image_error.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
    String errorImage =
        "https://firebasestorage.googleapis.com/v0/b/amberiitism.appspot.com/o/hec_members%2FAashish.png?alt=media&token=ab84535c-ec09-48d8-bc32-47120449b1b6";
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
                      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: isMobile() ? 50.0 : 70.0,
                        child: CachedNetworkImage(
                          imageUrl: widget.wardenModel.image.contains('https')
                              ? widget.wardenModel.image
                              : errorImage,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                              const Center(child: Loading()),
                          errorWidget: (context, url, error) {
                            print(error.toString());
                            try {
                              return const CachedNetworkImageError();
                            } on Exception catch (e) {
                              return const CachedNetworkImageError();
                            }
                          },
                        ),
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
