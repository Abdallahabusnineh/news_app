import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {

  final String message;
  final String title;


  const ErrorMessageModel({

    required this.title,
    required this.message,
  });

  factory ErrorMessageModel.fromJson(
          String message, String title, bool isFailure) =>
      ErrorMessageModel(
        message: message,
        title: title,

      );

  @override
  List<Object?> get props => [message, title];
}
