import 'package:json_annotation/json_annotation.dart';
part 'create_category_request.g.dart';
@JsonSerializable()
class CreateCategoryRequest {
  final String categoryName ;
  final String categoryColor;

  CreateCategoryRequest({required this.categoryName , required this.categoryColor});

  factory CreateCategoryRequest.fromJson (Map<String , dynamic> json) => _$CreateCategoryRequestFromJson (json);

  Map<String , dynamic> toJson () => _$CreateCategoryRequestToJson(this);
}