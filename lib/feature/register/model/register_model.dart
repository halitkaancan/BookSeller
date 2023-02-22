class RegisterModel {
  String? email;
  String? name;
  String? password;

  RegisterModel({this.email, this.name, this.password});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['password'] = this.password;
    return data;
  }
}
