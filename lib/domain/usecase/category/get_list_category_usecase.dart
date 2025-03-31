
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/data/source/network/helper/result.dart';
import 'package:schedule_gen_and_time_management/domain/base/result_usecase.dart';
import 'package:schedule_gen_and_time_management/domain/model/category.dart';
import 'package:schedule_gen_and_time_management/domain/repository/category_repository.dart';

class GetListCategoryUsecase extends ResultUseCase<() , List<Category>> {
  final CategoryRepository _categoryRepository = GetIt.I<CategoryRepository>();
    @override
  Future<Result<List<Category>>> call(() input) {
    return _categoryRepository.getListCategory().map((categorydto) => categorydto.map(Category.fromDto).toList());
  }
}