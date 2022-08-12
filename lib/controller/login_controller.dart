import 'package:flutter/material.dart';
import 'package:winsocial/controller/notification_controller.dart';
// import 'package:winsocial/models/app_notification.dart';

class LoginController extends ChangeNotifier {
  String cpf = '';
  String password = '';
  bool isAuthenticated = false;
  bool isRequesting = false;

  Future<void> login(
    NotificationController notificationController,
  ) async {
    isRequesting = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isRequesting = false;
    notifyListeners();
    isAuthenticated = true;
    // notificationController.addNotification(
    //   AppNotification(
    //     message: 'Login ou Senha incorretos.',
    //   ),
    // );

    notifyListeners();
  }

  bool validate() {
    return (cpf.length == 11 && password.trim().isNotEmpty);
  }

  setCpf(String value) {
    cpf = value.trim().replaceAll('.', '').replaceAll('-', '');
    notifyListeners();
  }

  setPassword(String value) {
    password = value.trim();
    notifyListeners();
  }
}
