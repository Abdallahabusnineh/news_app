import 'package:news_app/src/new_sources/domain/entites/your_following_entites.dart';

class YourFollowingModels  extends YourFollowingEntities{
  YourFollowingModels({required super.id, required super.uesername, required super.email});

  factory YourFollowingModels.fromJson(Map<String, dynamic> json) {
    return YourFollowingModels(
      id: json['id'],
      uesername: json['user_name'],
      email: json['email'],
    );
  }

}