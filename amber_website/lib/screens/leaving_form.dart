import 'package:amber_website/models/leaving_fom_model.dart';
import 'package:amber_website/repository/leaving_form_repo.dart';
import 'package:amber_website/services/pdf_creator.dart';
import 'package:amber_website/services/theme/app_theme.dart';
import 'package:amber_website/widgets/sharp_container.dart';
import 'package:flutter/material.dart';

class LeavingForm extends StatefulWidget {
  const LeavingForm({super.key});

  @override
  State<LeavingForm> createState() => _LeavingFormState();
}

class _LeavingFormState extends State<LeavingForm> {
  final formkey = GlobalKey<FormState>();
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 600;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
              key: formkey,
              child: Center(
                child: SizedBox(
                  width: isMobile ? width : width * 0.6,
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
                              LeavingFormModel formModel = LeavingFormModel(
                                  roomNo: roomNo,
                                  name: name,
                                  address: address,
                                  admissionNo: admissionNo,
                                  semester: semester,
                                  course: course,
                                  branch: branch,
                                  leaveDate: leaveDate,
                                  returndate: returndate,
                                  vacation: vacation,
                                  phoneNo: phoneNo,
                                  otherRemarks: otherRemarks);
                              await showDialog(
                                  context: context,
                                  builder: (_) {
                                    bool isMobile =
                                        (MediaQuery.of(context).size.width <
                                            600);
                                    double screenWidth =
                                        MediaQuery.of(context).size.width;
                                    LeavingFormRepository()
                                        .uploadForm(formModel)
                                        .then((value) {
                                      setState(() async {
                                        Navigator.of(context).pop();
                                        if (value) {
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
                                                  otherRemarks)
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        }
                                      });
                                    });
                                    return AlertDialog(
                                        scrollable: false,
                                        title: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                maxWidth: isMobile
                                                    ? screenWidth * 0.9
                                                    : screenWidth * 0.5),
                                            child: const Text('Uploading')),
                                        content: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              maxWidth: isMobile
                                                  ? screenWidth * 0.9
                                                  : screenWidth * 0.5,
                                              maxHeight: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.2),
                                          child: const Center(
                                              child: Text('Please wait.....')),
                                        ));
                                  });
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
