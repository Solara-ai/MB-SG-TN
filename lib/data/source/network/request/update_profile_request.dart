import 'package:json_annotation/json_annotation.dart';
part 'update_profile_request.g.dart';
@JsonSerializable()
class UpdateProfileRequest {
  final String fullName ; 
  final String phone ;
  final String birthday;
  final String gender;
  final String hobbies;
  final String password;
  final String occupation;

  UpdateProfileRequest({required this.fullName , required this.phone , required this.birthday , required this.gender, required this.hobbies , required this.occupation , required this.password});

  factory UpdateProfileRequest.fromJson(Map<String , dynamic> json) => _$UpdateProfileRequestFromJson(json);

  Map<String , dynamic> toJson () => _$UpdateProfileRequestToJson(this);
  
}