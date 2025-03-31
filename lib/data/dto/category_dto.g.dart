// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      categoryId: json['categoryId'] as String,
      categoryName: json['categoryName'] as String,
      categoryColor: json['categoryColor'] as String,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryColor': instance.categoryColor,
    };
