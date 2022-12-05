import 'package:amber_website/models/warden_model.dart';
import 'package:amber_website/repository/warden_repository.dart';
import 'package:amber_website/services/size_config.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/empty_widget.dart';
import 'package:amber_website/widgets/warden_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WardenColumn extends StatelessWidget {
  const WardenColumn({super.key});

  @override
  Widget build(BuildContext context) {
    double height = SizeConfig.instance.screenHeight;
    return FutureBuilder(
        future: WardenRepository().getWardens(),
        builder: (context, AsyncSnapshot<List<WardenModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<WardenModel> data = snapshot.data!;
            WardenModel? chiefWardenData;
            List<WardenModel> otherWardenData = [];
            for (var d in data) {
              if (d.isCheifWarden) {
                chiefWardenData = d;
              } else {
                otherWardenData.add(d);
              }
            }
            if (data.isNotEmpty) {
              return Column(
                children: [
                  WardenCard(wardenModel: chiefWardenData!),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Text(
                    'Wardens',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  LayoutBuilder(builder: (context, constraints) {
                    final SliverGridDelegateWithFixedCrossAxisCount gridOption =
                        (constraints.maxWidth > 600)
                            ? const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisExtent: 300.0,
                                crossAxisCount: 3,
                                crossAxisSpacing: 30.0,
                                mainAxisSpacing: 30.0)
                            : const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisExtent: 300.0,
                                mainAxisSpacing: 12.0);
                    return (otherWardenData.isNotEmpty)
                        ? GridView.builder(
                            shrinkWrap: true,
                            itemCount: otherWardenData.length,
                            gridDelegate: gridOption,
                            itemBuilder: (context, index) {
                              return WardenCard(
                                  wardenModel: otherWardenData[index]);
                            })
                        : const EmptyWidget();
                  })
                ],
              );
            } else {
              return const Center(
                child: Text('No Data found'),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        });
  }
}
