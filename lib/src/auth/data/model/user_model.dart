import 'package:news_app/src/auth/domain/entites/user_entites.dart';

class UserModel extends User {
  UserModel(
      {required super.token,
      required super.id,
      required super.username,
      required super.email,
      required super.type});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'],
      id: json['user']['id'],
      username: json['user']['user_name'],
      email: json['user']['email'],
      type: json['user']['type'],
    );
  }
/*  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'type': type,
      'token': token,
    };
  }*/
}
