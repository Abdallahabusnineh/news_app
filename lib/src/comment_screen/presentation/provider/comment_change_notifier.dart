import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/comment_screen/data/datasource/comment_datasource.dart';
import 'package:news_app/src/comment_screen/data/modules/comment_model.dart';
import 'package:news_app/src/comment_screen/data/repository/comment_repository.dart';

final commentChangeNotifierProvider =
    ChangeNotifierProvider<CommentChangeNotifier>(
        (ref) => CommentChangeNotifier());

class CommentChangeNotifier extends ChangeNotifier {
  CommentChangeNotifier();

  CommentRepository commentRepository = CommentRepository(CommentDatasource());
  List<GetCommentModel> comments = [];
  TextEditingController commentController = TextEditingController();
  TextEditingController editingCommentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  set isSuccess(bool value) {
    _isSuccess = value;
    notifyListeners();
  }

  bool _isError = false;

  bool get isError => _isError;

  set isError(bool value) {
    _isError = value;
    notifyListeners();
  }

  Future<void> getCommentByPostId(int postId) async {
    isLoading = true;
    comments = [];
    try {
      final result = await commentRepository.getCommentByPostId(postId);
      result.fold((l) {
        isError = true;
      }, (r) async {
        comments = r;
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> createComment(int postId) async {
    isLoading = true;
    try {
      final result = await commentRepository.createComment( postId ,commentController.text);
      result.fold((l) {
        isError = true;
      }, (r) async {
        isSuccess = true;
        getCommentByPostId(postId);
        commentController.clear();
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> editComment(int postId,int commentId) async {
    isLoading = true;
    try {
      final result = await commentRepository.editComment( postId ,editingCommentController.text,commentId);
      result.fold((l) {
        isError = true;
        print('left ${l.toString()}');

      }, (r) async {
        isSuccess = true;
        getCommentByPostId(postId);
        editingCommentController.clear();
      });
    } catch (e) {
      isError = true;
      print('catch ${e.toString()}');
    }
    isLoading = false;
  }
}
