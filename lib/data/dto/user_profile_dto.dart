import 'package:json_annotation/json_annotation.dart';
part'user_profile_dto.g.dart';
@JsonSerializable()
class UserProfileDto {
  final String id ;
  final String email;
  final String fullName;
  final String phone;
  final String birthday;
  final String gender;
  final String hobbies;
  final String occupation;

  UserProfileDto ({required this.id , required this.email , required this.fullName , required this.phone , required this.birthday , required this.gender , required this.hobbies , required this.occupation});

  factory UserProfileDto.fromJson (Map<String , dynamic> json) => _$UserProfileDtoFromJson(json);
  Map<String , dynamic> toJson () => _$UserProfileDtoToJson(this);
}