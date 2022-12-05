class HecMembersModel {
  String name;
  String email;
  String phoneNo;
  String committee;
  String image;
  String post;

  HecMembersModel(
      {required this.post,
      required this.image,
      required this.committee,
      required this.name,
      required this.email,
      required this.phoneNo});

  factory HecMembersModel.fromJson(Map<String, dynamic> json) {
    return HecMembersModel(
        name: json['name'],
        email: json['email'],
        phoneNo: json['phone_no'],
        committee: json['committee'],
        image: json['image_url'],
        post: json['post']);
  }
}
