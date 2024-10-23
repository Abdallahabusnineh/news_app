import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/edit_profile/data/datasourse/edit_your_profile_datasource.dart';
import 'package:news_app/src/edit_profile/data/repository/edit_your_profile_repository.dart';

final editProfileNotifierProvider =
ChangeNotifierProvider<EditProfileNotifier>((ref) {
  return EditProfileNotifier();
});


class EditProfileNotifier extends ChangeNotifier {
  EditProfileNotifier();

  EditProfileRepository editProfileRepository =
  EditProfileRepository(EditYourProfileDatasource());

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
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController countryIdController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> editProfile()  async {
    isLoading = true;
    try {
      final result = await editProfileRepository

          .editProfile(FormData.fromMap({
        'phone_number': phoneNumberController.text.trim(),
        'full_name': fullNameController.text,
        'country_id': countryIdController.text.trim(),
        'profile_photo':attachmentFile!=null? await MultipartFile.fromFile(attachmentFile!.path,
            filename: attachmentFile!.path):null,
        'bio': bioController.text,
        'website': websiteController.text
      }));
      result.fold((l) {
        isError = true;
        print('hi from left of form data $l');
      }, (r) {
        print(
            'hi from right of form data this is attachment $attachmentFile');
        isSuccess = true;
      });
    } catch (e) {
      isError = true;
    }
    isLoading = false;
  }

  Future<void> pickFile() async {
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
