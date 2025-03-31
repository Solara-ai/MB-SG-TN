import 'package:schedule_gen_and_time_management/data/dto/category_dto.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_category_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';

abstract class CategoryRepository {
  Future <Result<EmptyData?>> createCategory (CreateCategoryRequest param);
  Future <Result<List<CategoryDto>>> getListCategory ();
}