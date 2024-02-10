class Admin {


  int? admin_id;
  String? username;
  String? email;
  String? password;

  Admin (
    this.admin_id,
    this.username,
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => {
    'admin_id': admin_id.toString(),
    'username': username.toString(),
    'email': email.toString(),
    'password': password.toString()

  };

}