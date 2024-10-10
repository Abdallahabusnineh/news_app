import 'package:news_app/src/new_sources/domain/entites/new_source_entites.dart';

class NewSourceModel extends NewSource {
  NewSourceModel({required super.userName, required super.id, required super.isFollowed});

  factory NewSourceModel.fromJson(Map<String, dynamic> json) {
    return NewSourceModel(
      userName: json['user_name'],
      id: json['id'],
      isFollowed: json['is_followed']??false,
    );
  }
}