import 'package:amber_website/repository/complain_repo.dart';
import 'package:amber_website/services/size_config.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/sharp_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showMyDialog(
    BuildContext context, String title, String body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(body, style: const TextStyle(fontSize: 18.0)),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class ComplainBox extends StatelessWidget {
  const ComplainBox({super.key});

  @override
  Widget build(BuildContext context) {
    String? name, roomNo, admissionNo, emailAddress, message;
    final formKey = GlobalKey<FormState>();
    double width = SizeConfig.instance.screenWidth;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: Center(
          child: SizedBox(
            width: width,
            child: SharpContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05, vertical: 30.0),
              child: Column(children: [
                Text(
                  'Register Complain',
                  style: titleTextStyle,
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'This is a required field' : null,
                  decoration: const InputDecoration(labelText: 'Name'),
                  onChanged: (value) {
                    name = value;
                  },
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'This is a required field' : null,
                  decoration: const InputDecoration(labelText: 'Admission No'),
                  onChanged: (value) {
                    admissionNo = value;
                  },
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'This is a required field' : null,
                  decoration: const InputDecoration(labelText: 'Room No'),
                  onChanged: (value) {
                    roomNo = value;
                  },
                ),
                TextFormField(
                  validator: (val) =>
                      val!.isEmpty ? 'This is a required field' : null,
                  decoration: const InputDecoration(labelText: 'Email Address'),
                  onChanged: (value) {
                    emailAddress = value;
                  },
                ),
                TextFormField(
                  maxLines: 8,
                  validator: (val) =>
                      val!.isEmpty ? 'This is a required field' : null,
                  decoration: const InputDecoration(labelText: 'Message'),
                  onChanged: (value) {
                    message = value;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: TextButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          showDialog(
                              context: context,
                              builder: (context) => Center(
                                    child: Container(
                                        padding: const EdgeInsets.all(20.0),
                                        color: Colors.white,
                                        child:
                                            const CircularProgressIndicator()),
                                  ));
                          await ComplainRepository()
                              .uploadComplain(
                                  name: name!,
                                  admissionNo: admissionNo!,
                                  roomNo: roomNo!,
                                  email: emailAddress!,
                                  message: message!)
                              .then((value) {
                            Navigator.of(context).pop();
                            return showMyDialog(
                                context,
                                'Complain Registered Successfully',
                                'The complain will be addressed soon. If the problem still persist then contact any of the Wardens or Hec Members');
                          });
                        }
                      },
                      child: const Text('Submit')),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
