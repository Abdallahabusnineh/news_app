
import 'package:news_app/src/edit_profile/domain/entites/edit_your_profile_entites.dart';

class EditProfileModel extends EditProfile {
  EditProfileModel({required super.bio,required super.name, required super.email, required super.type, required super.phone, required super.imageUri, required super.fullName, required super.countryId, required super.countryName});
  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      name: json['user_name']??'',
      email: json['email']??'',
      type: json['type']??'',
      phone: json['profile']['phone_number']??'',
      imageUri: json['profile']['image_uri']??'',
      fullName: json['profile']['full_name']??'',
      countryId: json['profile']['country_id']??'',
      countryName: json['profile']['country']['name']??'',
      bio: json['profile']['bio']??'',
    );
  }
}
