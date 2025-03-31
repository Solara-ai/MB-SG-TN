// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryRequest _$CreateCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryRequest(
      categoryName: json['categoryName'] as String,
      categoryColor: json['categoryColor'] as String,
    );

Map<String, dynamic> _$CreateCategoryRequestToJson(
        CreateCategoryRequest instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
      'categoryColor': instance.categoryColor,
    };
