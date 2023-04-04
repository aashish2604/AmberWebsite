import 'package:amber_website/models/hec_members_model.dart';
import 'package:amber_website/repository/hec_members_repo.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/empty_widget.dart';
import 'package:amber_website/widgets/loading.dart';
import 'package:amber_website/widgets/member_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HecMembers extends StatelessWidget {
  const HecMembers({super.key});

  @override
  Widget build(BuildContext context) {
    List<HecMembersModel> messCommittee = [];
    List<HecMembersModel> techCommittee = [];
    List<HecMembersModel> maintainenceCommittee = [];
    List<HecMembersModel> sportsCommittee = [];
    HecMembersModel? presidentData;
    final TextStyle subHeadingTextStyle = GoogleFonts.oswald(fontSize: 28.0);
    double width = MediaQuery.of(context).size.width;

    void sortCommittes(List<HecMembersModel> inputData) {
      for (var data in inputData) {
        if (data.post == 'President') {
          presidentData = data;
        }
        if (data.committee == 'Mess') {
          messCommittee.add(data);
        } else if (data.committee == 'Technical') {
          techCommittee.add(data);
        } else if (data.committee == 'Maintenance') {
          maintainenceCommittee.add(data);
        } else if (data.committee == 'Sports & Cultural') {
          sportsCommittee.add(data);
        }
      }
    }

    return Scaffold(
      body: FutureBuilder(
          future: HecMembersRepository().getMemberData(),
          builder: (context, AsyncSnapshot<List<HecMembersModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<HecMembersModel> data = snapshot.data!;
              sortCommittes(data);
              if (data.isNotEmpty && presidentData != null) {
                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                          height: 20.0,
                        ),
                        MemberCard(
                          hecMembersModel: presidentData!,
                        ),
                        const SizedBox(
                          height: 26.0,
                        ),
                        Text('Mess Committee', style: subHeadingTextStyle),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MemberList(data: messCommittee),
                        const SizedBox(
                          height: 26.0,
                        ),
                        Text('Technical Committee', style: subHeadingTextStyle),
                        const SizedBox(
                          height: 20.0,
                        ),
                        (width > 600)
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MemberCard(hecMembersModel: techCommittee[1]),
                                  MemberCard(hecMembersModel: techCommittee[0]),
                                ],
                              )
                            : MemberList(data: techCommittee),
                        // : MemberList(data: techCommittee),
                        const SizedBox(
                          height: 26.0,
                        ),
                        Text('Maintenance Committee',
                            style: subHeadingTextStyle),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MemberList(data: maintainenceCommittee),
                        const SizedBox(
                          height: 26.0,
                        ),
                        Text('Sports & Cultural Committee',
                            style: subHeadingTextStyle),
                        const SizedBox(
                          height: 20.0,
                        ),
                        MemberList(data: sportsCommittee),
                        const SizedBox(
                          height: 40.0,
                        ),
                      ]),
                );
              } else {
                return const Center(
                  child: Text('No data found'),
                );
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Loading();
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          }),
    );
  }
}

class MemberList extends StatelessWidget {
  final List<HecMembersModel> data;
  const MemberList({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    int secretaryIndex =
        data.indexWhere((element) => element.post == 'Secretary');
    HecMembersModel secretaryData = data[secretaryIndex];
    data.remove(secretaryData);
    data.insert(0, secretaryData);
    return LayoutBuilder(builder: (context, constraints) {
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
      return (data.isNotEmpty)
          ? GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate: gridOption,
              itemBuilder: (context, index) {
                return MemberCard(hecMembersModel: data[index]);
              })
          : const EmptyWidget();
    });
  }
}
