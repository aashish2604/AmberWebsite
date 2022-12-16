import 'package:amber_website/services/pdf_creator.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/sharp_container.dart';
import 'package:flutter/material.dart';

class LeavingForm extends StatelessWidget {
  const LeavingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    late String roomNo,
        name,
        address,
        admissionNo,
        semester,
        course,
        branch,
        leaveDate,
        returndate,
        vacation,
        phoneNo;
    String otherRemarks = '';
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
              key: formkey,
              child: Center(
                child: SizedBox(
                  width: width * 0.6,
                  child: SharpContainer(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: 30.0),
                    child: Column(children: [
                      Text(
                        'Fill the details',
                        style: titleTextStyle,
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
                        decoration: const InputDecoration(labelText: 'Name'),
                        onChanged: (value) {
                          name = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration:
                            const InputDecoration(labelText: 'Admission No'),
                        onChanged: (value) {
                          admissionNo = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration:
                            const InputDecoration(labelText: 'Semester'),
                        onChanged: (value) {
                          semester = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration: const InputDecoration(labelText: 'Course'),
                        onChanged: (value) {
                          course = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration: const InputDecoration(labelText: 'Branch'),
                        onChanged: (value) {
                          branch = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration: const InputDecoration(
                            labelText: 'Date and time of leaving'),
                        onChanged: (value) {
                          leaveDate = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration: const InputDecoration(
                            labelText: 'Expected Date and time of return'),
                        onChanged: (value) {
                          returndate = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration: const InputDecoration(
                            labelText:
                                'Vacation(Summer/Winter)/Semester Break'),
                        onChanged: (value) {
                          vacation = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration:
                            const InputDecoration(labelText: 'Full Address'),
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? 'This is a required field' : null,
                        decoration:
                            const InputDecoration(labelText: 'Phone No'),
                        onChanged: (value) {
                          phoneNo = value;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Any other remarks'),
                        onChanged: (value) {
                          otherRemarks = value;
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      TextButton(
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await createPdf(
                                  roomNo,
                                  name,
                                  address,
                                  admissionNo,
                                  semester,
                                  course,
                                  branch,
                                  leaveDate,
                                  returndate,
                                  vacation,
                                  phoneNo,
                                  otherRemarks);
                            }
                          },
                          child: const Text('Submit')),
                      const SizedBox(
                        height: 20.0,
                      )
                    ]),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
