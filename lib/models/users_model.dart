class UsersModel {
  String email;
  String password;

  UsersModel({
    required this.email, 
    required this.password
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(email: json['email'], password: json['password']);

  get id => null;

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}