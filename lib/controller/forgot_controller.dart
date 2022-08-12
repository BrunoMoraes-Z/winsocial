import 'package:flutter/material.dart';
import 'package:winsocial/controller/notification_controller.dart';
import 'package:winsocial/models/app_notification.dart';

class ForgotController extends ChangeNotifier {
  final NotificationController notificationController;
  late String email = '';
  late String phone = '';

  ForgotController({required this.notificationController});

  final String _pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  bool validate() {
    final status = email.isNotEmpty
        ? RegExp(_pattern).hasMatch(email)
        : phone.length == 11;
    if (email.isEmpty && phone.isEmpty) {
      notificationController.addNotification(
        const AppNotification(message: 'Informe um E-mail ou um telefone.'),
      );
    } else {
      if (!status) {
        if (phone.isNotEmpty) {
          notificationController.addNotification(
            const AppNotification(message: 'Número de telefone inválido.'),
          );
        }
        if (email.isNotEmpty) {
          notificationController.addNotification(
            const AppNotification(message: 'E-mail inválido.'),
          );
        }
      }
    }

    return status;
  }

  bool isEmailEnabled() {
    return phone.isEmpty;
  }

  bool isPhoneEnabled() {
    return email.isEmpty;
  }

  setEmail(String value) {
    email = value.trim();
    notifyListeners();
  }

  setPhone(String value) {
    phone =
        value.trim().replaceAll(RegExp(r'[\(\)-.]'), '').replaceAll(' ', '');
    notifyListeners();
  }
}
