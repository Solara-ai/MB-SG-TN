import 'package:schedule_gen_and_time_management/data/dto/category_dto.dart';
import 'package:schedule_gen_and_time_management/data/repository/base/base_network_repository.dart';
import 'package:schedule_gen_and_time_management/data/source/network/app_api.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_category_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/repository/category_repository.dart';

class CategoryRepositoryImpl extends BaseNetworkRepository implements CategoryRepository {
  final AppApi _api ;
  
  CategoryRepositoryImpl(this._api);

  @override
  Future<Result<EmptyData?>> createCategory(CreateCategoryRequest param) {
      return execute(_api.createCategory(param));
  }

  @override
  Future<Result<List<CategoryDto>>> getListCategory() {
    return execute(_api.getListCategory());
  }

}