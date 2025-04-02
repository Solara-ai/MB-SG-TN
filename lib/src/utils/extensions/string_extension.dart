extension StringExtension on String {
  // sử dụng để kiểm tra tính hợp lệ của email , bao gồm các chữ cái viết hoa , viết thường và Cho phép chữ cái, số, dấu . và các ký tự đặc biệt hợp lệ trước @ , Sau @ phải là chữ cái hoặc số (tên miền) , Sau dấu . chỉ chứa chữ cái (ví dụ: .com, .vn)
  bool get isValidEmail {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);
  }
  // sử dụng để thay thế những ký tự không phải là số thành rỗng , ví dụ là các chữ . 
  String toDigitalString() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }
  
  bool containsSlashOrPipe() {
    return contains('/') || contains('|');
  }
  // Được sử dụng để loại bỏ khoảng trắng thừa giữa các ký tự và chỉ giữ lại 1 khoảng trắng duy nhất .
  String trimBetween() {
    return replaceAll(RegExp('\\s+'), ' ');
  }
  // chuyển ký tự đầu thành chữ hoa và các ký tự sau đó đều là chữ thường . 
  String toCapitalized() {
    return length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  }
  // chuyển đổi chuỗi có dấu gạch ngang thành khoảng trắng 
  String removeUnderscore({String withSymbol = ' '}) {
    return replaceAll(RegExp(r'_'), withSymbol);
  }
  // chuyển đổi từ một chuỗi thành dạng viết hoa chữ cái đầu của mỗi từ , cụ thể đó chính là thay thế một chuỗi có nhiều khoảng trắng liên tiếp thành một khoảng trắng duy nhất , sau đó chia chuỗi đó ra thành 1 list các từ ví dụ String text sẽ là [String, text] , cuối cùng là sử dụng hàm map để có thể gộp chữ lại .
  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalized()).join(' ');
  }
  // Loại bỏ các ký tự không hợp lệ khỏi chuỗi để sử dụng làm tên tệp.
  String toFileName() {
    return replaceAll(RegExp('[^A-Za-z0-9._]'), '');
  }
  // Tách các từ trong PascalCase bằng khoảng trắng và viết hoa chữ cái đầu , ví dụ HelloWord => Hello Word
  String pascalCaseToTitleCase() {
    return replaceAllMapped(RegExp(r'[A-Z]'), (Match m) => ' ${m[0]}').trim();
  }
  //  Định dạng chuỗi theo kiểu snake_case.
  String get toSnakeCase {
    return replaceAllMapped(
      RegExp(r'(.)([A-Z])'),
      (Match match) => '${match.group(1)}_${match.group(2)}',
    );
  }
}
// được sử dụng để kiểm tra xem một chuỗi có rỗng hoặc null hay không nếu trả về true thì là đúng , còn nếu false thì là sai .
extension OtpionalStringExtension on String? {
  bool isNullOrEmpty() {
    return this?.trim().isEmpty != false ;
  }
 // được sử dụng để kiểm tra xem chuỗi có bắt đầu bằng http hay không , nếu là true thì là đúng còn nếu là false thì là sai .
  bool get isURLType => this!.startsWith('http');
}
