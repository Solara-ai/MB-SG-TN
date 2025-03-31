import 'package:schedule_gen_and_time_management/src/widgets/text_field/drop_down_form_field.dart';

extension DropDownControllerExtension<T extends DropDownFormFieldItem> on DropDownController<T> {
  void updateItemList(List<T> newList) {
    itemList.clear();
    itemList.addAll(newList);
    notifyListeners(); // Thêm notifyListeners để cập nhật UI khi danh sách thay đổi
  }
}