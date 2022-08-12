import 'package:flutter/material.dart';
import 'package:winsocial/controller/login_controller.dart';
import 'package:winsocial/controller/notification_controller.dart';
import 'package:winsocial/shared/constants.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.loginController,
    required this.notificationController,
    required this.onTap,
  }) : super(key: key);

  final LoginController loginController;
  final NotificationController notificationController;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: InkWell(
        onTap: loginController.isRequesting ? null : onTap,
        splashFactory: NoSplash.splashFactory,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        mouseCursor: SystemMouseCursors.click,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 175,
            height: 20,
            child: Center(
              child: AnimatedBuilder(
                animation: loginController,
                builder: (context, child) {
                  if (loginController.isRequesting) {
                    return SizedBox(
                      width: 20,
                      child: CircularProgressIndicator(
                        color: constants.primary,
                        strokeWidth: 3,
                      ),
                    );
                  } else {
                    return Text(
                      'ACESSAR CONTA',
                      style: TextStyle(
                        color: constants.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
