import 'package:news_app/src/comment_screen/domain/entities/edit_comment_entites.dart';

class EditCommentModel extends EditCommentEntites {
  EditCommentModel(
      {required super.commentId,
      required super.userId,
      required super.newsId,
      required super.commentContent,
      required super.createdAt,
      required super.userName,
      required super.userImageUri});

  factory EditCommentModel.fromJson(Map<String, dynamic> json) {
    return EditCommentModel(
      commentId: json['id'],
      userId: json['user_id'],
      newsId: json['news_id'],
      commentContent: json['content'],
      createdAt: json['created_at'],
      userName: json['user']['user_name'],
      userImageUri: json['user']['profile']['image_uri'],
    );
  }
}
