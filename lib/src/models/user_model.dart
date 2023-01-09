import 'dart:ffi';

class UserModel {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phone,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      id: map['id'],
      name: map['fullname'],
      email: map['email'],
      phone: map['phone'],
      token: map['token'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "cpf": cpf,
      "id": id,
      "fullname": name,
      "email": email,
      "phone": phone,
      "token": token,
      "password": password,
    };
  }

  @override
  String toString() {
    return "$name | $cpf";
  }
}
