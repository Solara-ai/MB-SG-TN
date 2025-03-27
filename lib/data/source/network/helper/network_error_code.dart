
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
// Enum NetworkErrorCode được sử dụng để định nghĩa các mã lỗi có thể xảy ra trong ứng dụng khi call API . 
enum NetworkErrorCode {
    UNKNOW('UNKNOW') ,
    REFRESH_TOKEN_INVALID('MSG1401', isGlobalError: true),
    // refesh token 
    USER_NOT_FOUND('SB01'), 
    // Người dùng không được tìm thấy trong hệ thống , có thể là do tài khoản không hợp lệ 
    PASSCODES_NOT_MATCH('MSG1102'),
    //  Mã xác thực (passcode) không khớp. Lỗi này có thể xảy ra khi người dùng nhập sai mã OTP hoặc mật khẩu xác thực.
    RESET_PASSWORD_OTP_CODE_INVALID_OR_EXPIRED('MSG1301'),
    // Lỗi này xuất hiện khi người dùng nhập mã OTP sai hoặc mã OTP đã hết hạn sau một khoảng thời gian nhất định.
    EMAIL_HAS_BEEN_REGISTED('MSG1103'),
    // email đã được đăng ký
    INVALID_EMAIL_FORMAT('MSG1104'),
    // không đúng định dạng của email
    NOT_FOUND('NOT_FOUND');
    const NetworkErrorCode(this.errorCode , {this.isGlobalError = false});
    final String errorCode; 
    final bool isGlobalError;
    factory NetworkErrorCode.fromcode(String errorCode) => NetworkErrorCode.values.firstWhereOrNull((element)=> element.errorCode == errorCode) ?? UNKNOW;

    static String getErrorMessage (String errorCode , String serverErrorMessage) {
        final networkErrorCode = NetworkErrorCode.fromcode(errorCode);
        return switch (networkErrorCode) {
            UNKNOW => kDebugMode ? 'Please define $errorCode in NetworkErrorCode class!' : '$errorCode: $serverErrorMessage',
            // kDbugMode được sử dụng để kiểm tra xem ứng dụng có đang chạy ở chế độ debug hay không . 
            REFRESH_TOKEN_INVALID => 'Session expired', 
            USER_NOT_FOUND => 'Invalid account',
            PASSCODES_NOT_MATCH => 'Wrong password', 
            RESET_PASSWORD_OTP_CODE_INVALID_OR_EXPIRED => 'You have entered the wrong OTP code',
            EMAIL_HAS_BEEN_REGISTED => 'Email has been registered',
            INVALID_EMAIL_FORMAT => 'Incorrect email format',
            NOT_FOUND => 'Password or email not match'
        };
    }
}