class User {
  String? fullname;
  String? email;
  String? password;
  String? gender;
  String? favorite;

  User({this.fullname, this.email, this.password, this.gender, this.favorite});

  User.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['email'] = email;
    data['password'] = password;
    data['gender'] = gender;
    data['favorite'] = favorite;
    return data;
  }
}
