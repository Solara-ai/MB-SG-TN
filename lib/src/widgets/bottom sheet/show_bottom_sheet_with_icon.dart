import 'package:flutter/material.dart';

class ShowBottomSheetWithIcon {
  static void showBottomSheetWithIcon({String ? message , required BuildContext context , IconData ? icon , Color ? colorIcon}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon ,  color: colorIcon, size: 40),
              SizedBox(height: 8),
              Text(
                message ?? '',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}