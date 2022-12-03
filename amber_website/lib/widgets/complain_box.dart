import 'package:amber_website/services/size_config.dart';
import 'package:amber_website/widgets/sharp_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplainBox extends StatelessWidget {
  const ComplainBox({super.key});

  @override
  Widget build(BuildContext context) {
    String name, roomNo, admissionNo, emailAddress, message;
    final formKey = GlobalKey<FormState>();
    double width = SizeConfig.instance.screenWidth;
    final titleTextStyle = GoogleFonts.cinzel(fontSize: 34.0);
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
                  child:
                      TextButton(onPressed: () {}, child: const Text('Submit')),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
