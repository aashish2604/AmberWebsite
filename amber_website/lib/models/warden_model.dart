class WardenModel {
  String name;
  String email;
  String phoneNo;
  bool isCheifWarden;
  String image;

  WardenModel(
      {required this.image,
      required this.isCheifWarden,
      required this.name,
      required this.email,
      required this.phoneNo});

  factory WardenModel.fromJson(Map<String, dynamic> json) {
    return WardenModel(
      name: json['name'],
      email: json['email'],
      phoneNo: json['phone_no'],
      isCheifWarden: json['is_chief'],
      image: json['image_url'],
    );
  }
}
