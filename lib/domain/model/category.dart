import 'package:schedule_gen_and_time_management/data/dto/category_dto.dart';
import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

class Category extends DropDownFormFieldItem {
  final String categoryId;
  final String categoryName;
  final String categoryColor;

  Category ({required this.categoryId , required this.categoryName , required this.categoryColor}) : super (value: categoryId , displayValue: categoryName );

  factory Category.fromDto(CategoryDto dto) => Category(categoryId: dto.categoryId, categoryName: dto.categoryName, categoryColor: dto.categoryColor);

  @override
  String get value => categoryId;

  @override
  String get displayValue => categoryName;
}