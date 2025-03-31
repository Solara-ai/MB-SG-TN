import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/data/source/network/request/create_category_request.dart';
import 'package:schedule_gen_and_time_management/data/source/network/response/empty_data.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/repository/category_repository.dart';

class CreateCategoryUsecase extends ResultUseCase<({String categoryName , String categoryColor}) , EmptyData?> {
    final CategoryRepository _categoryRepository = GetIt.I<CategoryRepository>();
    @override
  Future<Result<EmptyData?>> call(({String categoryColor, String categoryName}) input) {
      final _param = CreateCategoryRequest(categoryName: input.categoryName, categoryColor: input.categoryColor);
      return  _categoryRepository.createCategory(_param);
  }
}