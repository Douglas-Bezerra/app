class Users {
  String email;
  String password;

  Users({
    required this.email, 
    required this.password
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(email: json['email'], password: json['password']);

  get id => null;

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}