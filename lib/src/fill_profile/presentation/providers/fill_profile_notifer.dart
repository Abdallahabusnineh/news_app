import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/src/fill_profile/data/datasourse/fill_your_profile_datasource.dart';
import 'package:news_app/src/fill_profile/data/repository/fill_your_profile_repository.dart';
import 'package:news_app/src/select_country/presentation/providers/countries_notifer.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer.dart';
import 'package:news_app/src/topics/presentation/providers/topics_notifer_test.dart';
//.split('/').last
final createProfileNotifierProvider =
ChangeNotifierProvider<CreateProfileNotifier>((ref) {
  return CreateProfileNotifier();
});


class CreateProfileNotifier extends ChangeNotifier {
  CreateProfileNotifier();

  CreateProfileRepository createProfileRepository =
      CreateProfileRepository(CreateYourProfileDataSource());

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
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> createProfile()  async {
    isLoading = true;
    FormData formData;
    try {
      final result = await createProfileRepository
          .createProfile(formData = FormData.fromMap({
        'full_name': fullNameController.text,
        'phone_number': phoneNumberController.text,
        'country_id': CountriesNotifier.selectedCountryId,

        'topics:': TopicsNotifier.selectedTopics.toString().replaceAll(
            '[', '').replaceAll(']', ''),
        /* why the result of send always is last index ????????
        'topics:': [1,2]
        */'profile_photo': await MultipartFile.fromFile(attachmentFile!.path,
            filename: attachmentFile!.path),

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
