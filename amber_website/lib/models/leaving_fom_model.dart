class LeavingFormModel {
  String roomNo;
  String name;
  String address;
  String admissionNo;
  String semester;
  String course;
  String branch;
  String leaveDate;
  String returndate;
  String vacation;
  String phoneNo;
  String otherRemarks;

  LeavingFormModel({
    required this.roomNo,
    required this.name,
    required this.address,
    required this.admissionNo,
    required this.semester,
    required this.course,
    required this.branch,
    required this.leaveDate,
    required this.returndate,
    required this.vacation,
    required this.phoneNo,
    required this.otherRemarks,
  });

  Map<String, dynamic> toJson() => {
        'room_no': roomNo,
        'name': name,
        'address': address,
        'admission_no': admissionNo,
        'semester': semester,
        'course': course,
        'branch': branch,
        'leaving_date': leaveDate,
        'returning_date': returndate,
        'vacation': vacation,
        'phone_no': phoneNo,
        'other_remarks': otherRemarks
      };
}
