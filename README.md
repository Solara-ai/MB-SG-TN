📌 Hướng Dẫn Setup Dự Án Flutter
🛠️ 1. Cài đặt các công cụ cần thiết
Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt:

Flutter SDK (phiên bản mới nhất) - Tải Flutter
Dart SDK (được cài cùng với Flutter)
Android Studio hoặc VS Code (tùy chọn, để code & debug)
Xcode (nếu chạy trên macOS để build iOS)
🔄 2. Các bước setup sau khi pull code về
2.1. Clone repository

Nếu bạn chưa clone repository, hãy chạy lệnh sau:
git clone https://github.com/your-username/schedule-time-management.git
cd schedule-time-management

Nếu bạn đã có repo nhưng cần cập nhật code mới nhất:
git pull origin main

2.2. Cài đặt dependencies
Sau khi pull code về, cần tải các gói thư viện để đảm bảo dự án hoạt động đúng.
flutter pub get

2.3. Chạy lệnh để đảm bảo Flutter hoạt động tốt
Chạy lệnh sau để kiểm tra môi trường Flutter:
flutter doctor
Nếu có lỗi, Flutter sẽ hiển thị thông báo để bạn xử lý.

🚀 3. Chạy ứng dụng
3.1. Chạy trên thiết bị giả lập hoặc thật
1️⃣ Kiểm tra danh sách thiết bị có sẵn:

flutter devices
2️⃣ Chạy ứng dụng:

flutter run
Hoặc chỉ định nền tảng cụ thể:

Android:
flutter run -d android

iOS: (Chỉ chạy được trên macOS)
flutter run -d ios

Web: (Cần bật Flutter web support)
flutter run -d chrome

3.2. Chạy ứng dụng với hot reload (giúp cập nhật code nhanh hơn)
Sau khi chạy flutter run, bạn có thể nhấn "r" để reload nhanh hoặc "R" để restart ứng dụng.

🛠 4. Cấu hình Firebase (nếu cần)
Nếu dự án sử dụng Firebase, cần thực hiện các bước sau:

Tạo Firebase project tại Firebase Console
Tải file cấu hình và đặt vào thư mục:
Android: /android/app/google-services.json
iOS: /ios/Runner/GoogleService-Info.plist
Chạy lệnh để liên kết Firebase với Flutter:
flutterfire configure

🧪 5. Chạy kiểm thử (Unit Test, Integration Test)
Để đảm bảo ứng dụng hoạt động đúng, bạn có thể chạy test bằng lệnh:
flutter test

📌 6. Các lỗi thường gặp & cách khắc phục
Error: Dart SDK is not found : Kiểm tra xem bạn đã cài đặt Flutter và Dart chưa (flutter doctor).
Gradle build failed : Chạy flutter clean rồi flutter pub get để làm sạch cache.
Device not found : Kiểm tra thiết bị bằng flutter devices. Nếu chưa có, bật trình giả lập hoặc cắm điện thoại vào.
iOS build failed : Đảm bảo đã cài Xcode và chạy pod install trong thư mục ios/.

📄 7. Thông tin bổ sung
Tài liệu Flutter: https://flutter.dev/docs
Tài liệu Firebase: https://firebase.flutter.dev/docs/overview