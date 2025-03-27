import 'package:schedule_gen_and_time_management/data/dto/user_profile_dto.dart';

class UserProfile {
  final String id ; 
  final String email;
  final String fullName;
  final String phone;
  final String birthday;
  final String gender;
  final String hobbies;
  final String occupation;

  UserProfile({required this.id , required this.email , required this.fullName , required this.phone , required this.birthday , required this.gender, required this.hobbies , required this.occupation});

  factory UserProfile.fromDto (UserProfileDto dto ) => UserProfile(id: dto.id, email: dto.email, fullName: dto.fullName, phone: dto.phone, birthday: dto.birthday, gender: dto.gender, hobbies: dto.hobbies, occupation: dto.occupation);
}