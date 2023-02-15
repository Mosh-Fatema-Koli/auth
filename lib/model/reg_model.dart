class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? lastLogin;

  User(
      {this.id, this.name, this.email, this.password, this.lastLogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    lastLogin = json['last_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['last_login'] = this.lastLogin;
    return data;
  }
}