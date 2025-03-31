import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:schedule_gen_and_time_management/domain/usecase/category/create_category_usecase.dart';
import 'package:schedule_gen_and_time_management/src/base/base_bloc.dart';

part 'bloc/page_action.dart';
part 'bloc/page_event.dart';
part 'bloc/page_state.dart';

class AddCategoryBloc extends BaseBloc<PageAction, PageEvent, PageState> {
  final CreateCategoryUsecase _createCategoryUsecase = GetIt.I<CreateCategoryUsecase>();
  AddCategoryBloc() : super(PageState()) {
    on<EventUserSelectedColor>(_handleEventUserSelectedColor);
    on<EventUserChangeCategoryName>(_handleEventUserChangeCategoryName);
    on<EventUserAddCategory>(_handleEventUserAddCategory);
  }

  Future<void> _handleEventUserSelectedColor(EventUserSelectedColor event, Emitter emit) async {
    emit(state.coppyWith(selectedColor: event.color));
  }

  Future<void> _handleEventUserChangeCategoryName(
      EventUserChangeCategoryName event, Emitter emit) async {
    emit(state.coppyWith(nameCategory: event.cateGoryName));
  }

  Future<void> _handleEventUserAddCategory(EventUserAddCategory event, Emitter emit) async {
    emit(state.coppyWith(showLoading: true));
    final result = await _createCategoryUsecase.call((
      categoryName: state.nameCategory,
      categoryColor: state.selectedColor.value.toRadixString(16).substring(2).toUpperCase()
    ));
    result.when(success: (data) {
        addAction(ActionAddCategorySuccess());
    }, failure: (error){
        addAction(ActionAddCategoryFaild(error: error.errorMessage));
    });
  }
}
