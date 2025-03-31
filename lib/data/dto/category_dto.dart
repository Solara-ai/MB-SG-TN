import 'package:json_annotation/json_annotation.dart';
part 'category_dto.g.dart';
@JsonSerializable()
class CategoryDto {
  final String categoryId ; 
  final String categoryName;
  final String categoryColor;

  CategoryDto({required this.categoryId , required this.categoryName , required this.categoryColor});
  factory CategoryDto.fromJson(Map<String , dynamic> json) => _$CategoryDtoFromJson(json );
  Map<String , dynamic> toJson () => _$CategoryDtoToJson(this);
}