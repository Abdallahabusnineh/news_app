import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/shared/core/utils/show_toast.dart';
import 'package:news_app/src/create_news/data/datasource/create_new_post_datasource.dart';
import 'package:news_app/src/create_news/data/repository/create_new_post_repository.dart';
import 'package:news_app/src/main_screen/presentaion/screen/main_screen.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_notifer.dart';
final createPostNotiferProvider =
ChangeNotifierProvider<CreatePostNotifer>((ref) {
  return CreatePostNotifer();
});


class CreatePostNotifer extends ChangeNotifier {
  CreatePostNotifer();

  CreateNewPostRepository createNewPostRepository =
  CreateNewPostRepository(CreateNewPostDataSource());

int ?topicId;


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
  bool _isFilePicked = false;

  bool get isFilePicked => _isFilePicked;

  set isFilePicked(bool value) {
    _isFilePicked = value;
    notifyListeners();
  }

  File? attachmentFile;
  TextEditingController postTitleController = TextEditingController();
  TextEditingController postContentController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> createPost(BuildContext context)  async {
    isLoading = true;
    try {
      final result = await createNewPostRepository
          .createNewPost(FormData.fromMap({
        'topic_id':topicId,
        'title': postTitleController.text,
        'content': postContentController.text,
        'country_id': CountriesNotifier.selectedCountryId,
        'news_thumbnail': await MultipartFile.fromFile(attachmentFile!.path,
            filename: attachmentFile!.path),

      }));
      result.fold((l) {
        isError = true;
        showToast(text: 'Something went wrong', state: ToastState.ERROR);

        print('create post hi from left of form data $l');
      }, (r) {
        print(
            'create post hi from right of form data this is attachment $attachmentFile');
        isSuccess = true;
        showToast(text: 'Post created successfully', state: ToastState.SUCCESS);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
          return const MainScreen();
        }));
      });
    } catch (e) {
      isError = true;
      showToast(text: 'Something went wrong', state: ToastState.ERROR);

    }
    isLoading = false;
  }

  Future<void> pickPostFile() async {

    List<String> extensions = ['jpg', 'png', 'jpeg'];
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: extensions,
      type: FileType.custom,
    );
    if (result != null) {
      attachmentFile = File(result.files.first.path!);
      isFilePicked = true;
      print('file picked $attachmentFile');
    }
    else {
      // User canceled the picker
      print('no file selected');
    }

  }

}
