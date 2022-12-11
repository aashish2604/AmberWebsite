import 'package:amber_website/models/hec_members_model.dart';
import 'package:amber_website/widgets/loading.dart';
import 'package:amber_website/widgets/network_image_error.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MemberCard extends StatefulWidget {
  final HecMembersModel hecMembersModel;
  const MemberCard({required this.hecMembersModel, super.key});

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
    double width = MediaQuery.of(context).size.width;
    String errorImage =
        "https://user-images.githubusercontent.com/24841626/43708951-e86d62b2-996b-11e8-9d2c-ee2599db49e7.png";

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
                        image: AssetImage('images/card_background.JPG'),
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
                          imageUrl:
                              widget.hecMembersModel.image.contains('https')
                                  ? widget.hecMembersModel.image
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
                      widget.hecMembersModel.name,
                      style: nameStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.hecMembersModel.post,
                      style: subtitleStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(),
                    iconText(Icons.phone, widget.hecMembersModel.phoneNo),
                    iconText(Icons.email, widget.hecMembersModel.email),
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
